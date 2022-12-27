package externs.wibox.widget;


@:luaRequire("wibox.widget.systray")
extern class Systray extends externs.wibox.widget.Base {
    /** 
     * @see lib/wibox/widget/systray.lua:8
     */

    /**
     * Set the size of a single icon.
     * @see lib/wibox/widget/systray.lua:149
     */
    var base_size: Null<Int>;

    /**
     * Decide between horizontal or vertical display.
     * @see lib/wibox/widget/systray.lua:163
     */
    var horizontal: Bool;

    /**
     * Should the systray icons be displayed in reverse order?
     * @see lib/wibox/widget/systray.lua:177
     */
    var reverse: Bool;

    /**
     * Set the screen that the systray should be displayed on.
     * @see lib/wibox/widget/systray.lua:195
     */
    var screen: extype.extern.Mixed.Mixed2<externs.Screen, "primary">;

    /** Create the systray widget.
     *
     * @see lib/wibox/widget/systray.lua:211
     * @param revers Bool  Show in the opposite direction
     */
    @:selfCall function new(revers: Bool): Void;
}

