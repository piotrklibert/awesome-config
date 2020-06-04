package utils;

// import awful.*;
import awful.Wibox;
import awful.Mouse;

import utils.lua.Macro;
import utils.lua.Macro.castTable as A;

import utils.Common;
import lib.Globals.clone;

using Safety;


@:tink
@:expose
@:nullSafety(Strict)
class WidgetPreview {
  public static final ver = Macro.timestamp();
  public static function wrap(w) return new WidgetPreview(w); // Lua compat

  final wiboxConfig = A({
    ontop: true,
    opacity: 1,
    x: 962, y: 440,
    height: 115,
    width: 495,
    layout: Wibox.container.margin,
  });


  final widget: awful.Widget;
  public final wibox: awful.Wibox;

  var prev_coords: Point = {x: 0, y: 0};
  var is_pressed = false;

  public function new(widget: awful.Widget) {
    this.widget = Macro.widget({
      widget: Wibox.container.background,
      id: "bg",
      border_width: 1,
      border_color: "#919191",
      border_strategy: "inner",
      children: [widget],
    });
    this.wibox = new Wibox(wiboxConfig);
    this.wibox.widget = this.widget;
    connect_signals();
    wibox.visible = true;
  }

  function connect_signals() {
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
        prev_coords = coords;
    });
  }

  public function destroy() {
    this.wibox.visible = false;
  }
}
