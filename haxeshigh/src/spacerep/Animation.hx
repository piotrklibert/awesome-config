package spacerep;

class Animation {
    public static function gen(): () -> Int {
        function f() {
            final max = Std.int(475);
            final min = Std.int(0);
            while(true) {
                for (i in (min - 180)...max) yield(i         * 1);
                for (i in min...(max + 260)) yield((max - i) * 1);
            }
        }
        return Coro.wrap(f);
    }

    public static function opacity(): () -> Null<Float> {
        function f() {
            for (i in 0...100) yield(easing(i * 0.01));
        }
        return Coro.wrap(f);
    }

    public static function easing(x: Float) {
        // easeInExpo - https://easings.net/#easeInExpo
        return x == 0.0 ? 0.0 : Math.pow(2, 10 * x - 10);
    }
}

// Local Variables:
// haxe-module: "hx_spacerep"
// End:
