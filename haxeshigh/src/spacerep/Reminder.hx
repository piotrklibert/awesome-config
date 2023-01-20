package spacerep;

import lib.LuaMacros.unwrapCallbacks;
import lib.LuaMacros.wrapN;

import externs.Types;
import externs.Wibox;
import externs.Screen;
import externs.awful.Spawn;
import externs.gears.Timer;
import externs.gears.Surface;
import externs.wibox.container.Constraint;
import externs.wibox.container.Background;
import externs.wibox.container.Margin;

import externs.wibox.layout.Manual;
import externs.wibox.layout.Fixed;

import externs.wibox.widget.Separator;
import externs.wibox.widget.Textbox;
import externs.wibox.widget.Imagebox;

import externs.awful.Button as MouseButton;
import externs.awful.widget.Button as ButtonWidget;
using Reflect;


// TODO: shorten showing time depending on intensity of usage
// TODO: make downvoting work
// TODO: make a pause button
// TODO: finish build macro for persistent data
// TODO: make it obvious when raku has a snippet already
// TODO: keep watch on activity and prompt for creating a new card sometime



@:publicFields
class Reminder {
    var c = 1;

    private var h: String;
    private var w: Wibox<Dynamic>;
    private var s: String;
    private var timer: Timer;

    private final ver = lib.LuaMacros.timestamp();

    static final config = {
        wibox: {
            ontop: true,
            width: 450,
            height: 160,
            x: 850,
            y: 85,
            border_width: 4,
            border_color: "#FF0099",
        }
    };
    var history(get, never): ReminderHistory;
    function get_history(): ReminderHistory {
        return ReminderHistory.instance;
    }

    static var instance(get, never): Reminder;
    static function get_instance(): Reminder {
        final env = globals();
        final reminder: Null<Reminder> = env["Reminder"];

        if (reminder == null) {
            return env["Reminder"] = new Reminder();
        }
        else {
            return reminder;
        }
    }

    var active = true;

    function new() {
        this.s = getImg();
        this.initialize();
        this.fadeIn();
    }

    function initialize() {
        this.w = new Wibox<ButtonWidget>(config.wibox);
        this.setUpGlobals();
        this.setUpWidgets();
        this.setUpSignals();
        this.w.visible = true;
    }

    var countdownActive = false;

    function setCountdown() {
        this.countdownActive = true;
        var count = 0;
        function clb(t: Timer) {
            if (countdownActive) count++;
            if (count > 10) {
                t.stop();
                this.countdownActive = false;
                this.close();
            }
        }
        Utils.repeat(1.0, clb, true);
    }

    function fadeIn() {
        this.w.opacity = 0.0;
        final gen = Animation.opacity();
        function clb(t: Timer) {
            final v = gen();
            if (v == null) {
                this.timer.stop();
                this.w.opacity = 1;
                this.setCountdown();
            }
            else
                this.w.opacity = v;
        }
        final step = 0.005;
        this.timer = Utils.repeat(step, clb, true, true);
    }

    function setUpSignals() {
        w.widget.add_button(MouseButton.make([], 4, this.roll)); // scroll down
        w.widget.add_button(MouseButton.make([], 5, this.roll)); // scroll up
        w.widget.add_button(MouseButton.make([], 3, this.close));

        w.connect_signal("mouse::enter", () -> {
            this.countdownActive = false;
        });
        w.connect_signal("mouse::leave", () -> {
            this.countdownActive = true;
        });

        w.connect_signal("mouse::move", (_w, x, y) -> {
            final c = externs.Mouse.coords();
            if (c.buttons[1]) externs.awful.mouse.Wibox.move(w);
        });
    }

    static function implData(h: String): LuaTable<String, Dynamic> {
        return globals()["cards_data"].field(h);
    }

