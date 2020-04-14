package utils.lua;

import lua.Table;

using lua.PairTools;
import haxe.extern.EitherType;


typedef LuaTable = Table<EitherType<Int, String>, Dynamic>;

typedef StringTable<V> = Table<String, V>;
typedef IntTable<V> = Table<Int, V>;

typedef MixedTable<V> = Table<EitherType<String, Int>, V>;


class LuaTools {
  public static function table(): LuaTable {
    return untyped __lua__("{}");
  }
}
