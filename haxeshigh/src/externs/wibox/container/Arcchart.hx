package externs.wibox.container;


@:luaRequire("wibox.container.arcchart")
extern class Arcchart extends externs.wibox.widget.Base {
    /** A circular chart (arc chart).
     * @see lib/wibox/container/arcchart.lua:17
     */

    /**
     * The widget to wrap in a radial proggressbar.
     * @see lib/wibox/container/arcchart.lua:200
     */
    var widget: externs.wibox.Widget;

    /**
     * The padding between the outline and the progressbar.
     * @see lib/wibox/container/arcchart.lua:244
     */
    var paddings: extype.extern.Mixed.Mixed2<lua.Table<String, Dynamic>, Float>;

    /**
     * The border background color.
     * @see lib/wibox/container/arcchart.lua:251
     */
    var border_color: externs.gears.Color;

    /**
     * The arcchart values foreground colors.
     * @see lib/wibox/container/arcchart.lua:258
     */
    var colors: lua.Table<String, Dynamic>;

    /**
     * The border width.
     * @see lib/wibox/container/arcchart.lua:270
     */
    var border_width: Float;

    /**
     * The minimum value.
     * @see lib/wibox/container/arcchart.lua:275
     */
    var min_value: Float;

    /**
     * The maximum value.
     * @see lib/wibox/container/arcchart.lua:280
     */
    var max_value: Float;

    /**
     * The radial background.
     * @see lib/wibox/container/arcchart.lua:291
     */
    var bg: externs.gears.Color;

    /**
     * The value.
     * @see lib/wibox/container/arcchart.lua:301
     */
    var value: Float;

    /**
     * The values.
     * @see lib/wibox/container/arcchart.lua:310
     */
    var values: lua.Table<String, Dynamic>;

    /**
     * If the chart has rounded edges.
     * @see lib/wibox/container/arcchart.lua:319
     */
    var rounded_edge: Bool;

    /**
     * The arc thickness.
     * @see lib/wibox/container/arcchart.lua:328
     */
    var thickness: Float;

    /**
     * The (radiant) angle where the first value start.
     * @see lib/wibox/container/arcchart.lua:337
     */
    var start_angle: Float;

    /** Reset this layout.
     *
     * @see lib/wibox/container/arcchart.lua:214
     */
    function reset(): Void;

    /** Returns a new arcchart layout.
     *
     * @see lib/wibox/container/arcchart.lua:369
     * @param widget wibox.widget  The widget to display.
     */
    @:selfCall function new(widget: wibox.widget): Void;
}

