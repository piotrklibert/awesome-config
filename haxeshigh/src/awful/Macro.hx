package awful;

import utils.lua.Macro.T;
import utils.lua.Macro.A;
import utils.lua.Macro.TA;
import haxe.macro.Expr;

using haxe.macro.ExprTools;
using Lambda;


class Macro {
  public static macro function leaf(expr: Expr) {
    return macro Wibox.makeWidget(T($e{expr}));
  }
}
