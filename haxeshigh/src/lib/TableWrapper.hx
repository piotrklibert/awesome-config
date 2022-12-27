package lib;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;

using haxe.macro.TypeTools;
#end

#if macro
abstract TableWrapper< T:{} >(Dynamic) {
#else
abstract TableWrapper< T:{} >(lua.Table< String, Dynamic >) {
#end
    @:pure @:noCompletion
    extern public static inline function check< T:{} >(v:T):TableWrapper< T > {
        return null;
    };

    @:from
    public static macro function fromExpr(e:Expr):Expr {
        var expected = Context.getExpectedType();
        var ct = expected.toComplexType();

        switch expected {
        case TAbstract(_, [TAnonymous(_.get().fields => fields)]):
            switch Context.getTypedExpr(Context.typeExpr(e)).expr {
            case EObjectDecl(inputFields):
                var inputFields = inputFields.copy();
                var fieldExprs = [for (f in inputFields) f.field => f.expr];

                var objFields:Array< ObjectField > = [for (f in fields) {
                    switch (f.type) {
                    case _.toComplexType() => macro:Array< String >:{
                        field:f.name,
                        expr:macro
                        lua.Table.create
                        (${fieldExprs.get(f.name)})
                    };

                    case TAbstract(_.toString() => "TableWrapper", [_]):
                        var ct = f.type.toComplexType();

                        for (inf in inputFields) if (inf.field == f.name) {
                            inf.expr = macro(TableWrapper.check(${inf.expr}) : $ct);
                            break;
                        }

                        {field: f.name, expr: macro(TableWrapper.fromExpr(${fieldExprs.get(f.name)}) : $ct)};

                    case _:
                        {field: f.name, expr: macro ${fieldExprs.get(f.name)}};
                    }
                }];

                var inputObj = {expr: EObjectDecl(inputFields), pos: e.pos};
                var obj = {expr: EObjectDecl(objFields), pos: e.pos};

                return macro @:mergeBlock {
                    // Type checking; should be removed by dce
                    @:pos(e.pos) var _:$ct = TableWrapper.check($inputObj);

                    // Actual table creation
                    (cast lua.Table.create(null, $obj) : $ct);
                };

            case _:
                throw "Must be called with an anonymous object";
            };

        case _:
            throw "TableWrapper<T> only works with anonymous objects";
        }
    }
}
