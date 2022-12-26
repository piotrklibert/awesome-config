package test;


class Test {
    public static function main() {
        externs.Client.iterate((x) -> trace(x), 1, null);
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
