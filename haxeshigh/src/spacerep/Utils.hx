package spacerep;

import lib.LuaMacros.unwrapCallbacks;
import externs.gears.Timer;

@:publicFields
class Utils {
    static function timeout(timeout: Float, clb: (Timer) -> Void, ?auto: Bool = true) {
        final ta: TimerDef = unwrapCallbacks({
            callback: clb,
            timeout: timeout,
            autostart: auto,
            single_shot: true,
        });
        return new Timer(ta);
    }

    static function repeat(timeout: Float, clb: (Timer) -> Void, ?auto: Bool = true, ?now: Bool = false) {
        final ta: TimerDef = unwrapCallbacks({
            callback: clb,
            timeout: timeout,
            autostart: auto,
            single_shot: false,
            call_now: now
        });
        return new Timer(ta);
    }

    static function timerDef(timeout: Float, clb: (Timer) -> Void, ?now: Bool = false): TimerDef {
        final ta: TimerDef = unwrapCallbacks({
            callback: clb,
            timeout: timeout,
            autostart: true,
            single_shot: false,
            call_now: now
        });
        return ta;
    }
}


// Local Variables:
// haxe-module: "hx_spacerep"
// End:
