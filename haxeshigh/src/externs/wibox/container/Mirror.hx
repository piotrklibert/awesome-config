package externs.wibox.container;


@:luaRequire("wibox.container.mirror")
extern class Mirror extends externs.wibox.widget.Base {
    /** Reflect a widget along one or both axis.
     * @see lib/wibox/container/mirror.lua:14
     */

    /**
     * The widget to be reflected.
     * @see lib/wibox/container/mirror.lua:59
     */
    var widget: externs.wibox.Widget;

    /**
     * Get the reflection of this mirror layout.
     * @see lib/wibox/container/mirror.lua:105
     */
    var reflection: lua.Table<String, Dynamic>;

    /** Reset this layout.
     *
     * @see lib/wibox/container/mirror.lua:77
     */
    function reset(): Void;

    /** Returns a new mirror container.
     *
     * @see lib/wibox/container/mirror.lua:119
     * @param widget externs.wibox.Widget  The widget to display.
     * @param reflection lua.Table<String, Dynamic>  A table describing the reflection to apply.
     */
    @:selfCall function new(widget: externs.wibox.Widget, reflection: lua.Table<String, Dynamic>);
}
