package externs.naughty;


@:luaRequire("naughty.notification")
extern class Notification {
    /** A notification object.
     * @see lib/naughty/notification.lua:21
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
    var timeout: Float;

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
    var hover_timeout: Float;

    /**
     * Target screen for the notification.
     * @see lib/naughty/notification.lua:189
     */
    var screen: externs.Screen;

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
    var height: Float;

    /**
     * Popup width.
     * @see lib/naughty/notification.lua:265
     */
    var width: Float;

    /**
     * Notification font.
     * @see lib/naughty/notification.lua:287
     */
    var font: String;

    /**
     * "All in one" way to access the default image or icon.
     * @see lib/naughty/notification.lua:309
     */
    var icon: extype.extern.Mixed.Mixed2<String, externs.gears.Surface>;

    /**
     * Desired icon size in px.
     * @see lib/naughty/notification.lua:314
     */
    var icon_size: Float;

    /**
     * The icon provided in the `app_icon` field of the DBus notification.
     * @see lib/naughty/notification.lua:323
     */
    var app_icon: String;

    /**
     * The notification image.
     * @see lib/naughty/notification.lua:333
     */
    var image: extype.extern.Mixed.Mixed2<String, externs.gears.Surface>;

    /**
     * The notification (animated) images.
     * @see lib/naughty/notification.lua:345
     */
    var images: Null<lua.Table<String, Dynamic>>;

    /**
     * Foreground color.
     * @see lib/naughty/notification.lua:376
     */
    var fg: extype.extern.Mixed.Mixed3<String, externs.gears.Color, pattern>;

    /**
     * Background color.
     * @see lib/naughty/notification.lua:406
     */
    var bg: extype.extern.Mixed.Mixed3<String, externs.gears.Color, pattern>;

    /**
     * Border width.
     * @see lib/naughty/notification.lua:411
     */
    var border_width: Float;

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
    var opacity: Float;

    /**
     * Widget margin.
     * @see lib/naughty/notification.lua:554
     */
    var margin: extype.extern.Mixed.Mixed2<Float, lua.Table<String, Dynamic>>;

    /**
     * Table with any of the above parameters.
     * @see lib/naughty/notification.lua:577
     */
    var preset: lua.Table<String, Dynamic>;

    /**
     * Function that will be called with all arguments.
     * @see lib/naughty/notification.lua:584
     */
    var callback: haxe.Constraints.Function;

    /**
     * A table containing strings that represents actions to buttons.
     * @see lib/naughty/notification.lua:592
     */
    var actions: lua.Table<String, Dynamic>;

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
    var clients: lua.Table<String, Dynamic>;

    /**
     * The maximum popup width.
     * @see lib/naughty/notification.lua:654
     */
    var max_width: Float;

    /**
     * The application name specified by the notification.
     * @see lib/naughty/notification.lua:663
     */
    var app_name: String;

    /**
     * The widget template used to represent the notification.
     * @see lib/naughty/notification.lua:672
     */
    var widget_template: lua.Table<String, Dynamic>;

    /** Destroy notification by notification object.
     *
     * @see lib/naughty/notification.lua:682
     * @param reason String  One of the reasons from `notification_closed_reason`
     * @param keep_visible Bool  If true, keep the notification visible
     */
    function destroy(reason: String, keep_visible: Bool): Bool;

    /** Set new notification timeout.
     *
     * @see lib/naughty/notification.lua:702
     * @param new_timeout Float  Time in seconds after which notification disappears.
     */
    function reset_timeout(new_timeout: Float): Void;

    /** Add more actions to the notification.
     *
     * @see lib/naughty/notification.lua:998
     * @param new_actions lua.Table<String, Dynamic>  <no desc>
     */
    function append_actions(new_actions: lua.Table<String, Dynamic>): Void;

    /** Create a notification.
     *
     * @see lib/naughty/notification.lua:1150
     * @param args lua.Table<String, Dynamic>  The argument table containing any of the arguments below.
     * @param opt String =`beautiful.notification_border_color` or `beautiful.border_color_active` or `'#535d6c'`] args.border_color Border color.
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>, opt: String);

    /** Grant a permission for a notification.
     *
     * @see lib/naughty/notification.lua:1267
     * @param permission String  The permission name (just the name, no `request::`).
     * @param context String  The reason why this permission is requested.
     */
    function grant(permission: String, context: String): Void;

    /** Deny a permission for a notification
     *
     * @see lib/naughty/notification.lua:1274
     * @param permission String  The permission name (just the name, no `request::`).
     * @param context String  The reason why this permission is requested.
     */
    function deny(permission: String, context: String): Void;

    /** Emit a signal.
     *
     * @see lib/naughty/notification.lua:1301
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see lib/naughty/notification.lua:1307
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/naughty/notification.lua:1320
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}
