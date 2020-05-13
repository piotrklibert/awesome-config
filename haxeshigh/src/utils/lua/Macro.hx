package utils.lua;

import haxe.macro.Expr;
using haxe.macro.ExprTools;

// import haxe.macro.Context.*;
// import haxe.macro.TypeTools.*;
// import haxe.macro.MacroStringTools.*;




@:tink
class Macro {

  public static macro function asTable(x: Expr) {
    return macro untyped __lua_table__($e{x});
  }

  public static macro function asTable2(x: Expr) {
    return macro (untyped __lua_table__($e{x}) : lua.Table.AnyTable);
  }

  public static macro function asTableWith(x: Expr, a: Expr) {
    // trace(ExprTools.toString(x));
    // trace(ExprTools.toString(a));
    return macro {
      final t = utils.lua.Macro.asTable($e{x});
      final a = utils.lua.Macro.asTable($e{a});
      [t, a].asTable();
    };
  }

  public static macro function withProps(array: Expr, props: Expr) {
    final array = macro utils.lua.Macro.asTable2($array);

    final tmpName = "tmp_2";
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
    // switch props.expr {
    //   case EObjectDecl(a):
    //     // trace(a);
    //   final l: Array<Expr> = [for(x in a)
   // ]; {
    //     // trace(EBinop(OpAssign, (macro a), (macro 2)));
    //     // trace([x.field, x.expr]);
    //     // return macro "";
    //     // case EBlock([{expr: EBinop(a, b, x)}]): trace(b);
    //     trace(l);
    //     // final zz = macro x.field = x;
    //     // switch zz {
    //     //   case {expr: EBinop(OpAssign, a, b)}:
    //     //     trace(a);
    //     //   trace(b);
    //     //   default:
    //     //     trace("fuuuck");
    //       // }
    //     // return macro 1;
    //     final xx =  {pos: array.pos, expr: EConst(CIdent("tmp"))};
    //     return macro { $e{arr}; untyped $a{l}; $e{xx}; };
    //     };
    //   default:
    // }
    return macro {
      435;
      // utils.lua.Macro.asTable($e{array});
      // final t = utils.lua.Macro.asTable($e{x});
      // final a = utils.lua.Macro.asTable($e{a});
      // [t, a].asTable();
    };
  }


  public static macro function timestamp() {
    return macro Std.string($v{Date.now().getTime()});
  }
}
