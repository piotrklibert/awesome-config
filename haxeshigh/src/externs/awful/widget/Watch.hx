package externs.awful.widget;


@:luaRequire("awful.widget.watch")
extern class Watch {
    /** Watch widget.
     * @see lib/awful/widget/watch.lua:43
     */

    /**
     * Get or set the children elements.
     * @see lib/awful/widget/watch.lua:117
     */
    var children: lua.Table<String, Dynamic>;

    /**
     * Get all direct and indirect children widgets.
     * @see lib/awful/widget/watch.lua:125
     */
    var all_children: lua.Table<String, Dynamic>;

    /**
     * Force a widget height.
     * @see lib/awful/widget/watch.lua:136
     */
    var forced_height: Int;

    /**
     * Force a widget width.
     * @see lib/awful/widget/watch.lua:141
     */
    var forced_width: Int;

    /**
     * The widget opacity (transparency).
     * @see lib/awful/widget/watch.lua:146
     */
    var opacity: Int;

    /**
     * The widget visibility.
     * @see lib/awful/widget/watch.lua:151
     */
    var visible: Bool;

    /**
     * The widget buttons.
     * @see lib/awful/widget/watch.lua:160
     */
    var buttons: Dynamic;

    /** Create a textbox that shows the output of a command and updates it at a given time interval.
     *
     * @see lib/awful/widget/watch.lua:78
     * @param command haxe.extern.EitherType<String, lua.Table<String, Dynamic>>  The command.
     * @param timeout Int  The time interval at which the textbox will be updated.
     * @param callback haxe.Constraints.Function  The function that will be called after the command output will be received. it is shown in the textbox. Defaults to: function(widget, stdout, stderr, exitreason, exitcode) widget:set_text(stdout) end
     * @param base_widget Dynamic  Base widget.
     */
    @:selfCall function new(command: haxe.extern.EitherType<String, lua.Table<String, Dynamic>>, timeout: Int, callback: haxe.Constraints.Function, base_widget: Dynamic): Void;

    /** Set a declarative widget hierarchy description.
     *
     * @see lib/awful/widget/watch.lua:131
     * @param args Dynamic  An array containing the widgets disposition
     */
    function setup(args: Dynamic): Void;

    /** Add a new `awful.button` to this widget.
     *
     * @see lib/awful/widget/watch.lua:165
     * @param button externs.awful.Button  The button to add.
     */
    function add_button(button: externs.awful.Button): Void;

    /** Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
     *
     * @see lib/awful/widget/watch.lua:173
     * @param signal_name String  <no desc>
     * @param ...rest Dynamic  Other arguments
     */
    function emit_signal_recursive(signal_name: String, ...rest: Dynamic): Void;

    /** Emit a signal.
     *
     * @see lib/awful/widget/watch.lua:317
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see lib/awful/widget/watch.lua:323
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/awful/widget/watch.lua:336
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}

