package externs.awful.widget;


@:luaRequire("awful.widget.layoutbox")
extern class Layoutbox extends externs.wibox.layout.Fixed {
/** Display the current client layout (`awful.layout`) icon or name.
 * lib/awful/widget/layoutbox.lua:43
 */
/**
 * Get or set the children elements.
 * @see lib/awful/widget/layoutbox.lua:164
 */
var children: lua.Table<String, Dynamic>;
/**
 * Get all direct and indirect children widgets.
 * @see lib/awful/widget/layoutbox.lua:172
 */
var all_children: lua.Table<String, Dynamic>;
/**
 * Force a widget height.
 * @see lib/awful/widget/layoutbox.lua:183
 */
var forced_height: Int;
/**
 * Force a widget width.
 * @see lib/awful/widget/layoutbox.lua:188
 */
var forced_width: Int;
/**
 * The widget opacity (transparency).
 * @see lib/awful/widget/layoutbox.lua:193
 */
var opacity: Int;
/**
 * The widget visibility.
 * @see lib/awful/widget/layoutbox.lua:198
 */
var visible: Bool;
/**
 * The widget buttons.
 * @see lib/awful/widget/layoutbox.lua:207
 */
var buttons: Dynamic;
/**
 * Set a declarative widget hierarchy description.
 * @see lib/awful/widget/layoutbox.lua:178
 * @param args Dynamic  An array containing the widgets disposition
 */
function setup(args: Dynamic);
/**
 * Add a new `awful.button` to this widget.
 * @see lib/awful/widget/layoutbox.lua:212
 * @param button awful.button  The button to add.
 */
function add_button(button: awful.button);
/**
 * Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
 * @see lib/awful/widget/layoutbox.lua:220
 * @param signal_name String 
 * @param ...rest Dynamic  Other arguments
 */
function emit_signal_recursive(signal_name: String, ...rest: Dynamic);
/**
 * Emit a signal.
 * @see lib/awful/widget/layoutbox.lua:364
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/awful/widget/layoutbox.lua:370
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/awful/widget/layoutbox.lua:383
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
/**
 * Create a layoutbox widget.
 * @see lib/awful/widget/layoutbox.lua:85
 * @param args lua.Table<String, Dynamic>  The arguments.
 */
static function new(args: lua.Table<String, Dynamic>);
}
