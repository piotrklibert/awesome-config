package lib;

import lib.Inspect;
import lib.LuaTable;
import haxe.Constraints.Function;

using Safety;


@:publicFields
@:nullSafety(Strict)
class Env {
    static function getBool<K, V>(table: LuaTable<K, V>, name: String): Bool {
        final val = table[name];
        return cast(val.sure(), Bool);
    }

    static function getFloat<K, V>(table: LuaTable<K, V>, name: String): Float {
        final val = table[name];
        return cast(val.sure(), Float);
    }

    static function getInt<K, V>(table: LuaTable<K, V>, name: String): Int {
        final val = table[name];
        return cast(val.sure(), Int);
    }

    static function getTable<K, V, B>(table: LuaTable<K, V>, name: String): Table<K, B> {
        final val = table[name];
        return cast val.sure();
    }

    static function getString<K, V>(table: LuaTable<K, V>, name: String): String {
        final val = table[name];
        return cast(val.sure(), String);
    }
}


@:publicFields
class Prelude {
    /** native Lua print */
    static inline function print<T>(x: T) { untyped _G["print"](x); }
    /** native Lua print (alias)*/
    static inline function println<T>(x: T) { untyped _G["print"](x); }

    /** native Lua print with Haxe formatting */
    static inline function prints<T>(x: T) { untyped _G["print"](_hx_tostring(x)); }

    /** inspect from inspect.lua */
    static function inspect(x: Any, ?opts: InspectOpts): String {
        return Inspect.haxe(x, opts);
    }

    static inline function now() {
        return DateTools.format(Date.now(), "%Y-%m-%d %H:%M:%S");
    }

    static inline function environ(): Map<String, String> {
        return new LuaTable(lua.lib.luv.Os.environ()).toMap();
    }

    static inline function yield<T, D>(arg: D): T {
        return lua.Coroutine.yield(arg);
    }

    static inline function yields<T, D>(...args: D): T {
        return lua.Coroutine.yield(...args);
    }

    static inline function coro_wrap<F: Function, G: Function>(f: F, _: G): G {
        return cast lua.Coroutine.wrap(f);
    }

    static inline function globals(?name: String, ?val: Dynamic) {
        return Globals.get();
    }

    /** Variables local to current module */
    static inline function locals(?name: String, ?val: Dynamic) {
        return Locals.get();
    }

    static inline function readJson(fname: String) {
        return haxe.Json.parse(sys.io.File.getContent(fname));
    }
}


@:native("_M")
extern class Locals implements Dynamic {
    static inline function get(): LuaTable<String, Dynamic> {
        return untyped Locals;
    }
}


@:native("_G")
extern class Globals implements Dynamic {
    static inline function get(): LuaTable<String, Any> {
        return untyped Globals;
    }

    static final gtk: Dynamic;
    static final lgi: Dynamic;


    static function s(obj: Any): Void; // show_summary
    static function st(obj: Any): Void; // show_summary + tabular

    static function gs(obj: Any): String; // get_summary

    static function ss(obj: Any): Void; // show_full

    static function i(obj: Any, opts: Any): String; // show_full

    //static function sil(obj: Any): Void; // show_inspect depth=3
    @:native("sil")
    static function si(obj: Any): Void; // show_inspect

    static function sf(obj: Any): Void; // show_file

    static var Taglist: Dynamic;

    // #if pkg
    static var PackageManager: Null<pkg.PackageManager>;
    // #end
    //static var Logger: Null<Class<Log>>;

    static function clone<T>(x: T): T;
}
