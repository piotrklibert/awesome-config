package externs.naughty.widget;


@:luaRequire("naughty.widget.icon")
extern class Icon {
    /** A notification square icon.
     * @see lib/naughty/widget/icon.lua:33
     */

    /**
     * The attached notification.
     * @see lib/naughty/widget/icon.lua:99
     */
    var notification: naughty.notification;

    /**
     * How small icons are handled.
     * @see lib/naughty/widget/icon.lua:150
     */
    var resize_strategy: String;

    /**
     * Get or set the children elements.
     * @see lib/naughty/widget/icon.lua:213
     */
    var children: lua.Table<String, Dynamic>;

    /**
     * Get all direct and indirect children widgets.
     * @see lib/naughty/widget/icon.lua:221
     */
    var all_children: lua.Table<String, Dynamic>;

    /**
     * Force a widget height.
     * @see lib/naughty/widget/icon.lua:232
     */
    var forced_height: Int;

    /**
     * Force a widget width.
     * @see lib/naughty/widget/icon.lua:237
     */
    var forced_width: Int;

    /**
     * The widget opacity (transparency).
     * @see lib/naughty/widget/icon.lua:242
     */
    var opacity: Float;

    /**
     * The widget visibility.
     * @see lib/naughty/widget/icon.lua:247
     */
    var visible: Bool;

    /**
     * The widget buttons.
     * @see lib/naughty/widget/icon.lua:256
     */
    var buttons: lua.Table<String, Dynamic>;

    /** Create a new naughty.widget.icon.
     *
     * @see lib/naughty/widget/icon.lua:171
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;

    /** Set a declarative widget hierarchy description.
     *
     * @see lib/naughty/widget/icon.lua:227
     * @param args Dynamic  An array containing the widgets disposition
     */
    function setup(args: Dynamic): Void;

    /** Add a new `awful.button` to this widget.
     *
     * @see lib/naughty/widget/icon.lua:261
     * @param button externs.awful.Button  The button to add.
     */
    function add_button(button: externs.awful.Button): Void;

    /** Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
     *
     * @see lib/naughty/widget/icon.lua:269
     * @param signal_name String  <no desc>
     * @param ...rest Dynamic  Other arguments
     */
    function emit_signal_recursive(signal_name: String, ...rest: Dynamic): Void;

    /** Emit a signal.
     *
     * @see lib/naughty/widget/icon.lua:413
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see lib/naughty/widget/icon.lua:419
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/naughty/widget/icon.lua:432
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}

