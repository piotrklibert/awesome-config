package volume;

import lua.Table;
import lua.Table.AnyTable;
import haxe.Rest;

import lib.Inspect.inspect;

import awful.Naughty;
import utils.lua.Macro.T;
import utils.lua.Macro.A;
import taglist.TaglistAnimator;
import haxe.ds.Option;


using Safety;
using utils.OptionTools;

@:luaRequire("gears.table")
extern class GT {
  @:overload(function (t: {}, ts: Rest<{}>): AnyTable {})
  public static function join(t: AnyTable, ts: Rest<AnyTable>): AnyTable;
}



class Volume {

  public static function nvm() {
    return "";
  }

  public static function main() {
    final s = "zażółć gęślą jaźń";
    trace(inspect(GT.join({aa: 3}, A([2, 3, 4]), {})));
    Naughty.notify(T({text: s.substr(0, 3)}));
  }
}
