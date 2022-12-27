package externs.awful.widget;


@:luaRequire("awful.widget.only_on_screen")
extern class Only_on_screen extends externs.wibox.widget.Base {
    /** A container that makes a widget display only on a specified screen.
     * @see lib/awful/widget/only_on_screen.lua:11
     */

    /**
     * The widget to be displayed
     * @see lib/awful/widget/only_on_screen.lua:55
     */
    var widget: externs.wibox.Widget;

    /**
     * The screen to display on.
     * @see lib/awful/widget/only_on_screen.lua:74
     */
    var screen: externs.Screen;

    /** Returns a new only_on_screen container.
     *
     * @see lib/awful/widget/only_on_screen.lua:90
     * @param widget Dynamic  The widget to display.
     * @param s Dynamic  The screen to display on.
     */
    @:selfCall function new(widget: Dynamic, s: Dynamic);
}
