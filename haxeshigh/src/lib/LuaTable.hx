package lib;

typedef TableKey = EitherType<String, Int>;

// TODO
typedef LuaList<V> = LuaTable<Int, V>;
typedef LuaMap<K, V> = LuaTable<K, V>;
typedef LuaStringMap<V> = LuaTable<String, V>;


@:tink
@:publicFields
@:nullSafety(Strict)
abstract LuaTable<K, V>(Table<K, V>) from Table<K, V> to Table<K, V> {

    function new(t: Table<K, V>) this = t;

    function toMap(): Map<String, V> {
        final iter = lua.PairTools.pairsIterator(this);
        return [ for (o in iter) (cast o.index : String) => o.value ];
    }

    function toArray(): Array<V> {
        return lua.Table.toArray(cast this);
    }

    function toObject() {
        return lua.Table.toObject(cast this);
    }

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
            @:nullSafety(Off) untyped t[x] = null;
        return t;
    }

    // Accessors
    @:op([])
    public inline function arrayRead<T: TableKey>(n: T): Null<V>
        return untyped this[n];

    @:op([])
    public inline function arrayWrite<T: TableKey>(n: T, val: V): V
        return untyped this[n] = val;


    // Implicit casts (order matters!!)
    @:from
    static public inline function fromMap<K, V>(m: haxe.ds.Map<K, V>): LuaTable<K, V> {
        // NOTE: StringMaps on Lua are built around a table stored in .h key
        return untyped m.h;
    }

    @:from
    static public function fromArray<V>(arr: Array<V>): LuaTable<Int, V> {
        return lua.Table.fromArray(arr);
    }

    @:from
    static public function fromObject(obj: {}): LuaTable<String, Dynamic> {
        return untyped {
            obj["__fields__"] = null;
            obj;
        };
    }
}
