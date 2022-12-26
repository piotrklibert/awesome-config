package externs.wibox.layout;


@:luaRequire("wibox.layout.stack")
extern class Stack extends externs.wibox.layout.Fixed {
    /** A stacked layout.
     * @see lib/wibox/layout/stack.lua:28
     */

    /**
     * Add spacing around the widget, similar to the margin container.
     * @see lib/wibox/layout/stack.lua:90
     */
    var spacing: Int;

    /**
     * If only the first stack widget is drawn.
     * @see lib/wibox/layout/stack.lua:126
     */
    var top_only: Bool;

    /**
     * Add an horizontal offset to each layers.
     * @see lib/wibox/layout/stack.lua:195
     */
    var horizontal_offset: Int;

    /**
     * Add an vertical offset to each layers.
     * @see lib/wibox/layout/stack.lua:205
     */
    var vertial_offset: Int;

    /** Add some widgets to the given stack layout.
     *
     * @see lib/wibox/layout/stack.lua:42
     * @param ...rest externs.wibox.Widget  Widgets that should be added (must at least be one)
     */
    function add(...rest: externs.wibox.Widget): Void;

    /** Remove a widget from the layout.
     *
     * @see lib/wibox/layout/stack.lua:49
     * @param The index  widget index to remove
     */
    function remove(The: index): Bool;

    /** Insert a new widget in the layout at position `index`.
     *
     * @see lib/wibox/layout/stack.lua:61
     * @param index Int  The position
     * @param widget externs.wibox.Widget  The widget
     */
    function insert(index: Int, widget: externs.wibox.Widget): Bool;

    /** Remove one or more widgets from the layout.
     *
     * @see lib/wibox/layout/stack.lua:71
     * @param widget externs.wibox.Widget  ... Widgets that should be removed (must at least be one)
     */
    function remove_widgets(widget: externs.wibox.Widget): Bool;

    /** Raise a widget at `index` to the top of the stack.
     *
     * @see lib/wibox/layout/stack.lua:140
     * @param index Int  the widget index to raise
     */
    function raise(index: Int): Void;

    /** Raise the first instance of `widget`.
     *
     * @see lib/wibox/layout/stack.lua:156
     * @param widget externs.wibox.Widget  The widget to raise
     * @param recursive Bool  Also look deeper in the hierarchy to find the widget
     */
    function raise_widget(widget: externs.wibox.Widget, recursive: Bool): Void;

    /** Create a new stack layout.
     *
     * @see lib/wibox/layout/stack.lua:230
     */
    @:selfCall function new(): Void;

    /** Set a widget at a specific index, replacing the current one.
     *
     * @see lib/wibox/layout/stack.lua:259
     * @param index Int  A widget or a widget index
     * @param widget2 externs.wibox.Widget  The widget to replace the previous one with
     */
    function set(index: Int, widget2: externs.wibox.Widget): Bool;

    /** Replace the first instance of `widget` in the layout with `widget2`.
     *
     * @see lib/wibox/layout/stack.lua:275
     * @param widget externs.wibox.Widget  The widget to replace
     * @param widget2 externs.wibox.Widget  The widget to replace `widget` with
     * @param recursive Bool  Recurse into all compatible layouts to find the widget.
     */
    function replace_widget(widget: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/stack.lua:290
     * @param index1 Int  The first widget index
     * @param index2 Int  The second widget index
     */
    function swap(index1: Int, index2: Int): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/stack.lua:313
     * @param widget1 externs.wibox.Widget  The first widget
     * @param widget2 externs.wibox.Widget  The second widget
     * @param recursive Bool  Recurse into all compatible layouts to find the widget.
     */
    function swap_widgets(widget1: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;

    /** Reset the layout.
     *
     * @see lib/wibox/layout/stack.lua:319
     */
    function reset(): Void;
}

