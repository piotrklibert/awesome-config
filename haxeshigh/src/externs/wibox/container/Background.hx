package externs.wibox.container;


@:luaRequire("wibox.container.background")
extern class Background extends externs.wibox.widget.Base {
/** A container capable of changing the background color, foreground color and
 widget shape.
 * lib/wibox/container/background.lua:15
 */
/**
 * The widget displayed in the background widget.
 * @see lib/wibox/container/background.lua:245
 */
var widget: externs.wibox.Widget;
/**
 * The background color/pattern/gradient to use.
 * @see lib/wibox/container/background.lua:295
 */
var bg: externs.gears.Color;
/**
 * The foreground (text) color/pattern/gradient to use.
 * @see lib/wibox/container/background.lua:345
 */
var fg: externs.gears.Color;
/**
 * The background shape.
 * @see lib/wibox/container/background.lua:409
 */
var shape: haxe.extern.EitherType<externs.gears.Shape, Function>;
/**
 * Add a border of a specific width.
 * @see lib/wibox/container/background.lua:453
 */
var border_width: Int;
/**
 * Set the color for the border.
 * @see lib/wibox/container/background.lua:501
 */
var border_color: externs.gears.Color;
/**
 * How the border width affects the contained widget.
 * @see lib/wibox/container/background.lua:549
 */
var border_strategy: String;
/**
 * The background image to use.
 * @see lib/wibox/container/background.lua:564
 */
var bgimage: haxe.extern.EitherType<String, surface, Function>;
/**
 * Returns a new background container.
 * @see lib/wibox/container/background.lua:584
 * @param widget externs.wibox.Widget  The widget to display.
 * @param bg externs.gears.Color  The background to use for that widget.
 * @param shape haxe.extern.EitherType<externs.gears.Shape, Function>  A `gears.shape` compatible shape function
 */
@:selfCall function new(widget: externs.wibox.Widget, bg: externs.gears.Color, shape: haxe.extern.EitherType<externs.gears.Shape, Function>);
/**
 * Set the background shape.
 * @see lib/wibox/container/background.lua:418
 * @param shape haxe.extern.EitherType<externs.gears.Shape, Function>  A function taking a context, width and height as arguments
 */
function set_shape(shape: haxe.extern.EitherType<externs.gears.Shape, Function>);
}
