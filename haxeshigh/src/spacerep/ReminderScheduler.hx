package spacerep;

import externs.gears.Timer;


@:publicFields
class ReminderScheduler {

    public static var instance(get, never): Null<ReminderScheduler>;
    public static function get_instance(): Null<ReminderScheduler> {
        return globals()["Scheduler"];
    }

    var timer: Null<Timer>;

    function new() {}

    function callback(t: Timer) {
        trace(now(), "ping");
        final reminder = ReminderData.reminder;
        if (!reminder.active)
            ReminderData.reminder = new Reminder();
    }

    function stop() {
        this.timer.let(t -> t.stop());
    }

    function upgrade(old: ReminderScheduler): ReminderScheduler {
        trace(now(), "reset");
        final env = globals();
        if (old != null) old.stop();
        this.timer = Utils.repeat(60.0 * 7, (t) -> this.callback(t), true, true);
        return this;
    }
}

// Local Variables:
// haxe-module: "hx_spacerep"
// End:
