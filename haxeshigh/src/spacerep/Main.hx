package spacerep;

import lib.LuaMacros.unwrapCallbacks;
import lib.LuaMacros.wrapN;
import haxe.ds.StringMap;
import externs.gears.Timer;
import lib.Stepper;


@:nullSafety(Strict)
class Main {
    public static function test1() {
        Stepper.builder
            .duration(0.5)
            .callback((x) -> trace(x))
            .build();
    }

    public static function main() {
        ReminderData.scheduler.upgrade(new ReminderScheduler());
        // ReminderData.history.upgrade(new ReminderHistory());
    }
}


// Local Variables:
// haxe-module: "hx_spacerep"
// End:
