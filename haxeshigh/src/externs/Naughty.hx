package externs;
import lua.Table;

typedef NaughtyOptions = {
  @:optional var ?actions: AnyTable;     // Mapping that maps a: String = to a callback when this action is selected. (optional)
  @:optional var ?bg: String;            // `beautiful.notification_fg` or `beautiful.bg_focus` or `'#535d6c'` Background color. (default)
  @:optional var ?border_color: String;  // `beautiful.notification_border_color` or `beautiful.border_focus` or `'#535d6c'` Border color. (default)
  @:optional var ?border_width: Int;     // `beautiful.notification_border_width` or 1 Border width. (default)
  @:optional var ?callback: Dynamic;     // Function that will be called with all arguments. The notification will only be displayed if the function returns true. Note: this = function is only relevant to notifications sent via dbus. (optional)
  @:optional var ?destroy: Dynamic;      // Function to run when notification is destroyed. (optional)
  @:optional var ?fg: String;            // `beautiful.notification_fg` or `beautiful.fg_focus` or `'#ffffff'` Foreground color. (default)
  @:optional var ?font: String;          // `beautiful.notification_font` or `beautiful.font` or `awesome.font` Notification font. (default)
  @:optional var ?height: Int;           // `beautiful.notification_height` or auto Popup height. (default)
  @:optional var ?hover_timeout: Float;    // Delay in seconds after which hovered popup disappears. (optional)
  @:optional var ?icon: String;          // Path to icon. (optional)
  @:optional var ?icon_size: Int;        // Desired icon size in px. (optional)
  @:optional var ?ignore_suspend: Bool;  // false If set to true this notification will be shown even if notifications are suspended via naughty.suspend. (default)
  @:optional var ?margin: Dynamic;       // `beautiful.notification_margin` gears.margin Widget margin. (default)
  @:optional var ?max_height: Int;       // `beautiful.notification_max_height` or auto Popup maximum height. (default)
  @:optional var ?max_width: Int;        // `beautiful.notification_max_width` or auto Popup maximum width. (default)
  @:optional var ?ontop: Bool;           // true Boolean forcing popups to display on top. (default)
  @:optional var ?opacity: Dynamic;      // `beautiful.notification_opacity` gears.opacity Widget opacity. (default)
  @:optional var ?position: String;      // "top_right" Corner of the workarea displaying the popups. Values: "top_right =", "top_left", "bottom_left", "bottom_right", "top_middle", "bottom_middle". (default)
  @:optional var ?preset: AnyTable;      // Table with any of the above parameters. Note: Any  parameters specified directly in args will override ones defined in the preset. (optional)
  @:optional var ?replaces_id: Int;      // Replace the notification with the given ID. (optional)
  @:optional var ?run: Dynamic;          // func Function to run on left click. The notification object will be passed to it as an argument. You need to call e.g. notification.die(naughty.notificationClosedReason.dismissedByUser) from there to dismiss the notification yourself. (optional)
  @:optional var ?screen: Int;           // or screen Target screen for the notification. (default focused)
  @:optional var ?shape: Dynamic;        // `beautiful.notification_shape` gears.shape Widget shape. (default)
  @:optional var ?text: String;          // "" Text of the notification. (default)
  @:optional var ?timeout: Int;          // 5 Time in seconds after which popup expires. Set 0 for no timeout. (default)
  @:optional var ?title: String;         // Title of the notification. (optional)
  @:optional var ?width: Int;            // `beautiful.notification_width` or auto Popup width. (default)
}

enum abstract CloseReason(Int) {
    var dismissedByCommand = 3;
    var dismissedByUser = 2;
    var dismissed_by_command = 3;
    var dismissed_by_user = 2;
    var expired = 1;
    var silent = -1;
    var too_many_on_screen = -2;
    var undefined = 4;
}

@:luaRequire("naughty")
extern class Naughty {
    /** Notification library.
     * @see lib/naughty/core.lua:13
     */

    /**
     * The global suspension state.
     * @see lib/naughty/core.lua:109
     */
    var suspended: Bool;

    /**
     * Do not allow notifications to auto-expire.
     * @see lib/naughty/core.lua:119
     */
    var expiration_paused: Bool;

    /**
     * A table with all active notifications.
     * @see lib/naughty/core.lua:131
     */
    var active: lua.Table<String, Dynamic>;

    /**
     * True when there is a handler connected to `request::display`.
     * @see lib/naughty/core.lua:135
     */
    var has_display_handler: Bool;

    /**
     * If the timeout needs to be reset when a property changes.
     * @see lib/naughty/core.lua:144
     */
    var auto_reset_timeout: Bool;

    /**
     * Enable or disable naughty ability to claim to support animations.
     * @see lib/naughty/core.lua:154
     */
    var image_animations_enabled: Bool;

    /**
     * Enable or disable the persistent notifications.
     * @see lib/naughty/core.lua:170
     */
    var persistence_enabled: Bool;

    @:overload(function (o: AnyTable): AnyTable {})
    static function notification(args: NaughtyOptions): AnyTable;


    /** Destroy all notifications on given screens.
     *
     * @see lib/naughty/core.lua:365
     * @param screens lua.Table<String, Dynamic>  Table of screens on which notifications should be destroyed. If nil, destroy notifications on all screens.
     * @param reason naughty.notification_closed_reason  Reason for closing notifications.
     */
    static function destroy_all_notifications(screens: lua.Table<String, Dynamic>, reason: CloseReason): Null<Bool>;

    /** Get notification by ID
     *
     * @see lib/naughty/core.lua:401
     * @param id Dynamic  ID of the notification
     */
    static function get_by_id(id: Dynamic): Void;

    /** Connect a global signal on the module.
     *
     * @see lib/naughty/core.lua:875
     * @param name String  The name of the signal
     * @param func haxe.Constraints.Function  The function to attach
     */
    static function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Emit a module signal.
     *
     * @see lib/naughty/core.lua:880
     * @param name String  The signal name.
     * @param ...rest Dynamic  The signal callback arguments
     */
    static function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Disconnect a signal from a source.
     *
     * @see lib/naughty/core.lua:886
     * @param name String  The name of the signal
     * @param func haxe.Constraints.Function  The attached function
     */
    static function disconnect_signal(name: String, func: haxe.Constraints.Function): Bool;
}
