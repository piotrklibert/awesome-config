package externs.naughty;


@:luaRequire("naughty.action")
extern class Action {
    /** A notification action.
     * @see lib/naughty/action.lua:12
     */

    /**
     * The action position (index).
     * @see lib/naughty/action.lua:46
     */
    var position: Int;

    /**
     * The action icon.
     * @see lib/naughty/action.lua:51
     */
    var icon: haxe.extern.EitherType<externs.gears.Surface, String>;

    /**
     * If the action should hide the label and only display the icon.
     * @see lib/naughty/action.lua:89
     */
    var icon_only: Bool;

    /** Create a new action.
     *
     * @see lib/naughty/action.lua:27
     * @param args lua.Table<String, Dynamic>  The arguments.
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;

    /** Execute this action.
     *
     * @see lib/naughty/action.lua:153
     * @param notif naughty.notification  A notification object on which the action was invoked. If a notification is shared by many object (like a "mute" or "snooze" action added to all notification), calling `:invoke()` without adding the `notif` context will cause unexpected results.
     */
    function invoke(notif: naughty.notification): Void;

    /** Emit a signal.
     *
     * @see lib/naughty/action.lua:196
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see lib/naughty/action.lua:202
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/naughty/action.lua:215
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}

