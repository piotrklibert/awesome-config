package utils.lua;

import lua.Table;

using lua.PairTools;
import haxe.extern.EitherType;


typedef TTable<T,U> = lua.Table<T, U>;
typedef TAnyTable = AnyTable;

typedef StringTable<V> = Table<String, V>;
typedef IntTable<V> = Table<Int, V>;
typedef TableKey = EitherType<String, Int>;
typedef MixedTable<V> = Table<TableKey, V>;

typedef TMacro = utils.lua.Macro;


abstract LuaTable(AnyTable)
  from MixedTable<Any>
  from AnyTable
  from Table<Any, Any>
  to AnyTable
  to Table<Dynamic, Dynamic> {

  public inline function fields() {
    return Reflect.fields(this);
  }

  public function merge(other: LuaTable) {
    for (f in other.fields())
      untyped this[f] = other[f];
    return this;
  }


  // Accessors
  @:op([])
  public function arrayRead(n: TableKey): Any
    return untyped this[n];

  @:op([])
  public function arrayWrite(n: TableKey, val: Any)
    return untyped this[n] = val;

  @:op(a.b)
  public function fieldRead(name: String): Any
    return untyped this[name];

  @:op(a.b)
  public function fieldWrite<T>(name: String, val: T): T
    return untyped this[name] = val;


  // Implicit casts (order matters!!)
  @:from
  static public inline function fromMap<K, V>(m: haxe.ds.Map<K, V>): LuaTable {
    // StringMaps on Lua are built around a table stored in .h key
    return untyped m.h;
  }

  @:from
  static public inline function fromArray(arr: Array<Dynamic>): LuaTable {
    return lua.Table.fromArray(arr);
  }

  @:from
  static public function fromObject(obj: Null<{}>): LuaTable {
    return [for(f in Reflect.fields(obj)) f => Reflect.field(obj, f)];
  }
}

class LuaTools {

}
