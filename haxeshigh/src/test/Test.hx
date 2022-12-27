package test;

import utils.lua.Macro.A;
import utils.lua.Macro.T;
import utils.lua.Macro.unwrapCallbacks;

import externs.Overrides;

class Test {
    public static function main() {
        final w = new externs.Wibox({width: 100, height: 400});
        w.x = 300;
        w.y = 30;
        w.visible = true;
        w.border_width = 10;

        externs.awful.Spawn.spawn("xterm", null, null);
        final f = () -> {
            final s = externs.Screen.focused();
            $type(s.padding);
            trace(s.outputs);
            final c = s.clients[1];
            $type(c);
            final g = c.geometry();
            c.geometry({x: g.x + 10});
        };

        new externs.gears.Timer(unwrapCallbacks({
            timeout: 0.3,
            autostart: true,
            callback: f,
            single_shot: true
        }));
    }
}

// case ["-macro"]:
//     trace(extgen.JsonTools.ffff());
// case ["-timeit"]: haxe.Timer.measure(() -> {
//     for (x in 0...1000) {
//         xx.let(i -> {println(i); i;});
//     }
// });

// public static function main4() {
//     final x = Coroutine.create(someFun);
//     Coroutine.resume(x, 2);
//     Coroutine.resume(x, 3);
//     Coroutine.resume(x, 3);
//     Coroutine.resume(x, 4);
//     Coroutine.resume(x, 3);
// }

// public static function main3() {
//     trace(haxe.Resource.getString("argh"));
//     trace(x(1));
// }

// public static function main2() {
//     final c: Array<String> = cp();
//     for (p in c) {
//         if (p.length > 0)
//             trace(p);
//     }
// }

// Local Variables:
// haxe-module: "hx_test"
// End:
