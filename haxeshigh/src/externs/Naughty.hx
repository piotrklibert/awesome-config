package externs;


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

    /** Destroy all notifications on given screens.
     *
     * @see lib/naughty/core.lua:365
     * @param screens lua.Table<String, Dynamic>  Table of screens on which notifications should be destroyed. If nil, destroy notifications on all screens.
     * @param reason naughty.notification_closed_reason  Reason for closing notifications.
     */
    static function destroy_all_notifications(screens: lua.Table<String, Dynamic>, reason: naughty.notification_closed_reason): Null<true>;

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

