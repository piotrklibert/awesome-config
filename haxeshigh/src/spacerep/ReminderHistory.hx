package spacerep;


@:publicFields
class ReminderHistory {
    static var instance(get, never): ReminderHistory;
    static function get_instance(): ReminderHistory {
        final env = globals();
        final hist: Null<ReminderHistory> = env["reminder_history"];
        if (hist == null) {
            return env["reminder_history"] = new ReminderHistory();
        }
        else {
            return hist;
        }
    }

    static final repeatTimeout = 60 * 60 * 24; // 24h in seconds

    final hist: Map<String, Float>  = new Map();

    function new() {}

    function add(snippet: String) {
        this.hist[snippet] = Sys.time();
    }

    function check(snippet: String) {
        final last = this.hist[snippet] ?? 0.0;
        return (last + repeatTimeout) < Sys.time();
    }
}

// Local Variables:
// haxe-module: "hx_spacerep"
// End: