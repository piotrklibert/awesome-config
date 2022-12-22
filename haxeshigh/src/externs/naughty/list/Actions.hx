package externs.naughty.list;


@:luaRequire("naughty.list.actions")
extern class Actions {
/** Manage a notification action list.
 * lib/naughty/list/actions.lua:160
 */
/**
 * The actionlist parent notification.
 * @see lib/naughty/list/actions.lua:325
 */
var notification: naughty.notification;
/**
 * The actionlist layout.
 * @see lib/naughty/list/actions.lua:333
 */
var base_layout: externs.wibox.Widget;
/**
 * The actionlist parent notification.
 * @see lib/naughty/list/actions.lua:338
 */
var widget_template: lua.Table<String, Dynamic>;
/**
 * A table with values to override each `beautiful.notification_action` values.
 * @see lib/naughty/list/actions.lua:363
 */
var style: lua.Table<String, Dynamic>;
/**
 * Get or set the children elements.
 * @see lib/naughty/list/actions.lua:498
 */
var children: lua.Table<String, Dynamic>;
/**
 * Get all direct and indirect children widgets.
 * @see lib/naughty/list/actions.lua:506
 */
var all_children: lua.Table<String, Dynamic>;
/**
 * Force a widget height.
 * @see lib/naughty/list/actions.lua:517
 */
var forced_height: Int;
/**
 * Force a widget width.
 * @see lib/naughty/list/actions.lua:522
 */
var forced_width: Int;
/**
 * The widget opacity (transparency).
 * @see lib/naughty/list/actions.lua:527
 */
var opacity: Int;
/**
 * The widget visibility.
 * @see lib/naughty/list/actions.lua:532
 */
var visible: Bool;
/**
 * The widget buttons.
 * @see lib/naughty/list/actions.lua:541
 */
var buttons: Dynamic;
/**
 * Create an action list.
 * @see lib/naughty/list/actions.lua:454
 * @param args lua.Table<String, Dynamic> 
 * @param widget_template lua.Table<String, Dynamic>  A custom widget to be used for each action.
 */
@:selfCall function new(args: lua.Table<String, Dynamic>, widget_template: lua.Table<String, Dynamic>);
/**
 * Set a declarative widget hierarchy description.
 * @see lib/naughty/list/actions.lua:512
 * @param args Dynamic  An array containing the widgets disposition
 */
function setup(args: Dynamic);
/**
 * Add a new `awful.button` to this widget.
 * @see lib/naughty/list/actions.lua:546
 * @param button awful.button  The button to add.
 */
function add_button(button: awful.button);
/**
 * Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
 * @see lib/naughty/list/actions.lua:554
 * @param signal_name String 
 * @param ...rest Dynamic  Other arguments
 */
function emit_signal_recursive(signal_name: String, ...rest: Dynamic);
/**
 * Emit a signal.
 * @see lib/naughty/list/actions.lua:698
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/naughty/list/actions.lua:704
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/naughty/list/actions.lua:717
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
}
