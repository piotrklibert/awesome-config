package awful;

import haxe.Constraints;
import awful.Screen;
import awful.Wibox;

typedef WidgetOpts = {
  var ?border_width: Int;          // Border width.
  var ?border_color: String;       // Border color.
  var ?ontop: Bool;                // On top of other windows. (default false)
  var ?cursor: String;             // The mouse cursor.
  var ?visible: Bool;              // Visibility.
  var ?opacity: Float;             // The opacity, between 0 and 1. (default 1)
  var ?type: String;               // The window type (desktop, normal, dock).
  var ?x: Int;                     // The x coordinates.
  var ?y: Int;                     // The y coordinates.
  var ?width: Int;                 // The width.
  var ?height: Int;                // The height.
  var ?screen: Screen;             // The wibox screen.
  var ?widget: Dynamic;            // wibox.widget The widget that the wibox displays.
  var ?shape_bounding: Dynamic;    // wiboxs bounding shape as a (native) cairo surface.
  var ?shape_clip: Dynamic;        // wiboxs clip shape as a (native) cairo surface.
  var ?shape_input: Dynamic;       // wiboxs input shape as a (native) cairo surface.
  var ?bg: Dynamic;                // color The background.
  var ?bgimage: Dynamic;           // surface The background image of the drawable.
  var ?fg: Dynamic;                // The foreground (text) color.
  var ?shape: Dynamic;             // gears.shape The shape.
  var ?input_passthrough: Bool;    // If the inputs are forward to the element below. (default false)
}


@:luaRequire("awful.widget")
extern class Widget extends awful.widget.Base implements Dynamic {
  static function taglist(o: Any): Dynamic;


  static inline function widget(args: Dynamic): Widget {
    return Wibox.makeWidget(args);
  }
}
