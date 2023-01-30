package spacerep;

import lib.LuaMacros.unwrapCallbacks;
import lib.LuaMacros.wrapN;
import lib.Stepper;

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
// TODO: make it obvious when raku has a snippet already
// TODO: keep watch on activity and prompt for creating a new card sometime


@:publicFields
class Label {
    static var builder(get, never): Label;
    static function get_builder() return new Label();

    private var _onClick: Null<() -> Void>;
    private var _content: Null<String>;
    private var _color: Null<String>;

    function new() {}

    function onClick(f: () -> Void) { _onClick = f; return this; }
    function content(t: String) { _content = t; return this; }
    function color(c: String) { _color = c; return this; }

    function build() {
        final txt = this._content.sure();
        final txt = if (this._color != null) this.wrapColor(txt) else txt;
        final txt = new Textbox(txt, false);
        if (this._onClick != null) {
            final button = MouseButton.make([], 1, this._onClick.sure());
            txt.add_button(button);
        }
        return txt;
    }

    function wrapColor(txt: String) {
        return '<span foreground=\"${this._color}\">$txt</span>';
    }
}


@:publicFields
class Reminder {
    var c = 1;
    var active = true;
    final showTimeout = 4;

    private var h: Null<String>; // hash string / id
    private var w: Wibox<Dynamic>;
    private var s: String;      // path to the image to display
    private var timer: Null<Timer>;

    private final ver = lib.LuaMacros.timestamp();

    private var card_data(get, never): CardJson;
    private function get_card_data() {
        return ReminderData.card_data.data[this.h.sure()].sure()
    }

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
        return ReminderData.history.get();
    }

    function new() {
        trace("Creating Reminder instance");
        this.card_data = ;
        this.w = new Wibox<ButtonWidget>(config.wibox);
        this.s = getImg();
        this.initialize();
        this.fadeIn();
    }

    function upgrade(previous: Null<Reminder>) {
        if (previous != null) previous.visible = false;
        final env = globals();
        env["test_wibox"] = null;
        env["test_wibox"] = w;
    }

    function initialize() {
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
            if (count > this.showTimeout && this.active) {
                t.stop();
                this.countdownActive = false;
                this.close();
            }
            else if (this.active == false) {
                if (this.timer.let(x -> x.started) ?? false) {
                    this.timer?.stop();
                    this.timer = null;
                }
            }
        }
        Utils.repeat(1.0, clb, true);
    }

    function fadeOut() {
        trace(now(), "closing Reminder");
        Stepper.builder.duration(0.5).callback((x) -> {
            this.w.opacity = 1 - x;
            if (x >= 1) {
                this.timer?.stop();
                this.w.visible = false;
            }
        })
            .build();
    }

    function fadeIn() {
        trace(now(), "showing Reminder");
        this.w.opacity = 0.0;
        Stepper.builder.duration(0.5).callback((x) -> {
            this.w.opacity = x;
            if (x >= 1)
                this.setCountdown();
        })
            .build();
    }

    function setUpSignals() {
        final widget = Safety.sure(w.widget);
        widget.add_button(MouseButton.make([], 4, this.roll)); // scroll down
        widget.add_button(MouseButton.make([], 5, this.roll)); // scroll up
        widget.add_button(MouseButton.make([], 3, this.close));

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

    function makeTopRow() {
        final sep = new Separator(cast {forced_height: 5, forced_width: 5});
        sep.thickness = 5;
        sep.orientation = "vertical";
        final sep = new Margin(sep, 15, 15, 0, 0);

        final horiz = Fixed.horizontal();

        horiz.add(new Textbox(
            "<span color=\"black\">Implementation:</span>", false
        ));

        horiz.add(new Margin(cast {}, 15, 15, 0, 0));

        horiz.add(
            Label.builder.content("Edit this").color("blue").onClick(() -> {
                this.openBrowserEdit();
            }).build()
        );
        horiz.add(sep); // --------
        horiz.add(
            Label.builder.content("Add new").color("blue").onClick(() -> {
                this.openBrowserCreate();
            }).build()
        );
        horiz.add(sep); // --------
        horiz.add(
            Label.builder.content("In Raku").color("blue")
                .onClick(() -> this.openRakuEdit())
                .build()
        );
        horiz.add(sep); // --------
        horiz.add(
            Label.builder.content("▼").color("green")
                .onClick(() -> this.lowerScore())
                .build()
        );

        // horiz.add(sep);
        // horiz.add(new Textbox("Add lang...", false));
        return horiz;
    }

    function lowerScore() {
        this.h;
    }

    function openRakuEdit() {
        final n = this.h.unsafe();
        final data = ReminderData.card_data.data[n].sure();
        final t: String = Safety.sure(data["Title"]);
        trace(t);
        final t = ~/\[\]:/.replace(
            t.split(" ").mapIt(it.toLowerCase()).join("-"),
            "_"
        );
        trace(t);
        final path = '/home/cji/priv/programming-idioms/data/${t}.raku';
        final elisp = '(progn (find-file "${path}") (raku-card-mode "$n"))';
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

    function openBrowserEdit() {
        this.openBrowser(card_data["EditURL"] ?? "BadURL");
    }

    function openBrowserCreate() {
        final url = 'https://www.programming-idioms.org/impl-create/${card_data["Id"]}';
        this.openBrowser(url);
    }

    function openBrowser(url: String) {
        Spawn.spawn('firefox --new-window $url');
    }

    function close() {
        this.timer?.stop();
        this.fadeOut();
        this.active = false;
    }

    function roll() {
        this.s = this.getImg();
        this.initialize();
    }

    function getImg() {
        final dir = "/home/cji/priv/programming-idioms/cards/";
        final x = sys.FileSystem.readDirectory(dir);
        final arr = x.filter((p) -> ~/[a-z]*.png/.match(p));
        var ret = dir + "/" + arr[Std.int(Math.random() * arr.length)];
        var count = 0;
        while (!this.history.check(ret)) {
            trace(ret);
            if (++count > 350) return "/home/cji/priv/programming-idioms/out.jpg";
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
