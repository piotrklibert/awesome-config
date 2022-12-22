package externs;


@:luaRequire("screen")
extern class Screen {
/** awesome screen API.
 * objects/screen.c:54
 */
/**
 * The screen coordinates.
 * @see objects/screen.c:211
 */
var geometry: Int;
/**
 * The internal screen number.
 * @see objects/screen.c:255
 */
var index: Int;
/**
 * The screen workarea.
 * @see objects/screen.c:262
 */
var workarea: Int;
/**
 * The area where clients can be tiled.
 * @see objects/screen.c:203
 */
var tiling_area: lua.Table<String, Dynamic>;
/**
 * Take a screenshot of the physical screen.
 * @see objects/screen.c:219
 */
var content: gears.surface;
/**
 * The screen padding.
 * @see objects/screen.c:279
 */
var padding: Int;
/**
 * A list of outputs for this screen with their size in mm.
 * @see objects/screen.c:332
 */
var outputs: lua.Table<String, Dynamic>;
/**
 * The list of visible clients for the screen.
 * @see objects/screen.c:463
 */
var clients: Dynamic;
/**
 * Get the list of clients assigned to the screen but not currently visible.
 * @see objects/screen.c:491
 */
var hidden_clients: Dynamic;
/**
 * All clients assigned to the screen.
 * @see objects/screen.c:510
 */
var all_clients: Dynamic;
/**
 * Tiled clients for the screen.
 * @see objects/screen.c:537
 */
var tiled_clients: Dynamic;
/**
 * A list of all tags on the screen.
 * @see objects/screen.c:587
 */
var tags: Dynamic;
/**
 * A list of all selected tags on the screen.
 * @see objects/screen.c:613
 */
var selected_tags: Dynamic;
/**
 * The first selected tag.
 * @see objects/screen.c:633
 */
var selected_tag: Dynamic;
/**
 * The number of pixels per inch of the screen.
 * @see objects/screen.c:787
 */
var dpi: Int;
/**
 * The lowest density DPI from all of the (physical) outputs.
 * @see objects/screen.c:792
 */
var minimum_dpi: Int;
/**
 * The highest density DPI from all of the (physical) outputs.
 * @see objects/screen.c:797
 */
var maximum_dpi: Int;
/**
 * The preferred DPI from all of the (physical) outputs.
 * @see objects/screen.c:806
 */
var preferred_dpi: Int;
/**
 * The maximum diagonal size in millimeters.
 * @see objects/screen.c:811
 */
var mm_maximum_size: Int;
/**
 * The minimum diagonal size in millimeters.
 * @see objects/screen.c:816
 */
var mm_minimum_size: Int;
/**
 * The maximum diagonal size in inches.
 * @see objects/screen.c:821
 */
var inch_maximum_size: Int;
/**
 * The minimum diagonal size in inches.
 * @see objects/screen.c:826
 */
var inch_minimum_size: Int;
/**
 * Add a fake screen.
 * @see objects/screen.c:1667
 * @param x Int  X-coordinate for screen.
 * @param y Int  Y-coordinate for screen.
 * @param width Int  width for screen.
 * @param height Int  height for screen.
 */
@:selfCall function new(x: Int, y: Int, width: Int, height: Int);
/**
 * Remove a screen.
 * @see objects/screen.c:1719
 */
function fake_remove();
/**
 * Resize a screen.
 * @see objects/screen.c:1762
 * @param x Int  The new X-coordinate for screen.
 * @param y Int  The new Y-coordinate for screen.
 * @param width Int  The new width for screen.
 * @param height Int  The new height for screen.
 */
function fake_resize(x: Int, y: Int, width: Int, height: Int);
/**
 * Swap a screen with another one in global screen list.
 * @see objects/screen.c:1802
 * @param s externs.Client  A screen to swap with.
 */
function swap(s: externs.Client);
/**
 * Get the square distance between a `screen` and a point.
 * @see objects/screen.c:67
 * @param x Int  X coordinate of point
 * @param y Int  Y coordinate of point
 */
function get_square_distance(x: Int, y: Int): Int;
/**
 * Get the next screen in a specific direction.
 * @see objects/screen.c:139
 * @param self Dynamic  Screen.
 * @param dir Dynamic  The direction, can be either "up", "down", "left" or "right".
 */
function get_next_in_direction(self: Dynamic, dir: Dynamic);
/**
 * Get the list of visible clients for the screen.
 * @see objects/screen.c:470
 * @param stacked Bool  Use stacking order? (top to bottom)
 */
function get_clients(stacked: Bool): lua.Table<String, Dynamic>;
/**
 * Get all clients assigned to the screen.
 * @see objects/screen.c:517
 * @param stacked Bool  Use stacking order? (top to bottom)
 */
function get_all_clients(stacked: Bool): lua.Table<String, Dynamic>;
/**
 * Get tiled clients for the screen.
 * @see objects/screen.c:544
 * @param stacked Bool  Use stacking order? (top to bottom)
 */
function get_tiled_clients(stacked: Bool): lua.Table<String, Dynamic>;
/**
 * Split the screen into multiple screens.
 * @see objects/screen.c:688
 * @param ratios lua.Table<String, Dynamic>  The different ratios to split into. If none is
  provided, it is split in half.
 * @param mode String  Either "vertical" or "horizontal". If none is
  specified, it will split along the longest axis.
 */
function split(ratios: lua.Table<String, Dynamic>, mode: String);
/**
 * Emit a signal.
 * @see objects/screen.c:1093
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see objects/screen.c:1099
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see objects/screen.c:1112
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
/**
 * Get the number of instances.
 * @see objects/screen.c:267
 */
static function instances();
/**
 * Iterate over screens.
 * @see objects/screen.c:1554
 */
static function screen();
/**
 * Get the number of screens.
 * @see objects/screen.c:1641
 */
static function count();
/**
 * Disconnect from a signal.
 * @see objects/screen.c:1915
 * @param name String  The name of the signal.
 * @param func Function  The callback that should be disconnected.
 */
static function disconnect_signal(name: String, func: Function);
/**
 * Emit a signal.
 * @see objects/screen.c:1921
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
static function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see objects/screen.c:1923
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
static function connect_signal(name: String, func: Function);
/**
 * Return the screen index corresponding to the given (pixel) coordinates.
 * @see objects/screen.c:79
 * @param x Int  The x coordinate
 * @param y Int  The y coordinate
 */
static function getbycoord(x: Int, y: Int): ?number;
/**
 * Move the focus to a screen.
 * @see objects/screen.c:96
 * @param _screen externs.Screen  Screen number (defaults / falls back to mouse.screen).
 */
static function focus(_screen: externs.Screen);
/**
 * Move the focus to a screen in a specific direction.
 * @see objects/screen.c:160
 * @param dir Dynamic  The direction, can be either "up", "down", "left" or "right".
 * @param _screen Dynamic  Screen.
 */
static function focus_bydirection(dir: Dynamic, _screen: Dynamic);
/**
 * Move the focus to a screen relative to the current one,
 * @see objects/screen.c:177
 * @param offset int  Value to add to the current focused screen index. 1 to
   focus the next one, -1 to focus the previous one.
 */
static function focus_relative(offset: int);
/**
 * Get the preferred screen in the context of a client.
 * @see objects/screen.c:368
 * @param c externs.Client  A client.
 */
static function preferred(c: externs.Client): externs.Screen;
/**
 * Get the focused screen.
 * @see objects/screen.c:387
 * @param args lua.Table<String, Dynamic> 
 */
static function focused(args: lua.Table<String, Dynamic>): ?screen;
/**
 * Get a placement bounding geometry.
 * @see objects/screen.c:417
 * @param args lua.Table<String, Dynamic>  The arguments
 */
static function get_bounding_geometry(args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;
/**
 * Call a function for each existing and created-in-the-future screen.
 * @see objects/screen.c:563
 * @param func Function  The function to call.
 */
static function connect_for_each_screen(func: Function);
/**
 * Undo the effect of connect_for_each_screen.
 * @see objects/screen.c:573
 * @param func Function  The function that should no longer be called.
 */
static function disconnect_for_each_screen(func: Function);
/**
 * Enable the automatic calculation of the screen DPI (experimental).
 * @see objects/screen.c:769
 * @param enabled Bool  Enable or disable automatic DPI support.
 */
static function set_auto_dpi_enabled(enabled: Bool);
}
