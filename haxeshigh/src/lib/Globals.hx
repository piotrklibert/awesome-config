package lib;
// import log.Log;
import lua.Table.AnyTable;
import lib.Inspect;
import haxe.extern.EitherType;

@:nullSafety(Strict)
@:publicFields
class Env {
    static function set(name: String, val: Dynamic) {
        untyped Globals[name] = val;
    }

    static function get(name: String): Dynamic {
        return untyped Globals[name];
    }

    static function globals(): Map<String, Null<Dynamic>> {
        final x = (untyped __lua__("_G") : lua.Table<String, Dynamic>);
        return lua.Table.toMap(x);
    }
}


@:publicFields
class Prelude {
    static function print<T>(x: T) { untyped _G["print"](x); }
    static function println<T>(x: T) { untyped _G["print"](x); }

    static function inspect(x: Any, ?opts: InspectOpts): String {
        return Inspect.haxe(x, opts);
    }
}

@:native("_G")
extern class Globals implements Dynamic {
    public static final gtk: Dynamic;
    public static final lgi: Dynamic;


    public static function s(obj: Any): Void; // show_summary
    public static function st(obj: Any): Void; // show_summary + tabular

    public static function gs(obj: Any): String; // get_summary

    public static function ss(obj: Any): Void; // show_full

    public static function i(obj: Any, opts: Any): String; // show_full

    // public static function sil(obj: Any): Void; // show_inspect depth=3
    @:native("sil")
    public static function si(obj: Any): Void; // show_inspect

    public static function sf(obj: Any): Void; // show_file

    public static var Taglist: Dynamic;

    #if pkg
    public static var PackageManager: Null<pkg.PackageManager>;
    #end
    // public static var Logger: Null<Class<Log>>;

    public static function clone<T>(x: T): T;
}
