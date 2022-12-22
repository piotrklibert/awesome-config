package awful;

import haxe.Constraints;
import awful.Screen;
import awful.Wibox;


typedef WidgetOpts = {
  @:optional var ?border_width: Int;          // Border width.
  @:optional var ?border_color: String;       // Border color.
  @:optional var ?ontop: Bool;                // On top of other windows. (default false)
  @:optional var ?cursor: String;             // The mouse cursor.
  @:optional var ?visible: Bool;              // Visibility.
  @:optional var ?opacity: Float;             // The opacity, between 0 and 1. (default 1)
  @:optional var ?type: String;               // The window type (desktop, normal, dock).
  @:optional var ?x: Int;                     // The x coordinates.
  @:optional var ?y: Int;                     // The y coordinates.
  @:optional var ?width: Int;                 // The width.
  @:optional var ?height: Int;                // The height.
  @:optional var ?screen: Screen;             // The wibox screen.
  @:optional var ?widget: Dynamic;            // wibox.widget The widget that the wibox displays.
  @:optional var ?shape_bounding: Dynamic;    // wiboxs bounding shape as a (native) cairo surface.
  @:optional var ?shape_clip: Dynamic;        // wiboxs clip shape as a (native) cairo surface.
  @:optional var ?shape_input: Dynamic;       // wiboxs input shape as a (native) cairo surface.
  @:optional var ?bg: Dynamic;                // color The background.
  @:optional var ?bgimage: Dynamic;           // surface The background image of the drawable.
  @:optional var ?fg: Dynamic;                // The foreground (text) color.
  @:optional var ?input_passthrough: Bool;    // If the inputs are forward to the element below. (default false)
  @:optional var ?shape: Dynamic;             // gears.shape The shape.
  @:optional var ?top: Dynamic;
  @:optional var ?right: Dynamic;
  @:optional var ?left: Dynamic;
  @:optional var ?bottom: Dynamic;
  @:optional var ?forced_width: Dynamic;
  @:optional var ?forced_height: Dynamic;
}


@:luaRequire("awful.widget")
extern class Widget extends awful.widget.Base {

  function set_text(s: String): Void;
  function connect_signal(s: String, f: Function): Void;

  static function taglist(o: Any): Dynamic;
  static inline function widget(args: Dynamic): Widget {
    return Wibox.makeWidget(args);
  }
}
