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
