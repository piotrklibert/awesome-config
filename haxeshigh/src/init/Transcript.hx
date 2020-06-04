package init;

import awful.*;

import lua.Table;
import utils.lua.Macro as M;
import utils.Common;

using utils.NullTools;


@:tink
@:expose
@:nullSafety(Strict)
class Transcript {
  static final wiboxConfig = M.castTable({
    ontop: true,
    opacity: 0.9,
    x: 120, y: 440,
    height: 115,
    width: 495,
  });


  public static function get_wibox(?s: Screen = Screen.focused()) {
    final wb = new Wibox(wiboxConfig);
    setup(wb.sure(), mkWidget(s));
    return wb;
  }


  public static function setup(wibox: Wibox, widget: Widget): Wibox {
    final widgetTable = M.declareWidget({
      margins: 15,
      layout: Wibox.container.margin,
      children: [widget]
    });

    final setupTable = M.widget({
      widget: Wibox.container.background,
      id: "bg",
      border_color: "#919191",
      border_width: 1,
      border_strategy: "inner",
      children: [widgetTable],
    });

    var prev_coords: Point = {x: 0, y: 0};
    var is_pressed = false;

    wibox.setup(setupTable);

    wibox.connect_signal("button::press", function () {
        is_pressed = true;
        prev_coords = Mouse.get();
    });
    wibox.connect_signal("button::release", function () {
        is_pressed = false;
    });
    wibox.connect_signal("mouse::move", function () {
        final coords: Point = Mouse.get();
        if (is_pressed) {
          wibox.x += coords.x - prev_coords.x;
          wibox.y += coords.y - prev_coords.y;
        }
        widget.set_markup(makeText(coords));
        prev_coords = coords;
    });

    wibox.visible = true;

    return wibox;
  }

  public static final ver = M.timestamp();

  static function makeText(pos: Point = {x: 0, y: 0}) {
    return '<span foreground="blue">$ver</span>\n<b>${pos.x}x${pos.y}</b>!!!';
  }


  static function mkWidget(s: Screen): Widget {
    final ret = {
      markup: makeText(),
      align: 'center',
      valign: 'center',
      widget: untyped __lua__("wibox.widget.textbox"),
    }
    return Widget.widget(ret);
  }
}
