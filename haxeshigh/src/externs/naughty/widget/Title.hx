package externs.naughty.widget;


@:luaRequire("naughty.widget.title")
extern class Title {
/** A notification title.
 * lib/naughty/widget/title.lua:31
 */
/**
 * The attached notification.
 * @see lib/naughty/widget/title.lua:43
 */
var notification: naughty.notification;
/**
 * Get or set the children elements.
 * @see lib/naughty/widget/title.lua:119
 */
var children: lua.Table<String, Dynamic>;
/**
 * Get all direct and indirect children widgets.
 * @see lib/naughty/widget/title.lua:127
 */
var all_children: lua.Table<String, Dynamic>;
/**
 * Force a widget height.
 * @see lib/naughty/widget/title.lua:138
 */
var forced_height: Int;
/**
 * Force a widget width.
 * @see lib/naughty/widget/title.lua:143
 */
var forced_width: Int;
/**
 * The widget opacity (transparency).
 * @see lib/naughty/widget/title.lua:148
 */
var opacity: Int;
/**
 * The widget visibility.
 * @see lib/naughty/widget/title.lua:153
 */
var visible: Bool;
/**
 * The widget buttons.
 * @see lib/naughty/widget/title.lua:162
 */
var buttons: Dynamic;
/**
 * Create a new naughty.widget.title.
 * @see lib/naughty/widget/title.lua:72
 * @param args lua.Table<String, Dynamic> 
 */
@:selfCall function new(args: lua.Table<String, Dynamic>);
/**
 * Set a declarative widget hierarchy description.
 * @see lib/naughty/widget/title.lua:133
 * @param args Dynamic  An array containing the widgets disposition
 */
function setup(args: Dynamic);
/**
 * Add a new `awful.button` to this widget.
 * @see lib/naughty/widget/title.lua:167
 * @param button awful.button  The button to add.
 */
function add_button(button: awful.button);
/**
 * Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
 * @see lib/naughty/widget/title.lua:175
 * @param signal_name String 
 * @param ...rest Dynamic  Other arguments
 */
function emit_signal_recursive(signal_name: String, ...rest: Dynamic);
/**
 * Emit a signal.
 * @see lib/naughty/widget/title.lua:319
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/naughty/widget/title.lua:325
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/naughty/widget/title.lua:338
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
}