package utils.lua;

import lua.Table;

using lua.PairTools;
import haxe.extern.EitherType;



typedef StringTable<V> = Table<String, V>;
typedef IntTable<V> = Table<Int, V>;

typedef MixedTable<V> = Table<EitherType<String, Int>, V>;

typedef LuaTable = MixedTable<Dynamic>;


abstract ATable<V>(MixedTable<V>) {
  public inline function new(t: MixedTable<V>) {
    this = t;
  }

  @:from
  static public function fromArray<T>(a: Array<T>) {
    return cast Table.fromArray(a);
  }

  @:to
  public function toTable<K, V>(): Table<K, V> {
    return cast this;
  }


}



class LuaTools {
  public static function aTest() {
    final x: ATable<Int> = [3];
    Table.insert(x, 3);
  }

  public static function table(): LuaTable {
    return untyped __lua__("{}");
  }

  public static inline function asTable(o: Dynamic): LuaTable {
    return cast o;
  }

  public static inline function add(t: LuaTable, o: Dynamic): Void {
    Table.insert(cast t, o);
  }

}
