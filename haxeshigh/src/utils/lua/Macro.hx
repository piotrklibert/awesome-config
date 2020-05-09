package utils.lua;

import haxe.macro.Expr;

class Macro {
  public static macro function asTable(x: Expr) {
    return macro untyped __lua_table__($e{x});
  }
  public static macro function timestamp() {
    return macro Std.string($v{Date.now().getTime()});
  }
}
