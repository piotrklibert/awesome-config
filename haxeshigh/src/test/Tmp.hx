package test;

class Tmp {
    public static function main3() {
        final env = globals();
        if (!env.getBool("go_on")) env["go_on"] = true;

        final previous: Null<Wibox<Dynamic>> = env["test_wibox"];
        if (previous != null) previous.visible = false;
        env["test_wibox"] = null;

        final w = new Wibox<ButtonWidget>(Const.wibox);
        // w.opacity = 0.6;
        env["test_wibox"] = w;
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
        final btn1 = new Imagebox(cast getImg());
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
            else if (c.buttons[2]) {
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
                    // w.widget = null;
                    // env["test_wibox"] = null;
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

        // function f(x: externs.wibox.Widget, depth: Int = 0) {
        //     final s = (0...depth).toArray().map((_) -> "  ").join("");
        //     trace(s, x.widget_name, Reflect.fields(x).sorted().join(", "));
        //     x.get_children().values().each((x) -> f(x, depth+1));
        // }

        // f(w.widget.unsafe(), 0);

        for (x in w.widget.unsafe().get_all_children().iter()) {
            // print(x.value.widget_name);
            // print(Inspect.lua(x, {depth: 2}));
        };
        // final wdg: LuaTable<Int, Dynamic> = w.widget.get_children();
    }
}
