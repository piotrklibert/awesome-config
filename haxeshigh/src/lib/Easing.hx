package lib;

@:publicFields
class Easing {
    static function easeInExpo(x: Float) {
        // easeInExpo - https://easings.net/#easeInExpo
        return x == 0.0 ? 0.0 : Math.pow(2, 10 * x - 10);
    }

    static function easeInOutExpo(x: Float): Float {
        return x == 0 ? 0
            : x == 1 ? 1
            : x < 0.5 ? Math.pow(2, 20 * x - 10) / 2
            : (2 - Math.pow(2, -20 * x + 10)) / 2;
    }

    static function linear(x: Float) return x;
}
