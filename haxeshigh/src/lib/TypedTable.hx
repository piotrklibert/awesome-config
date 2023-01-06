package lib;


@:publicFields
@:nullSafety(Strict)
private class Helpers {
    static var uniqueCount = 1;

#if macro
    public static function followTypesUp(arg: Type): Array<ClassField> {
        return switch (arg) {
            case TAnonymous(_.get().fields => fields):
                fields;
            case TAbstract(_, [type]):
                followTypesUp(type);
            case TType(_, _):
                followTypesUp(arg.follow());
            case other:
                trace("other", other);
                throw "dead end 2?";
        }
    }

    static function extractObjFields(objExpr: Expr) {
        final te = Context.typeExpr(objExpr);
        final expr = Context.getTypedExpr(te).expr;
        // trace(({expr: expr, pos: null}));
        // trace(new Printer().printExpr({expr: expr, pos: null}));

        return switch expr {
            case EObjectDecl(inputFields):
                final inputFields = inputFields.copy();
                final exprs = [for (f in inputFields) f.field => f.expr];
                {fieldExprs: exprs, inputFields: inputFields};

            case _:
                throw "Must be called with an anonymous object";
        }
    }

    static function objToTable(fields: Array<ObjectField>, pos: Position): Expr {
        final fields = [
            for (f in fields) {
                {field: f.field, expr: exprToTable(f.expr)}
            }
        ];
        final objExpr:Expr = {expr: EObjectDecl(fields), pos: pos};
        return macro lua.Table.create(null, $objExpr);
    }

    static function arrayToTable(obj: Expr): Expr {
        final values = ExprTools.map(obj, exprToTable);
        return macro lua.Table.create(${values}, null);
    }

    static function exprToTable(obj: Expr): Expr {
        return switch (obj.expr) {
            case EObjectDecl(fields):
                objToTable(fields, obj.pos);
            case EArrayDecl(values):
                arrayToTable(obj);
            case _:
                ExprTools.map(obj, exprToTable);
        }
    }

    static function convert(ex: Expr) {
        var expected = Context.getExpectedType();
        var complexType = expected.toComplexType();

        switch expected {
            case TAbstract(_, [_]) | TType(_, _):
                final fields = followTypesUp(expected);
                final x = extractObjFields(ex);
                final inputFields = x.inputFields;
                final fieldExprs = x.fieldExprs;

                var objFields: Array<ObjectField> = [for (f in fields) {
                    final currentFieldExpression = fieldExprs.get(f.name);
                    switch (f.type) {
                        case _.toComplexType() => (macro : Array<String>):
                            final field_expr =
                                macro lua.Table.create(${fieldExprs.get(f.name)});
                            {field: f.name, expr: field_expr};

                        case TAbstract(_.toString() => "TypedTable", [_]):
                            var ct = f.type.toComplexType();
                            for (inf in inputFields) if (inf.field == f.name) {
                                inf.expr = macro(TypedTable.check(${inf.expr}) : $ct);
                                break;
                            }

                            {
                                field: f.name,
                                expr: macro(TypedTable.fromExpr(${fieldExprs.get(f.name)}) : $ct)
                            };

                        case TAnonymous(_):
                            trace(f.name);
                            trace(fieldExprs);
                            {
                                field: f.name,
                                expr: exprToTable(fieldExprs.get(f.name))
                            };

                        case _:
                            final xx = fieldExprs.get(f.name);
                            if (xx == null) continue;
                            {
                                field: f.name,
                                expr: exprToTable(xx)
                            };
                    }
                }];

                var inputObj = {expr: EObjectDecl(inputFields), pos: ex.pos};
                var obj = {expr: EObjectDecl(objFields), pos: ex.pos};

                final name = '_dce${uniqueCount++}';
                return macro @:mergeBlock {
                    // Type checking; should be removed by dce
                    @:pos(ex.pos)
                    final $name: $complexType = lib.TypedTable.check($inputObj);

                    // Actual table creation
                    (cast lua.Table.create(null, $obj) : $complexType);
                };

            case other:
                trace(complexType);
                // trace(followTypesUp(other));
                throw "TypedTable<T> only works with anonymous objects";
        }
    }
    #end
}


abstract TypedTable<T: {}>(#if macro Dynamic #else lua.Table<String, Dynamic> #end) {
    @:pure
    @:noCompletion
    public extern static function check<T: {}>(v: T): TypedTable<T>;

    @:from
    public static macro function fromExpr(ex: Expr): Expr {
        switch Context.getTypedExpr(Context.typeExpr(ex)).expr {
            case EObjectDecl(_):
                return Helpers.convert(ex);
            default:
                final complexType = Context.getExpectedType().toComplexType();
                return macro {
                    final ch: $complexType = lib.TypedTable.check($ex);
                    cast lua.Table.fromDynamic($ex);
                }
        }
    }
}
