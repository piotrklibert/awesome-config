package externs.awful.widget;


@:luaRequire("awful.widget.keyboardlayout")
extern class Keyboardlayout {
    /**
     * @see lib/awful/widget/keyboardlayout.lua:7
     */

    /**
     * Get or set the children elements.
     * @see lib/awful/widget/keyboardlayout.lua:332
     */
    var children: lua.Table<String, Dynamic>;

    /**
     * Get all direct and indirect children widgets.
     * @see lib/awful/widget/keyboardlayout.lua:340
     */
    var all_children: lua.Table<String, Dynamic>;

    /**
     * Force a widget height.
     * @see lib/awful/widget/keyboardlayout.lua:351
     */
    var forced_height: Int;

    /**
     * Force a widget width.
     * @see lib/awful/widget/keyboardlayout.lua:356
     */
    var forced_width: Int;

    /**
     * The widget opacity (transparency).
     * @see lib/awful/widget/keyboardlayout.lua:361
     */
    var opacity: Float;

    /**
     * The widget visibility.
     * @see lib/awful/widget/keyboardlayout.lua:366
     */
    var visible: Bool;

    /**
     * The widget buttons.
     * @see lib/awful/widget/keyboardlayout.lua:375
     */
    var buttons: lua.Table<String, Dynamic>;

    /** Auxiliary function for the local function update_layout().
     *
     * @see lib/awful/widget/keyboardlayout.lua:138
     * @param group_names String  The string awesome.xkb_get_group_names() returns.
     */
    static function get_groups_from_group_names(group_names: String): lua.Table<String, Dynamic>;

    /** Select the next layout.
     *
     * @see lib/awful/widget/keyboardlayout.lua:258
     */
    function next_layout(): Void;

    /** Create a keyboard layout widget.
     *
     * @see lib/awful/widget/keyboardlayout.lua:264
     */
    @:selfCall function new();

    /** Set a declarative widget hierarchy description.
     *
     * @see lib/awful/widget/keyboardlayout.lua:346
     * @param args Dynamic  An array containing the widgets disposition
     */
    function setup(args: Dynamic): Void;

    /** Add a new `awful.button` to this widget.
     *
     * @see lib/awful/widget/keyboardlayout.lua:380
     * @param button externs.awful.Button  The button to add.
     */
    function add_button(button: externs.awful.Button): Void;

    /** Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
     *
     * @see lib/awful/widget/keyboardlayout.lua:388
     * @param signal_name String  <no desc>
     * @param ...rest Dynamic  Other arguments
     */
    function emit_signal_recursive(signal_name: String, ...rest: Dynamic): Void;

    /** Emit a signal.
     *
     * @see lib/awful/widget/keyboardlayout.lua:532
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see lib/awful/widget/keyboardlayout.lua:538
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/awful/widget/keyboardlayout.lua:551
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}
