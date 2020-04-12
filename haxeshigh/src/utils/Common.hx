package utils;

import lua.Lua;
import lua.Table;
import haxe.ds.StringMap;

import utils.lua.Common;
import lua.Package;
using StringTools;

typedef Log = utils.FileLogger;

typedef KeyFunc<T> = (Dynamic) -> T;



class Common {
  public static var ident: KeyFunc<Dynamic> = (x) -> x;

  @:nullSafety(Strict)
  public static function filterIn<T>(s: Array<T>, ?t: KeyFunc<T>) {
    final tt: KeyFunc<T> = (t == null ? ident : t);
    return function (x: Dynamic): Bool {
      Log.log(Lua.type(x));
      Log.log(tt(x));
      return s.indexOf(tt(x)) != -1;
    }
  }

  public static function mkLua() {
    return untyped __lua__("{}");
  }

  public static inline function mapToTable<T>(map: StringMap<T>): LuaTable {
    // StringMaps on Lua are built around a table stored in .h key
    return untyped map.h;
  };


  public static function structToTable(s: Dynamic): LuaTable {
    final obj: LuaTable = mkLua();
    for(i in Reflect.fields(s)) untyped {
      obj[i] = s[i];
    }
    return obj;
  }

  public static function check_path() {
    if ( !Package.path.contains("haxeshigh/build") ) {
      Package.path = "/home/cji/portless/lua/awesome-config/haxeshigh/build/?.lua;" + Package.path;
    }
  }
}
