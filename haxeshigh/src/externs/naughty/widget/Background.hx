package externs.naughty.widget;


@:luaRequire("naughty.widget.background")
extern class Background {
    /** A notification background.
     * @see lib/naughty/container/background.lua:21
     */

    /**
     * The attached notification.
     * @see lib/naughty/container/background.lua:48
     */
    var notification: naughty.notification;

    /**
     * Get or set the children elements.
     * @see lib/naughty/container/background.lua:119
     */
    var children: lua.Table<String, Dynamic>;

    /**
     * Get all direct and indirect children widgets.
     * @see lib/naughty/container/background.lua:127
     */
    var all_children: lua.Table<String, Dynamic>;

    /**
     * Force a widget height.
     * @see lib/naughty/container/background.lua:138
     */
    var forced_height: Int;

    /**
     * Force a widget width.
     * @see lib/naughty/container/background.lua:143
     */
    var forced_width: Int;

    /**
     * The widget opacity (transparency).
     * @see lib/naughty/container/background.lua:148
     */
    var opacity: Float;

    /**
     * The widget visibility.
     * @see lib/naughty/container/background.lua:153
     */
    var visible: Bool;

    /**
     * The widget buttons.
     * @see lib/naughty/container/background.lua:162
     */
    var buttons: lua.Table<String, Dynamic>;

    /** Create a new naughty.container.background.
     *
     * @see lib/naughty/container/background.lua:83
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>);

    /** Set a declarative widget hierarchy description.
     *
     * @see lib/naughty/container/background.lua:133
     * @param args Dynamic  An array containing the widgets disposition
     */
    function setup(args: Dynamic): Void;

    /** Add a new `awful.button` to this widget.
     *
     * @see lib/naughty/container/background.lua:167
     * @param button externs.awful.Button  The button to add.
     */
    function add_button(button: externs.awful.Button): Void;

    /** Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
     *
     * @see lib/naughty/container/background.lua:175
     * @param signal_name String  <no desc>
     * @param ...rest Dynamic  Other arguments
     */
    function emit_signal_recursive(signal_name: String, ...rest: Dynamic): Void;

    /** Emit a signal.
     *
     * @see lib/naughty/container/background.lua:319
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see lib/naughty/container/background.lua:325
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/naughty/container/background.lua:338
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}
