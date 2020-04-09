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
extern class Widget implements Dynamic {
  static function taglist(o: Any): Dynamic;


  static inline function widget(args: Dynamic): Widget {
    return Wibox.widget(args);
  }
}


@:luaRequire("gears.shape")
extern class GShape {
  static final arc: Function;
  static final arrow: Function;
  static final circle: Function;
  static final cross: Function;
  static final hexagon: Function;
  static final infobubble: Function;
  static final isosceles_triangle: Function;
  static final losange: Function;
  static final octogon: Function;
  static final parallelogram: Function;
  static final partially_rounded_rect: Function;
  static final pie: Function;
  static final powerline: Function;
  static final radial_progress: Function;
  static final rectangle: Function;
  static final rectangular_tag: Function;
  static final rounded_bar: Function;
  static final rounded_rect: Function;
  static final transform: Function;
}

typedef CairoPattern = Dynamic;


@:luaRequire("gears.color")
extern class GColor {
  public static function parse_color(col: String): LuaTable;                           // Parse a HTML-color.
  public static function create_solid_pattern(col: String): CairoPattern;                  // Create a solid pattern
  public static function create_png_pattern(file: String): CairoPattern;                   // Create an image pattern from a png file
  public static function create_linear_pattern(arg: Dynamic): CairoPattern;                 // Create a linear pattern object.
  public static function create_radial_pattern(arg: Dynamic): CairoPattern;                 // Create a radial pattern object.
  public static function create_pattern_uncached(col: String): CairoPattern;               // Create a pattern from a given string.
  public static function create_pattern(col: String): CairoPattern;                        // Create a pattern from a given string, same as gears.color.
  public static function create_opaque_pattern(col: String): CairoPattern;                 // Check if a pattern is opaque.
  public static function recolor_image(image: String, newcolor: String): CairoPattern;            // Fill non-transparent area of an image with a given color.
  public static function ensure_pango_color(check_color: String, fallback: String): CairoPattern;  // Get a valid color for Pango markup
  static var types: Array<String>; // = ["linear", "png", "radial", "solid"];
}
