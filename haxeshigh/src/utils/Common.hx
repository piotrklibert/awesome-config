package utils;

import lua.Table;
import lua.Package;

import log.Log;
import utils.lua.LuaTools.LuaTable;

using StringTools;
using utils.NullTools;


typedef Named = {
  var name(default, null): String;
};

typedef Point = {x: Int, y: Int};
typedef Geometry = { > Point, width: Int, height: Int};
typedef KeyFun<T> = (Named) -> T;
typedef FilterFun<T> = (T) -> Bool;



// @:expose
@:nullSafety(Strict)
class Common {
  static final ident: KeyFun<Dynamic> = (x) -> x;

  public static function formatSimpleEx(exception: String): String {
    final ex = Std.string(exception);
    // TODO: the fuck?! whyyy? .sure() alone doesnt work! Also, auto-indent is broken here.
    final formatted = @:nullSafety(Off) ex.split(":").join("\n").sure();
    return formatted;
  }

  @:nullSafety(Off)
  public static function check_path() {
    if ( !Package.path.contains("haxeshigh/output") ) {
      Package.path = "/home/cji/portless/lua/awesome-config/haxeshigh/output/?.lua;" + Package.path;
    }
  }
}
