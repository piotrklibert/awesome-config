package externs.wibox.container;


@:luaRequire("wibox.container.arcchart")
extern class Arcchart extends externs.wibox.widget.Base {
/** A circular chart (arc chart).
 * lib/wibox/container/arcchart.lua:17
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
var paddings: haxe.extern.EitherType<lua.Table<String, Dynamic>, Int>;
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
var border_width: Int;
/**
 * The minimum value.
 * @see lib/wibox/container/arcchart.lua:275
 */
var min_value: Int;
/**
 * The maximum value.
 * @see lib/wibox/container/arcchart.lua:280
 */
var max_value: Int;
/**
 * The radial background.
 * @see lib/wibox/container/arcchart.lua:291
 */
var bg: externs.gears.Color;
/**
 * The value.
 * @see lib/wibox/container/arcchart.lua:301
 */
var value: Int;
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
var thickness: Int;
/**
 * The (radiant) angle where the first value start.
 * @see lib/wibox/container/arcchart.lua:337
 */
var start_angle: Int;
/**
 * Returns a new arcchart layout.
 * @see lib/wibox/container/arcchart.lua:369
 * @param widget wibox.widget  The widget to display.
 */
@:selfCall function new(widget: wibox.widget);
/**
 * Reset this layout.
 * @see lib/wibox/container/arcchart.lua:214
 */
function reset();
}
