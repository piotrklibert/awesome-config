package utils.lua;

import haxe.macro.Expr;
using haxe.macro.ExprTools;


@:tink
class Macro {
  public static var counter = 0;

  public static macro function asTable(x: Expr) {
    return macro untyped __lua_table__($e{x});
  }

  public static macro function asTable2(x: Expr) {
    return macro (untyped __lua_table__($e{x}) : lua.Table.AnyTable);
  }

  public static macro function withProps(array: Expr, props: Expr) {
    final array = macro utils.lua.Macro.asTable2($array);

    final tmpName = "_tmp_" + (counter++);
    final tmpConst = EConst(CIdent(tmpName));
    function here(ed: ExprDef): Expr
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
