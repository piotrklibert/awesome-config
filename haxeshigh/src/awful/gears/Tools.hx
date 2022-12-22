package awful.gears;

import haxe.Constraints;
import haxe.extern.Rest;
import haxe.extern.EitherType;

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
  static function parse_color(col: String): LuaTable;                           // Parse a HTML-color.
  static function create_solid_pattern(col: String): CairoPattern;                  // Create a solid pattern
  static function create_png_pattern(file: String): CairoPattern;                   // Create an image pattern from a png file
  static function create_linear_pattern(arg: Dynamic): CairoPattern;                 // Create a linear pattern object.
  static function create_radial_pattern(arg: Dynamic): CairoPattern;                 // Create a radial pattern object.
  static function create_pattern_uncached(col: String): CairoPattern;               // Create a pattern from a given string.
  static function create_pattern(col: String): CairoPattern;                        // Create a pattern from a given string, same as gears.color.
  static function create_opaque_pattern(col: String): CairoPattern;                 // Check if a pattern is opaque.
  static function recolor_image(image: String, newcolor: String): CairoPattern;            // Fill non-transparent area of an image with a given color.
  static function ensure_pango_color(check_color: String, fallback: String): CairoPattern;  // Get a valid color for Pango markup
  static var types: Array<String>; // = ["linear", "png", "radial", "solid"];
}

typedef GTimerAttrs = {
  var timeout: Float;                 // Timeout in seconds (e.g. 1.5).
  @:optional var ?autostart: Bool;    // Automatically start the timer.         false
  @:optional var ?call_now: Bool;     // Call the callback at timer creation.   false
  @:optional var ?single_shot: Bool;  // Run only once then stop.               false
  @:optional var ?callback: Function; // Callback function to connect to the "timeout" signal.  Undefined
}

enum abstract GTimerSignal(String) {
    var start;     // Emitted when the timer is started.
    var stop;      // Emitted when the timer is stopped.
    var timeout;   // Emitted when timeout seconds have elapsed.
}

@:luaRequire("gears.timer")
extern class GTimer {
    var started: Bool; // The timer is started.
    var timeout: Float; //  The timer timeout value.

    function new(args: GTimerAttrs);

    static function start_new(timeout: Float, callback: Function): GTimer;         // Create a simple timer for calling the callback function continuously.
    static function weak_start_new(timeout: Float, callback: Function): GTimer;    // Create a simple timer for calling the callback function continuously.
    static function run_delayed_calls_now(): Void;                               // Run all pending delayed calls now.
    static function delayed_call(callback: Function, args: Rest<Dynamic>): Void; // Call the given function at the end of the current GLib event loop iteration.

    function start(): Void; // Start the timer.
    function stop(): Void;  // Stop the timer.
    function again(): Void; // Restart the timer.

    function emit_signal(name: GTimerSignal, args: Rest<Dynamic>): Void;          // Emit a signal.   Inherited from gears.object
    function connect_signal(name: GTimerSignal, func: Function): Void;      // Connect to a signal.   Inherited from gears.object
    function weak_connect_signal(name: GTimerSignal, func: Function): Void; // Connect to a signal weakly.    Inherited from gears.object
}
