package awful.gears;

import haxe.Constraints;


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
