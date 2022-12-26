package externs.wibox.container;


@:luaRequire("wibox.container.margin")
extern class Margin extends externs.wibox.widget.Base {
    /** Add a margin around a widget.
     * @see lib/wibox/container/margin.lua:14
     */

    /**
     * The widget to be wrapped the the margins.
     * @see lib/wibox/container/margin.lua:83
     */
    var widget: externs.wibox.Widget;

    /**
     * Set all the margins to val.
     * @see lib/wibox/container/margin.lua:104
     */
    var margins: haxe.extern.EitherType<Int, lua.Table<String, Dynamic>>;

    /**
     * Set the margins color to create a border.
     * @see lib/wibox/container/margin.lua:135
     */
    var color: Dynamic;

    /**
     * Draw the margin even if the content size is 0x0.
     * @see lib/wibox/container/margin.lua:152
     */
    var draw_empty: Bool;

    /**
     * Set the left margin that this layout adds to its widget.
     * @see lib/wibox/container/margin.lua:178
     */
    var left: Int;

    /**
     * Set the right margin that this layout adds to its widget.
     * @see lib/wibox/container/margin.lua:184
     */
    var right: Int;

    /**
     * Set the top margin that this layout adds to its widget.
     * @see lib/wibox/container/margin.lua:190
     */
    var top: Int;

    /**
     * Set the bottom margin that this layout adds to its widget.
     * @see lib/wibox/container/margin.lua:196
     */
    var bottom: Int;

    /** Reset this layout.
     *
     * @see lib/wibox/container/margin.lua:166
     */
    function reset(): Void;

    /** Returns a new margin container.
     *
     * @see lib/wibox/container/margin.lua:221
     * @param widget Dynamic  A widget to use.
     * @param left Dynamic  A margin to use on the left side of the widget.
     * @param right Dynamic  A margin to use on the right side of the widget.
     * @param top Dynamic  A margin to use on the top side of the widget.
     * @param bottom Dynamic  A margin to use on the bottom side of the widget.
     * @param color Dynamic  A color for the margins.
     * @param draw_empty Dynamic  whether or not to draw the margin when the content is empty
     */
    @:selfCall function new(widget: Dynamic, left: Dynamic, right: Dynamic, top: Dynamic, bottom: Dynamic, color: Dynamic, draw_empty: Dynamic): Void;
}

