package lib;

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



typedef LuaList<V> = LuaTable<Int, V>;
typedef LuaMap<K, V> = LuaTable<K, V>;
typedef LuaStringMap<V> = LuaTable<String, V>;


@:publicFields
abstract LuaTable<K, V>(Table<K, V>) from Table<K, V> to Table<K, V> {

    inline function fields() {
        return Reflect.fields(this);
    }

    // inline function merge(other: LuaTable<K, V>) {
    //     for (f in other.fields())
    //         this.arrayWrite(f, other.arrayRead(cast f));
    //     return this;
    // }

    inline function without(...args: K) {
        final t = this;
        for (x in args)
            untyped t[x] = null;
        return t;
    }
    // static function without<K, V>(table: Table<K, V>, ...args: K): Table<K, V> {
    //     final t = table;
    //     for (x in args)
    //         untyped t[x] = null;
    //     return t;
    // }


    // Accessors
    @:op([ ]) public function arrayRead(n: Dynamic): V
        return untyped this[n];

    @:op([ ]) public function arrayWrite(n: Dynamic, val: V)
        return untyped this[n] = val;


    // Implicit casts (order matters!!)
    @:from
    static public inline function fromMap<K, V>(m: haxe.ds.Map<K, V>): LuaTable<K, V> {
        // StringMaps on Lua are built around a table stored in .h key
        return untyped m.h;
    }

    @:from
    static public inline function fromArray<V>(arr: Array<V>): LuaTable<Int, V> {
        return lua.Table.fromArray(arr);
    }

    @:from
    static public function fromObject(obj: {}): LuaTable<String, Dynamic> {
        return untyped {
            obj["__fields__"] = null;
            obj;
        };
    }

    // function toString() {
    //     return Inspect.inspect(this);
    // }
}
