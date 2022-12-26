package externs.wibox.layout;


@:luaRequire("wibox.layout.manual")
extern class Manual extends externs.wibox.widget.Base {
    /** A layout with widgets added at specific positions.
     * @see lib/wibox/layout/manual.lua:35
     */

    /** Add some widgets to the given stack layout.
     *
     * @see lib/wibox/layout/manual.lua:46
     * @param ...rest externs.wibox.Widget  Widgets that should be added
     */
    function add(...rest: externs.wibox.Widget): Void;

    /** Remove a widget from the layout.
     *
     * @see lib/wibox/layout/manual.lua:53
     * @param index Int  The widget index to remove
     */
    function remove(index: Int): Bool;

    /** Insert a new widget in the layout at position `index`.
     *
     * @see lib/wibox/layout/manual.lua:64
     * @param index Int  The position
     * @param widget externs.wibox.Widget  The widget
     */
    function insert(index: Int, widget: externs.wibox.Widget): Bool;

    /** Remove one or more widgets from the layout.
     *
     * @see lib/wibox/layout/manual.lua:87
     * @param ...rest externs.wibox.Widget  Widgets that should be removed (must at least be one)
     */
    function remove_widgets(...rest: externs.wibox.Widget): Bool;

    /** Add a widget at a specific point.
     *
     * @see lib/wibox/layout/manual.lua:230
     * @param widget externs.wibox.Widget  The widget.
     * @param point haxe.extern.EitherType<lua.Table<String, Dynamic>, haxe.Constraints.Function>  Either an `{x=x,y=y}` table or a function returning the new geometry.
     */
    function add_at(widget: externs.wibox.Widget, point: haxe.extern.EitherType<lua.Table<String, Dynamic>, haxe.Constraints.Function>): Void;

    /** Move a widget (by index).
     *
     * @see lib/wibox/layout/manual.lua:254
     * @param index Int  The widget index.
     * @param point haxe.extern.EitherType<lua.Table<String, Dynamic>, haxe.Constraints.Function>  A new point value.
     */
    function move(index: Int, point: haxe.extern.EitherType<lua.Table<String, Dynamic>, haxe.Constraints.Function>): Void;

    /** Move a widget.
     *
     * @see lib/wibox/layout/manual.lua:282
     * @param widget externs.wibox.Widget  The widget.
     * @param point haxe.extern.EitherType<lua.Table<String, Dynamic>, haxe.Constraints.Function>  A new point value.
     */
    function move_widget(widget: externs.wibox.Widget, point: haxe.extern.EitherType<lua.Table<String, Dynamic>, haxe.Constraints.Function>): Void;

    /** Create a manual layout.
     *
     * @see lib/wibox/layout/manual.lua:310
     * @param ...rest lua.Table<String, Dynamic>  Widgets to add to the layout.
     */
    @:selfCall function new(...rest: lua.Table<String, Dynamic>): Void;

    /** Set a widget at a specific index, replacing the current one.
     *
     * @see lib/wibox/layout/manual.lua:336
     * @param index Int  A widget or a widget index
     * @param widget2 externs.wibox.Widget  The widget to replace the previous one with
     */
    function set(index: Int, widget2: externs.wibox.Widget): Bool;

    /** Replace the first instance of `widget` in the layout with `widget2`.
     *
     * @see lib/wibox/layout/manual.lua:352
     * @param widget externs.wibox.Widget  The widget to replace
     * @param widget2 externs.wibox.Widget  The widget to replace `widget` with
     * @param recursive Bool  Recurse into all compatible layouts to find the widget.
     */
    function replace_widget(widget: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/manual.lua:367
     * @param index1 Int  The first widget index
     * @param index2 Int  The second widget index
     */
    function swap(index1: Int, index2: Int): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/manual.lua:390
     * @param widget1 externs.wibox.Widget  The first widget
     * @param widget2 externs.wibox.Widget  The second widget
     * @param recursive Bool  Recurse into all compatible layouts to find the widget.
     */
    function swap_widgets(widget1: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;

    /** Reset the layout.
     *
     * @see lib/wibox/layout/manual.lua:396
     */
    function reset(): Void;
}

