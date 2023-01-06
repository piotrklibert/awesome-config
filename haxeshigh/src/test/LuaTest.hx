package test;

import lib.Globals.Prelude.*;
import lua.Coroutine as Coro;

@:nullSafety(Strict)
class LuaTest {
    static function gen() {
        for (k in globals().toMap().keys()) if (k.startsWith("_"))
            yield(k);
        yield("---");
        for (k in locals().toMap().keys()) if (k.startsWith("_"))
            yield(k);
    }

    public static function main() {
        final c = Coro.create(gen);
        while (Coro.status(c) != Dead) {
            trace(Coro.resume(c).result);
        }
    }
}

// Local Variables:
// haxe-module: "hx_test"
// End:
