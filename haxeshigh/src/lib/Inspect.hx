package lib;
import lua.Table;
import utils.lua.Macro.T;
using lib.TableTools;
using Reflect;

typedef InspectProcessor = (Dynamic, Null<Table<String, Dynamic>>) -> String;

typedef InspectOpts = {
    @:optional var ?depth: Int;
    @:optional var ?newline: String;
    @:optional var ?indent: String;
    @:optional var ?process: InspectProcessor;
}

@:publicFields
@:nullSafety(Strict)
class InspectFilters {
    static function normal(value: Dynamic, path: Null<Table<String, Dynamic>>) {
        if (path == null) return value;
        final last = path.last();
        if (last != lib.Inspect.NativeInspect.METATABLE && last != "__fields__")
            return value;
        else
            return null;
    }

    static function metatables(value: Dynamic, path: Null<Table<String, Dynamic>>) {
        if (path == null) return value;
        final last = path.last();
        if (last != lib.Inspect.NativeInspect.METATABLE)
            return value;
        return null;
    }
}


@:luaRequire("inspect")
extern class NativeInspect {
    static function inspect(x: Any, ?opts: Table<String, Dynamic>): String;

    static final METATABLE: Dynamic;
    static final KEY: Dynamic;
}

@:nullSafety(Strict)
class Inspect {
    public static inline function lua(x: Any, ?opts: InspectOpts) {
        final o: Table<String, Dynamic> =
            untyped __lua_table__({process: InspectFilters.metatables});
        o.setField("process", InspectFilters.metatables);
        if (opts != null)
            for (x in opts.fields())
                o.setField(x, opts.field(x));
        return NativeInspect.inspect(x, o);
    }

    public static inline function haxe(x: Any, ?opts: InspectOpts) {
        final o: Table<String, Dynamic> =
            untyped __lua_table__({process: InspectFilters.normal});
        o.setField("process", InspectFilters.normal);
        if (opts != null)
            for (x in opts.fields())
                o.setField(x, opts.field(x));
        return NativeInspect.inspect(x, o);
    }
}
