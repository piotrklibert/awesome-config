package test;

import haxe.Constraints.Function;

import lib.LuaMacros.unwrapCallbacks;
import lib.LuaMacros.wrapN;

import externs.Types;
import externs.Wibox;
import externs.Screen;
import externs.awful.Spawn;
import externs.gears.Timer;
import externs.wibox.container.Constraint;
import externs.wibox.container.Background;
import externs.wibox.container.Margin;
import externs.wibox.widget.Textbox;
import externs.wibox.widget.Imagebox;
import externs.awful.Button as MouseButton;
import externs.awful.widget.Button as ButtonWidget;
import externs.wibox.layout.Manual;
import externs.wibox.layout.Fixed;

typedef X = {a: Int, b: String};


@:publicFields
private class Const {
    static final max = 875;
    static final wibox = {
        ontop: true,
        width: 450,
        height: 160,
        x: 850,
        y: 85,
        border_width: 4,
        border_color: "#FF0000",
    }
    static function timerDef(timeout: Float, clb: (Timer) -> Void): TimerDef {
        final ta: TimerDef = unwrapCallbacks({
            callback: clb,
            timeout: timeout,
            autostart: true,
            single_shot: false
        });
        return ta;
    }
}

class G {
    public static function gen(): () -> Int {
        function f() {
            final max = Std.int(475);
            final min = Std.int(0);
            while(true) {
                for (i in (min - 180)...max) yield(i         * 1);
                for (i in min...(max + 260)) yield((max - i) * 1);
            }
        }
        return Coro.wrap(f);
    }
}

@:nullSafety(Strict)
class AwesomeTest {

    public static function main() {
        final t: LuaTable<Int, Int> = lua.Table.create([2, 3, 4, 5]);
        trace(t.pop());
        trace(t.values());
        t.push(45);
        trace(t.keys());
        t.mapValues((x) -> {prints(x); 3;});
        trace(t.has(4));
        trace(t.toMap());
        trace(t is lua.Table);
        trace({a: 3});
    }

    public static function main2() {
        final env = globals();
        if (!env.getBool("go_on")) env["go_on"] = true;

        final previous: Null<Wibox<Dynamic>> = env["test_widget"];
        if (previous != null) previous.visible = false;
        env["test_widget"] = null;

        final w = new Wibox<ButtonWidget>(Const.wibox);
        // w.opacity = 0.6;
        env["test_widget"] = w;

        var c = 1;

        // final textb2 = new Textbox("text 2");
        // textb2.font = "Monospace 30";

        // final textb3 = new Textbox("text 3");
        // // textb3.opacity = 0.7;

        final textb1 = new Textbox('text $c --->', false);
        textb1.font = "Monospace 30";
        textb1.forced_width = 120;


        final layout = new Manual();
        // layout.forced_height = 60;
        // layout.add_at(textb1, cast ({x: 10, y: 5}));

        final vertical = Fixed.vertical();
        // vertical.forced_width = 40;
        // vertical.add(textb2);
        // vertical.add(layout);
        // vertical.add(textb3);

        final btn = new Imagebox(
            untyped env["beautiful"].unsafe().awesome_icon, true
        );
        // vertical.add(btn);
        btn.forced_height = 30;
        btn.forced_width = 90;
        btn.horizontal_fit_policy = "fit";
        btn.vertical_fit_policy = "fit";
        final h = Fixed.horizontal();
        h.forced_height = 60;
        h.forced_width = 10;
        h.add(btn);
        h.add(textb1);
        h.add(btn);
        h.spacing = 20;
        final h = new Margin(h, 5, 5, 5, 5);
        final h = new Background(h, cast "#FF0000");
        // final btn1 = new ButtonWidget(cast {image: "/home/cji/morda1.jpg"});
        final btn1 = new Imagebox(cast "/home/cji/morda1.jpg");
        btn1.forced_width = 90;
        btn1.horizontal_fit_policy = "fit";
        btn1.vertical_fit_policy = "fit";
        btn1.connect_signal("button::press", () -> trace("click"));

        final btn2 = new Imagebox(cast "/home/cji/morda1.jpg");
        btn2.forced_height = 40;
        layout.add_at(btn1, cast {x: 0, y: 0});
        layout.add_at(btn2, cast {x: 90, y: 5});
        // layout.forced_width = 60;
        layout.forced_height = 50;
        final layout = new Background(layout, cast "#00FF00");
        vertical.add(layout);
        vertical.add(h);
        vertical.add(layout);
        // final btn = new Constraint(btn, CMin, 30, 30);
        // trace(btn.width);
        // trace(btn.height);
        w.widget = cast vertical;

        final clb = () -> {
            env["go_on"] = false;
            print("shutttting down...");
            w.visible = false;
        };
        w.widget.add_button(MouseButton.make([], 3, clb));

        w.connect_signal("mouse::move", (_w, x, y) -> {
            final c = externs.Mouse.coords();
            // trace(c.x, y);
            if (c.buttons[1]) {
                externs.awful.mouse.Wibox.move(w);
            }
        });

        w.redraw();

        final offsets = G.gen();
        function f(t: Timer) {
            // layout.move(1, cast {x: offsets(), y: 5});
        }
        final t2 = new Timer(Const.timerDef(0.01, f));

        final f = (t: Timer) -> {
            try {
                final go_on = env.getBool("go_on");
                if (!go_on) {
                    t.stop();
                    t2.stop();
                    w.visible = false;
                    w.widget = null;
                    env["test_widget"] = null;
                    return;
                }
                // textb1.text = 'text ${c++}';
            }
            catch (ex) {
                print(ex);
                t.stop();
                w.visible = false;
            }
            null;
        }

        new Timer(Const.timerDef(1.0, f));
    }
}

// Local Variables:
// haxe-module: "hx_test"
// End:
