package utils;

import lua.Table;
import lua.Package;
import haxe.ds.StringMap;
import utils.lua.LuaTools.LuaTable;

using StringTools;


typedef Named = {
  var name(default, null): String;
};

typedef Log = utils.FileLogger;

typedef KeyFun<T> = (Named) -> T;
typedef FilterFun<T> = (T) -> Bool;


@:nullSafety(Strict)
class Common {
  static final ident: KeyFun<Dynamic> = (x) -> x;

  public static function filterIn<T: Named>(s: Array<T>, ?t: KeyFun<T>): FilterFun<T> {
    final transform: KeyFun<T> = (t == null ? ident : t);
    return function (x: T): Bool {
      return s.indexOf(transform(x)) != -1;
    }
  }

  public static function mkLua(): LuaTable {
    return untyped __lua__("{}");
  }

  /**
  StringMaps on Lua are built around a table stored in .h key
  **/
  public static inline function mapToTable<T>(map: StringMap<T>): LuaTable {
    return untyped map.h;
  };

  /**
  Same as Table.fromDynamic, but returns LuaTable instead of Table.
  **/
  public static function structToTable(s: Dynamic): LuaTable {
    return Table.fromDynamic(s);
  }

  public static function check_path() {
    if ( !Package.path.contains("haxeshigh/build") ) {
      Package.path = "/home/cji/portless/lua/awesome-config/haxeshigh/build/?.lua;" + Package.path;
    }
  }
}
