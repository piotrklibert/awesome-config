package lib;

import haxe.macro.Expr;
import haxe.macro.Context;

using Lambda;
using haxe.macro.ExprTools;
using haxe.macro.TypeTools;

@:tink
@:publicFields
class LuaMacros {
    static var counter = 0;

    static macro function asUntypedTable(x: Expr) {
        return macro untyped __lua_table__($e{x});
    }

    static inline macro function castTable(x: Expr) {
        return macro untyped __lua_table__($e{x});
    }

    static macro function T(x: Expr) {
        return macro untyped __lua_table__($e{x});
    }

    static macro function A(x: Expr) {
        return macro untyped __lua_table__($e{x});
    }

    static macro function TA(x: Expr, y: Expr) {
        final c = switch y.expr {
            case EArrayDecl(content):
                content.map((c) -> switch c.expr {
                    case EObjectDecl(_):
                        macro T($c);
                    default:
                        macro $c;
                });
            default:
                [];
        };
        return macro (untyped __lua_table__($e{x}, $a{c}));
    }

    static macro function AT(x: Expr, y: Expr) {
        return macro (untyped __lua_table__($e{y}, $e{x}) : lua.Table.AnyTable);
    }

    static macro function unwrapCallbacks(expr: Expr) {
        final funs = [];
        switch (expr) {
            case {expr: EObjectDecl(fields)}:
                for (field in fields) switch (Context.typeof(field.expr)) {
                    case TFun(_, _): funs.push(field);
                    default:
                }
            default:
        }
        final out = [];
        final name = '_unwrap${counter++}';
        out.push(macro final $name = ${expr});
        for (ff in funs) {
            final sf = EConst(CString(ff.field, DoubleQuotes));
            final sf = {expr: sf, pos: Context.currentPos()};
            out.push(macro Reflect.setField($i{name}, $sf, $e{ff.expr}));
        }
        out.push(macro $i{name});
        // trace((macro {$b{out}}).toString());

        return macro {$b{out}};
    }

    static macro function wrap1(attrs: Expr, w: Expr) {
        final argh = [
            switch w.expr {
                case EObjectDecl(_):
                    macro T($e{w});
                default:
                    macro $w;
            }
        ];
        return macro (untyped __lua_table__($e{attrs}, $a{argh}));
    }

    static macro function wrap2(attrs: Expr, w1: Expr, w2: Expr) {
        final argh = [
            switch w1.expr {
                case EObjectDecl(_):
                    macro T($e{w1});
                default:
                    macro $w1;
            },
            switch w2.expr {
                case EObjectDecl(_):
                    macro T($e{w2});
                default:
                    macro $w2;
            }
        ];
        return macro (untyped __lua_table__($e{attrs}, $a{argh}));
    }

    static macro function wrapN(attrs: Expr, ws: Array<Expr>) {
        final argh = [
            for(w in ws) switch w.expr {
                case EObjectDecl(_):
                    macro T($w);
                default:
                    macro $w;
            }
        ];
        return macro (untyped __lua_table__($e{attrs}, $a{argh}));
    }

    // pair
    static macro function P(obj1, obj2) {
        // trace(obj1, obj2);
        return macro (untyped __lua_table__([$e{obj1}, $e{obj2}]) : utils.lua.LuaTools.LuaTable);
    }


    static macro function widget(obj: Expr): Expr {
        return macro awful.Wibox.makeWidget(utils.lua.Macro.declareWidget($obj));

    }

    static macro function declareWidget(obj: Expr): Expr {
        final pos = haxe.macro.Context.currentPos();
        return toLua(pos, obj);
    }

    static function toLua(pos: Dynamic, obj: Expr): Expr {
        trace(obj);
        inline function here(ed: ExprDef): Expr {
            return {pos: pos, expr: ed};
        }

        function filterFn(x: ObjectField) {
            return switch x {
                case {field: f, expr: e} if (f == "children"): true;
                default: false;
            }
        }

        return switch obj.expr {
            case EObjectDecl(props):
                final kids = props.filter(filterFn);
                final props = props
                    .filter(x -> !filterFn(x))
                    .map(
                        (x) ->
                            switch x {
                            case {field: f, expr: e}:
                                ({field: f, expr: toLua(pos, e)} : ObjectField);
                            }
                    );
                if (kids.length > 0) {
                    final kids = switch kids[0].expr.expr {
                        case EArrayDecl(arr):
                            arr.map((x) -> toLua(pos, x));
                        default:
                            [macro untyped __lua_table__([])];
                    }
                    macro AT($a{kids}, $e{here(EObjectDecl(props))});
                }
                else {
                    // trace(props);
                    trace(pos);
                    macro T($e{here(EObjectDecl(props))});
                }

            case EArrayDecl(arr):
                final arr = arr.map((x) -> toLua(pos, x));
                macro untyped __lua_table__($e{here(EArrayDecl(arr))});
            default:
                trace('obj: ${obj.expr}');
                macro $obj;
            }
    }

    static macro function withArray(props: Expr, ?array: Expr) {
        return macro withProps($e{array}, $e{props});
    }

    static macro function withProps(array: Expr, ?props: Expr) {
        switch [array.expr, props] {
            case [EObjectDecl(_), null]:
                props = array;
                array = macro [];
            case [EArrayDecl(_), null]:
                props = macro {};
            default:
        }
        final array = macro utils.lua.Macro.castTable($array);

        final tmpName = "_tmp_" + (counter++);
        final tmpConst = EConst(CIdent(tmpName));
        inline function here(ed: ExprDef): Expr
            return {pos: haxe.macro.Context.currentPos(), expr: ed};
        final vDecl = {
            name: tmpName, expr: here(array.expr),
            isFinal: false, type: null
        };
        final ref: Expr = here(tmpConst);
        final initVars: Expr = here(EVars([vDecl]));

        final assigns = switch props.expr {
            case EObjectDecl(fields): [
                for (field in fields) {
                    final field1 = here(EField(here(tmpConst), field.field));
                    here(EBinop(OpAssign, field1, field.expr));
                }
            ];
            default: [];
        }

        final result: Array<Expr> = [initVars].concat(assigns).concat([ref]);

        return macro { untyped $b{result}; };
    }


    static macro function timestamp() {
        final ts = Std.int(Date.now().getTime()/1000);
        return macro Std.string($v{ts});
    }
}
