package lib;

import lib.Inspect;
import haxe.Constraints;
import lib.Globals;

#if awesome
import externs.gears.Timer;
import lib.LuaMacros.unwrapCallbacks;
#end

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

    #if (awesome || display)
    static inline function timeout(timeout: Float, clb: (Timer) -> Void, ?auto: Bool = true) {
        final ta: TimerDef = unwrapCallbacks({
            callback: clb,
            timeout: timeout,
            autostart: auto,
            single_shot: true,
        });
        return new Timer(ta);
    }

    static inline function repeat(timeout: Float, clb: (Timer) -> Void, ?auto: Bool = true, ?now: Bool = false) {
        final ta: TimerDef = unwrapCallbacks({
            callback: clb,
            timeout: timeout,
            autostart: auto,
            single_shot: false,
            call_now: now
        });
        return new Timer(ta);
    }
    #end

    static inline function timestamp(): Float {
        return Sys.time();
    }

    static inline function now() {
        return DateTools.format(Date.now(), "%Y-%m-%d %H:%M:%S");
    }

    static inline function environ(): Map<String, String> {
        return new LuaTable(lua.lib.luv.Os.environ()).toMap();
    }

    static inline function yield<T, D>(arg: Null<D> = null): T {
        return lua.Coroutine.yield(cast arg);
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

    public static function exa(o: Dynamic) {
        final cls = Type.getClass(o);
        final clsFields = Type.getClassFields(cls);
        final clsName = Type.getClassName(cls);
        final objFields = Type.getInstanceFields(cls);
        final objType = Type.typeof(o);
        final isObj = Reflect.isObject(o);
        final isFun = Reflect.isFunction(o);
        trace("cls: ", cls);
        trace("clsFields: ", clsFields);
        trace("clsName: ", clsName);
        trace("objFields: ", objFields);
        trace("objType: ", objType);
        trace("isObj: ", isObj);
        trace("isFun: ", isFun);
    }
}
