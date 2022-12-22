package externs.naughty;


@:luaRequire("naughty.notification")
extern class Notification {
/** A notification object.
 * lib/naughty/notification.lua:21
 */
/**
 * Title of the notification.
 * @see lib/naughty/notification.lua:104
 */
var title: String;
/**
 * Time in seconds after which popup expires.
 * @see lib/naughty/notification.lua:110
 */
var timeout: Int;
/**
 * The notification urgency level.
 * @see lib/naughty/notification.lua:122
 */
var urgency: String;
/**
 * The notification category.
 * @see lib/naughty/notification.lua:169
 */
var category: Null<String>;
/**
 * True if the notification should be kept when an action is pressed.
 * @see lib/naughty/notification.lua:179
 */
var resident: Bool;
/**
 * Delay in seconds after which hovered popup disappears.
 * @see lib/naughty/notification.lua:184
 */
var hover_timeout: Int;
/**
 * Target screen for the notification.
 * @see lib/naughty/notification.lua:189
 */
var screen: Dynamic;
/**
 * Corner of the workarea displaying the popups.
 * @see lib/naughty/notification.lua:226
 */
var position: String;
/**
 * Boolean forcing popups to display on top.
 * @see lib/naughty/notification.lua:230
 */
var ontop: Bool;
/**
 * Popup height.
 * @see lib/naughty/notification.lua:259
 */
var height: Int;
/**
 * Popup width.
 * @see lib/naughty/notification.lua:265
 */
var width: Int;
/**
 * Notification font.
 * @see lib/naughty/notification.lua:287
 */
var font: String;
/**
 * "All in one" way to access the default image or icon.
 * @see lib/naughty/notification.lua:309
 */
var icon: haxe.extern.EitherType<String, surface>;
/**
 * Desired icon size in px.
 * @see lib/naughty/notification.lua:314
 */
var icon_size: Int;
/**
 * The icon provided in the `app_icon` field of the DBus notification.
 * @see lib/naughty/notification.lua:323
 */
var app_icon: String;
/**
 * The notification image.
 * @see lib/naughty/notification.lua:333
 */
var image: haxe.extern.EitherType<String, surface>;
/**
 * The notification (animated) images.
 * @see lib/naughty/notification.lua:345
 */
var images: Null<lua.Table<String, Dynamic>>;
/**
 * Foreground color.
 * @see lib/naughty/notification.lua:376
 */
var fg: haxe.extern.EitherType<String, externs.gears.Color, pattern>;
/**
 * Background color.
 * @see lib/naughty/notification.lua:406
 */
var bg: haxe.extern.EitherType<String, externs.gears.Color, pattern>;
/**
 * Border width.
 * @see lib/naughty/notification.lua:411
 */
var border_width: Int;
/**
 * Border color.
 * @see lib/naughty/notification.lua:441
 */
var border_color: String;
/**
 * Widget shape.
 * @see lib/naughty/notification.lua:513
 */
var shape: externs.gears.Shape;
/**
 * Widget opacity.
 * @see lib/naughty/notification.lua:518
 */
var opacity: Int;
/**
 * Widget margin.
 * @see lib/naughty/notification.lua:554
 */
var margin: haxe.extern.EitherType<Int, lua.Table<String, Dynamic>>;
/**
 * Table with any of the above parameters.
 * @see lib/naughty/notification.lua:577
 */
var preset: Dynamic;
/**
 * Function that will be called with all arguments.
 * @see lib/naughty/notification.lua:584
 */
var callback: Function;
/**
 * A table containing strings that represents actions to buttons.
 * @see lib/naughty/notification.lua:592
 */
var actions: Dynamic;
/**
 * Ignore this notification, do not display.
 * @see lib/naughty/notification.lua:601
 */
var ignore: Bool;
/**
 * Tell if the notification is currently suspended (read only).
 * @see lib/naughty/notification.lua:608
 */
var suspended: Bool;
/**
 * If the notification is expired.
 * @see lib/naughty/notification.lua:614
 */
var is_expired: Bool;
/**
 * If the timeout needs to be reset when a property changes.
 * @see lib/naughty/notification.lua:623
 */
var auto_reset_timeout: Bool;
/**
 * A list of clients associated with this notification.
 * @see lib/naughty/notification.lua:644
 */
var clients: Dynamic;
/**
 * The maximum popup width.
 * @see lib/naughty/notification.lua:654
 */
var max_width: Int;
/**
 * The application name specified by the notification.
 * @see lib/naughty/notification.lua:663
 */
var app_name: String;
/**
 * The widget template used to represent the notification.
 * @see lib/naughty/notification.lua:672
 */
var widget_template: Dynamic;
/**
 * Create a notification.
 * @see lib/naughty/notification.lua:1150
 * @param args lua.Table<String, Dynamic>  The argument table containing any of the arguments below.
 * @param opt String =`beautiful.notification_border_color` or
   `beautiful.border_color_active` or `'#535d6c'`] args.border_color Border color.
 */
@:selfCall function new(args: lua.Table<String, Dynamic>, opt: String);
/**
 * Destroy notification by notification object.
 * @see lib/naughty/notification.lua:682
 * @param reason String  One of the reasons from `notification_closed_reason`
 * @param keep_visible Bool  If true, keep the notification visible
 */
function destroy(reason: String, keep_visible: Bool): Bool;
/**
 * Set new notification timeout.
 * @see lib/naughty/notification.lua:702
 * @param new_timeout Int  Time in seconds after which notification disappears.
 */
function reset_timeout(new_timeout: Int);
/**
 * Add more actions to the notification.
 * @see lib/naughty/notification.lua:998
 * @param new_actions lua.Table<String, Dynamic> 
 */
function append_actions(new_actions: lua.Table<String, Dynamic>);
/**
 * Grant a permission for a notification.
 * @see lib/naughty/notification.lua:1267
 * @param permission String  The permission name (just the name, no `request::`).
 * @param context String  The reason why this permission is requested.
 */
function grant(permission: String, context: String);
/**
 * Deny a permission for a notification
 * @see lib/naughty/notification.lua:1274
 * @param permission String  The permission name (just the name, no `request::`).
 * @param context String  The reason why this permission is requested.
 */
function deny(permission: String, context: String);
/**
 * Emit a signal.
 * @see lib/naughty/notification.lua:1301
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/naughty/notification.lua:1307
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/naughty/notification.lua:1320
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
}
