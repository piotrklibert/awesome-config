package spacerep;

import lib.LuaMacros.unwrapCallbacks;
import lib.LuaMacros.wrapN;

import externs.gears.Timer;
// import spacerep.ReminderData;


@:tink
@:nullSafety(Strict)
class Main {
    public static function main() {
        trace(ReminderData.cardData);
        // ReminderData.scheduler.upgrade(new ReminderScheduler());
        // (new ReminderScheduler()).reset();
    }
}


// Local Variables:
// haxe-module: "hx_spacerep"
// End:
