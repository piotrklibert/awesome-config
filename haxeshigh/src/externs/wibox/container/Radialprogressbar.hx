package externs.wibox.container;


@:luaRequire("wibox.container.radialprogressbar")
extern class Radialprogressbar extends externs.wibox.widget.Base {
    /** A circular progressbar wrapper.
     * @see lib/wibox/container/radialprogressbar.lua:30
     */

    /**
     * The widget to wrap in a radial proggressbar.
     * @see lib/wibox/container/radialprogressbar.lua:153
     */
    var widget: externs.wibox.Widget;

    /**
     * The padding between the outline and the progressbar.
     * @see lib/wibox/container/radialprogressbar.lua:196
     */
    var paddings: extype.extern.Mixed.Mixed2<lua.Table<String, Dynamic>, Float>;

    /**
     * The progressbar value.
     * @see lib/wibox/container/radialprogressbar.lua:206
     */
    var value: Float;

    /**
     * The border background color.
     * @see lib/wibox/container/radialprogressbar.lua:233
     */
    var border_color: externs.gears.Color;

    /**
     * The border foreground color.
     * @see lib/wibox/container/radialprogressbar.lua:244
     */
    var color: externs.gears.Color;

    /**
     * The border width.
     * @see lib/wibox/container/radialprogressbar.lua:255
     */
    var border_width: Float;

    /**
     * The minimum value.
     * @see lib/wibox/container/radialprogressbar.lua:261
     */
    var min_value: Float;

    /**
     * The maximum value.
     * @see lib/wibox/container/radialprogressbar.lua:267
     */
    var max_value: Float;

    /** Reset this container.
     *
     * @see lib/wibox/container/radialprogressbar.lua:168
     */
    function reset(): Void;

    /** Returns a new radialprogressbar layout.
     *
     * @see lib/wibox/container/radialprogressbar.lua:298
     * @param widget externs.wibox.Widget  The widget to display.
     */
    @:selfCall function new(widget: externs.wibox.Widget): Void;
}

