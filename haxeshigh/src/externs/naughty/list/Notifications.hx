package externs.naughty.list;


@:luaRequire("naughty.list.notifications")
extern class Notifications {
/** Get a list of all currently active notifications.
 * lib/naughty/list/notifications.lua:93
 */
/**
 * The notificationlist parent notification.
 * @see lib/naughty/list/notifications.lua:247
 */
var notification: naughty.notification;
/**
 * A `wibox.layout` to be used to place the entries.
 * @see lib/naughty/list/notifications.lua:262
 */
var base_layout: externs.wibox.Widget;
/**
 * The notificationlist parent notification.
 * @see lib/naughty/list/notifications.lua:267
 */
var widget_template: lua.Table<String, Dynamic>;
/**
 * A table with values to override each `beautiful.notification_action` values.
 * @see lib/naughty/list/notifications.lua:286
 */
var style: lua.Table<String, Dynamic>;
/**
 * A function to prevent some notifications from being added to the list.
 * @see lib/naughty/list/notifications.lua:329
 */
var filter: Function;
/**
 * Get or set the children elements.
 * @see lib/naughty/list/notifications.lua:467
 */
var children: lua.Table<String, Dynamic>;
/**
 * Get all direct and indirect children widgets.
 * @see lib/naughty/list/notifications.lua:475
 */
var all_children: lua.Table<String, Dynamic>;
/**
 * Force a widget height.
 * @see lib/naughty/list/notifications.lua:486
 */
var forced_height: Int;
/**
 * Force a widget width.
 * @see lib/naughty/list/notifications.lua:491
 */
var forced_width: Int;
/**
 * The widget opacity (transparency).
 * @see lib/naughty/list/notifications.lua:496
 */
var opacity: Int;
/**
 * The widget visibility.
 * @see lib/naughty/list/notifications.lua:501
 */
var visible: Bool;
/**
 * The widget buttons.
 * @see lib/naughty/list/notifications.lua:510
 */
var buttons: Dynamic;
/**
 * Create an notification list.
 * @see lib/naughty/list/notifications.lua:369
 * @param args lua.Table<String, Dynamic> 
 */
@:selfCall function new(args: lua.Table<String, Dynamic>);
/**
 * Set a declarative widget hierarchy description.
 * @see lib/naughty/list/notifications.lua:481
 * @param args Dynamic  An array containing the widgets disposition
 */
function setup(args: Dynamic);
/**
 * Add a new `awful.button` to this widget.
 * @see lib/naughty/list/notifications.lua:515
 * @param button awful.button  The button to add.
 */
function add_button(button: awful.button);
/**
 * Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
 * @see lib/naughty/list/notifications.lua:523
 * @param signal_name String 
 * @param ...rest Dynamic  Other arguments
 */
function emit_signal_recursive(signal_name: String, ...rest: Dynamic);
/**
 * Emit a signal.
 * @see lib/naughty/list/notifications.lua:667
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/naughty/list/notifications.lua:673
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/naughty/list/notifications.lua:686
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
}
