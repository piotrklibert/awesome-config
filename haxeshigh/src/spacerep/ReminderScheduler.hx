package spacerep;

import externs.gears.Timer;

@:publicFields
class ReminderScheduler {
    static final repeat_interval = 60.0 * 4.5;
    var timer: Null<Timer>;

    function new() {
        trace("Creating a new ReminderScheduler");
        this.timer = Utils.repeat(
            repeat_interval, (t) -> this.showReminder(t), true, true
        );
    }

    function showReminder(t: Timer) {
        trace(now(), "showReminder called");
        if (!reminder.active)
            ReminderData.reminder.upgrade(new Reminder());
    }

    function stop() {
        this.timer.let(t -> t.stop());
    }

    function upgrade(old: ReminderScheduler): ReminderScheduler {
        if (old != null) old.stop();
        trace(now(), "ReminderScheduler upgraded");
        return this;
    }
}

// Local Variables:
// haxe-module: "hx_spacerep"
// End:
