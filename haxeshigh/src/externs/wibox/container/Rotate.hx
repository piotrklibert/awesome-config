package externs.wibox.container;


@:luaRequire("wibox.container.rotate")
extern class Rotate extends externs.wibox.widget.Base {
    /** A container rotating the conained widget by 90 degrees.
     * @see lib/wibox/container/rotate.lua:14
     */

    /**
     * The widget to be rotated.
     * @see lib/wibox/container/rotate.lua:71
     */
    var widget: externs.wibox.Widget;

    /**
     * The direction of this rotating container.
     * @see lib/wibox/container/rotate.lua:135
     */
    var direction: String;

    /** Reset this layout.
     *
     * @see lib/wibox/container/rotate.lua:91
     */
    function reset(): Void;

    /** Returns a new rotate container.
     *
     * @see lib/wibox/container/rotate.lua:166
     * @param widget externs.wibox.Widget  The widget to display.
     * @param dir String  The direction to rotate to.
     */
    @:selfCall function new(widget: externs.wibox.Widget, dir: String): Void;
}

