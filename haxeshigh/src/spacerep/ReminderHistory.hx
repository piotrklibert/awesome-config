package spacerep;


@:publicFields
class ReminderHistory {
    static final repeatTimeout = 60 * 60 * 24; // 24h in seconds

    var hist: Map<String, Float>  = new Map();

    function new() {}

    function upgrade(old: ReminderHistory) {
        trace("Upgrade method called");
        this.hist = old.hist;
        trace(old);
        trace(this);
        return this;
    }

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
