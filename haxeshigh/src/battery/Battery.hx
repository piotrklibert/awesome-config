package battery;

import awful.AwfulTools.makeWidget;
import utils.lua.Macro as M;

using Safety;

@:keep
@:nullSafety(Strict)
class Battery {
  final widget: Null<awful.Widget>;

  // static final wiboxConfig = M.asTable({
  //   ontop: true,
  //   opacity: 0.9,
  //   x: 120, y: 440,
  //   height: 115,
  //   width: 495,
  // });


  // public static function get_wibox(?s: Screen = Screen.focused()) {
  //   final wb = new Wibox(wiboxConfig);
  //   setup(wb.sure(), mkWidget(s));
  //   return wb;
  // }

  public function new() {
    widget = makeWidget(M.asTable([]), M.asTable({
        widget: untyped __lua__("wibox.widget.progressbar()"),
        forced_width: 50,
        forced_height: 5
        }));
  }


    // s.batwidget = wibox.widget.progressbar()
    // s.batwidget.forced_width = 50
    // s.batwidget.forced_height = 3

    // batbox = wibox.container.constraint(
    //     wibox.widget {
    //         {
    //             max_value: 1,
    //             widget: s.batwidget,
    //             border_width: 0.5, border_color: "#000000",
    //             color: {type: "linear", from: {0, 0}, to: {0, 30}, stops: {{0, "#AECF96"}, {1, "#FF5656"}}},
    //         },
    //         direction: "east", color: beautiful.fg_widget,
    //         layout: wibox.container.place
    //     },
    //     "min", 2, 3)

    // pbar = wibox.widget {
    //     max_value: 1,
    //     -- value: 0.2,
    //     color: "#AECF96", -- {type: "linear", from: {0, 0}, to: {0, 30}, stops: {{0, "#AECF96"}, {0.3, "#f0f"}, {0.6, "#FF5656"}}},
    //     forced_height: 10,
    //     forced_width: 60,
    //     shape: gears.shape.rounded_bar,
    //     border_width: 2,
    //     border_color: beautiful.border_color,
    //     widget: wibox.widget.progressbar,
    //     point: {x: 0, y: 10}
    // }

    // s.batwidget = wibox.widget {
    //     pbar ,
    //     forced_width: 40,
    //     layout: wibox.layout.manual
    // }

    // s.batwidget_tooltip = awful.tooltip {
    //     objects: { s.batwidget },
    //     timer_function: util.bat_tooltip_fun,
    //     font: "mono 14"
    // }

}
