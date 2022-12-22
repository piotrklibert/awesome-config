package awful;

import haxe.extern.Rest;
import tink.core.Callback;
// typedef Callback<V> = V -> Void;

typedef TimerArgs = {
    var ?timeout: Float;
    var ?autostart: Bool;
    var ?call_now: Bool;
    var ?callback: Callback<Void>;
    var ?single_shot: Bool;
}

@:luaRequire("gears.timer")
extern class Timer {
    var started: Bool;
    var timeout: Int;

    static function start_new(timeout: Float, callback: Callback<Void>): Timer;
    static function weak_start_new(timeout: Int, callback: Callback<Void>): Timer;
    static function delayed_call(callback: Callback<Void>, args: Rest<Dynamic>): Void;

    function new(args: TimerArgs);

    function start(): Void;
    function stop(): Void;
    function again(): Void;

    // TODO: return a promise from here
    inline static function callAfter(n: Float, c: Callback<Void>): Timer {
        return new Timer({timeout: n, callback: c, autostart: true, single_shot: true});
    }

    inline static function callInterval(n: Float, c: Callback<Void>): Timer {
        return new Timer({timeout: n, callback: c, autostart: true, single_shot: false});
    }
}
