package lib;

typedef TableKey = EitherType<String, Int>;


typedef LuaList<V> = LuaTable<Int, V>;
typedef LuaMap<K, V> = LuaTable<K, V>;
typedef LuaStringMap<V> = LuaTable<String, V>;

#if !macro
typedef Table<K, V> = lua.Table<K, V>;
#else
typedef Table<K, V> = Dynamic;
#end
@:tink
@:publicFields
@:nullSafety(Strict)
#if !macro
abstract LuaTable<K, V>(Table<K, V>) from Table<K, V> to Table<K, V> {
#else
abstract LuaTable<K, V>(Dynamic)  {
#end
    function new(t: Table<K, V>) this = t;

    public macro function arrayOf(_this: Expr, type: Expr) {
        final tname = switch (type) {
            case {expr: EConst(CIdent(x))}:
                {pack: [], name: x};
            case {expr: EField(a, b, c)}:
                final x = getPath(type);
                final pack = x.slice(1);
                pack.reverse();
                {pack: pack, name: x[0]};
            default:
                {pack: [], name: type.toString()};
        }
        trace(tname);
        final type = TPath(tname);
        return macro (cast $_this : Array< $type >);
    }

    #if macro
    static function getPath(ex: Expr) {
        switch (ex) {
            case {expr: EField(a, b, c)}:
                return [b].concat(getPath(a));
            case {expr: EConst(CIdent(x))}:
                return [x];
            default:
                return [];
        }
    }
    #end

    #if !macro
    function toMap(): haxe.ds.ObjectMap<K, V> {
        final ret = new haxe.ds.ObjectMap();
        for (o in lua.PairTools.pairsIterator(this))
            ret.set(o.index, o.value);
        return ret;
    }

    function toStringMap(): Map<String, V> {
        final iter = lua.PairTools.pairsIterator(this);
        final tos: (Dynamic) -> String = lib.Globals.get()["tostring"];
        return [ for (o in iter) tos(o.index) => o.value ];
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

    inline function without(...args: K) {
        final t = this;
        for (x in args)
            @:nullSafety(Off) untyped t[x] = null;
        return t;
    }

    // Accessors
    @:op([])
    public inline function arrayRead<T: TableKey>(n: T): Null<V>
        // TODO: maybe add 1 if n is Int?
        return untyped this[n];

    @:op([])
    public inline function arrayWrite<T: TableKey>(n: T, val: V): V
        // TODO: maybe add 1 if n is Int?
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
    #end
}
