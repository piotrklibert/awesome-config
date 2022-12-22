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

@:publicFields
abstract LuaTable<K, V>(Table<K, V>) from Table<K, V> to Table<Dynamic, Dynamic> {

    inline function fields() {
        return Reflect.fields(this);
    }

    inline function merge<K1, V1>(other: LuaTable<K1, V1>) {
        for (f in other.fields())
            untyped this[f] = other[f];
        return this;
    }

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
    @:op([ ]) public function arrayRead(n: TableKey): V
        return untyped this[n];

    @:op([ ]) public function arrayWrite(n: TableKey, val: V)
        return untyped this[n] = val;

    @:op(a.b) public function fieldRead(name: String): V
        return untyped this[name];

    @:op(a.b) public function fieldWrite<T>(name: String, val: T): T
        return untyped this[name] = val;


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
