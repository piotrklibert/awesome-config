package utils.lua;

import haxe.macro.Expr;
using haxe.macro.ExprTools;
using Lambda;


@:tink
class Macro {
  public static var counter = 0;

  public static macro function asUntypedTable(x: Expr) {
    return macro untyped __lua_table__($e{x});
  }

  public static macro function castTable(x: Expr) {
    return macro (untyped __lua_table__($e{x}) : lua.Table.AnyTable);
  }

  // pair
  public static macro function P(obj1, obj2) {
    // trace(obj1, obj2);
    return macro (untyped __lua_table__(([$e{obj1}, $e{obj2}] : Array<Dynamic>)));
  }


  public static macro function widget(obj: Expr): Expr {
    return macro awful.Wibox.makeWidget(utils.lua.Macro.declareWidget($obj));
  }


  public static macro function declareWidget(obj: Expr): Expr {
    final pos = haxe.macro.Context.currentPos();
    return toLua(pos, obj);
  }

  static function toLua(pos: Dynamic, obj: Expr): Expr {
    inline function here(ed: ExprDef): Expr
      return {pos: pos, expr: ed};

    function filterFn(x: ObjectField) {
      return switch x {
        case {field: f, expr: e} if (f == "children"): true;
        default: false;
      }
    }

    return switch obj.expr {
      case EObjectDecl(props):
        final kids = props.filter(filterFn);
        final props = props.filter(x -> !filterFn(x)).map((x) ->
          switch x {
            case {field: f, expr: e}:
              ({field: f, expr: toLua(pos, e)} : ObjectField);
        });
      if (kids.length > 0) {
        final kids = switch kids[0].expr.expr {
          case EArrayDecl(arr):
            arr.map((x) -> toLua(pos, x));
          default:
            [macro untyped __lua_table__([])];
        }
        macro utils.lua.Macro.withProps(
          $a{kids},
          $e{here(EObjectDecl(props))}
        );
      }
      else {
        macro untyped __lua_table__($e{here(EObjectDecl(props))});
      }

      case EArrayDecl(arr):
        final arr = arr.map((x) -> toLua(pos, x));
        macro untyped __lua_table__($e{here(EArrayDecl(arr))});
      default:
        macro $obj;
    }
  }

  public static macro function withProps(array: Expr, ?props: Expr) {
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
      default:
        [];
    }

    final result: Array<Expr> = [initVars].concat(assigns).concat([ref]);

    return macro { untyped $b{result}; };
  }


  public static macro function timestamp() {
    final ts = Std.int(Date.now().getTime()/1000);
    return macro Std.string($v{ts});
  }

}
