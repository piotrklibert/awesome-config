package externs.naughty.widget;


@:luaRequire("naughty.widget.message")
extern class Message {
    /** A notification content message.
     * @see lib/naughty/widget/message.lua:31
     */

    /**
     * The attached notification.
     * @see lib/naughty/widget/message.lua:43
     */
    var notification: naughty.notification;

    /**
     * Get or set the children elements.
     * @see lib/naughty/widget/message.lua:118
     */
    var children: lua.Table<String, Dynamic>;

    /**
     * Get all direct and indirect children widgets.
     * @see lib/naughty/widget/message.lua:126
     */
    var all_children: lua.Table<String, Dynamic>;

    /**
     * Force a widget height.
     * @see lib/naughty/widget/message.lua:137
     */
    var forced_height: Int;

    /**
     * Force a widget width.
     * @see lib/naughty/widget/message.lua:142
     */
    var forced_width: Int;

    /**
     * The widget opacity (transparency).
     * @see lib/naughty/widget/message.lua:147
     */
    var opacity: Float;

    /**
     * The widget visibility.
     * @see lib/naughty/widget/message.lua:152
     */
    var visible: Bool;

    /**
     * The widget buttons.
     * @see lib/naughty/widget/message.lua:161
     */
    var buttons: lua.Table<String, Dynamic>;

    /** Create a new naughty.widget.message.
     *
     * @see lib/naughty/widget/message.lua:71
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;

    /** Set a declarative widget hierarchy description.
     *
     * @see lib/naughty/widget/message.lua:132
     * @param args Dynamic  An array containing the widgets disposition
     */
    function setup(args: Dynamic): Void;

    /** Add a new `awful.button` to this widget.
     *
     * @see lib/naughty/widget/message.lua:166
     * @param button externs.awful.Button  The button to add.
     */
    function add_button(button: externs.awful.Button): Void;

    /** Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
     *
     * @see lib/naughty/widget/message.lua:174
     * @param signal_name String  <no desc>
     * @param ...rest Dynamic  Other arguments
     */
    function emit_signal_recursive(signal_name: String, ...rest: Dynamic): Void;

    /** Emit a signal.
     *
     * @see lib/naughty/widget/message.lua:318
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see lib/naughty/widget/message.lua:324
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/naughty/widget/message.lua:337
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}