    function makeTopRow() {
        final sep = new Separator(cast {forced_height: 5, forced_width: 5});
        sep.thickness = 5;
        sep.orientation = "vertical";
        final sep = new Margin(sep, 15, 15, 0, 0);

        final horiz = Fixed.horizontal();
        final card_data = implData(this.h);

        horiz.add(new Textbox(
            "<span color=\"black\">Implementation:</span>", false
        ));

        horiz.add(new Margin(cast {}, 15, 15, 0, 0));

        final txt = new Textbox(
            "<span foreground=\"blue\">Edit this</span>", false
        );
        txt.add_button(
            MouseButton.make([], 1, () -> {
                this.openBrowser(card_data["EditURL"]);
            })
        );
        horiz.add(txt);

        horiz.add(sep);

        final txt = new Textbox(
            "<span foreground=\"blue\">Add new</span>", false
        );
        txt.add_button(
            MouseButton.make([], 1, () -> {
                final url = 'https://www.programming-idioms.org/impl-create/${card_data["Id"]}';
                this.openBrowser(url);
            })
        );
        horiz.add(txt);

        horiz.add(sep);

        final txt = new Textbox(
            "<span foreground=\"blue\">In Raku</span>", false
        );
        txt.add_button(
            MouseButton.make([], 1, () -> {
                this.openRakuEdit();
            })
        );
        horiz.add(txt);

        horiz.add(sep);

        final txt = new Textbox(
            "<span foreground=\"blue\">▼</span>", false
        );
        txt.add_button(
            MouseButton.make([], 1, () -> {
            })
        );
        horiz.add(txt);

        // horiz.add(sep);
        // horiz.add(new Textbox("Add lang...", false));
        return horiz;
    }

    function openRakuEdit() {
        final n = this.h;
        final path = '/home/cji/priv/programming-idioms/data/${n}.raku';
        final elisp = '(progn (find-file "${path}") (raku-card-mode))';
        Spawn.spawn('emacsclient --c -e \'${elisp}\'');
    }

    function setUpWidgets() {
        final surface = Surface.surface(this.s);
        final size = Surface.get_size(surface);

        w.width = size.width + 20;
        w.height = size.height + 10 + 30;
        w.x = 1918 - w.width - 10;
        w.y = 1078 - w.height - 10;
        w.bg = "#F8F8F8";

        final img = new Imagebox(surface, true);
        img.horizontal_fit_policy = "none";
        img.vertical_fit_policy = "none";

        final layout = new Manual();
        layout.add_at(img, cast ({x: 10, y: 35}));

        final topRow = this.makeTopRow();
        layout.add_at(topRow, cast ({x: 10, y: 5}));

        this.w.widget = layout;
    }

    function openBrowser(url: String) {
        Spawn.spawn('firefox --new-window $url');
    }

    function setUpGlobals() {
        final env = globals();
        if (!env.getBool("go_on")) env["go_on"] = true;
        final previous: Null<Wibox<Dynamic>> = env["test_wibox"];
        if (previous != null) previous.visible = false;
        env["test_wibox"] = null;
        env["test_wibox"] = w;
    }

    function close() {
        final env = globals();
        env["go_on"] = false;
        print("shutttting down...");
        this.w.visible = false;
        this.timer.stop();
        this.active = false;
    }

    function roll() {
        this.s = this.getImg();
        this.initialize();
    }

    public function getImg() {
        final dir = "/home/cji/priv/programming-idioms/cards/";
        final x = sys.FileSystem.readDirectory(dir);
        final arr = x.filter((p) -> ~/[a-z]*.png/.match(p));
        var ret = dir + "/" + arr[Std.int(Math.random() * arr.length)];
        while (!this.history.check(ret)) {
            trace(ret);
            ret = dir + "/" + arr[Std.int(Math.random() * arr.length)];
        }
        this.history.add(ret);
        this.h = ret.split("/").last().split(".").first();
        return ret;
    }
}

// Local Variables:
// haxe-module: "hx_spacerep"
// End:
