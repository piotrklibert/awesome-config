package awful;

import utils.lua.Macro;
import haxe.macro.Expr;

using haxe.macro.ExprTools;
using Lambda;


class WidgetTools {
  public static macro function wrap1(attrs: Expr, w: Expr) {
    return macro awful.Widget.widget(untyped __lua_table__($e{attrs}, [$e{w}]));
  }

  public static macro function wrap2(attrs: Expr, w1: Expr, w2: Expr) {
    return macro awful.Widget.widget(untyped __lua_table__($e{attrs}, [$e{w1}, $e{w2}]));
  }

  public static macro function wrap3(attrs: Expr, w1: Expr, w2: Expr, w3: Expr) {
    return macro awful.Widget.widget(untyped __lua_table__($e{attrs}, [$e{w1}, $e{w2}, $e{w3}]));
  }
}
