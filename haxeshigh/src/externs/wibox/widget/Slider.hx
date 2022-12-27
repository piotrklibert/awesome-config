package externs.wibox.widget;


@:luaRequire("wibox.widget.slider")
extern class Slider extends externs.wibox.widget.Base {
    /** An interactive mouse based slider widget.
     * @see lib/wibox/widget/slider.lua:33
     */

    /**
     * The slider handle shape.
     * @see lib/wibox/widget/slider.lua:61
     */
    var handle_shape: externs.gears.Shape;

    /**
     * The slider handle color.
     * @see lib/wibox/widget/slider.lua:73
     */
    var handle_color: externs.gears.Color;

    /**
     * The slider handle margins.
     * @see lib/wibox/widget/slider.lua:89
     */
    var handle_margins: lua.Table<String, Dynamic>;

    /**
     * The slider handle width.
     * @see lib/wibox/widget/slider.lua:101
     */
    var handle_width: Float;

    /**
     * The handle border_color.
     * @see lib/wibox/widget/slider.lua:113
     */
    var handle_border_color: externs.gears.Color;

    /**
     * The handle border width.
     * @see lib/wibox/widget/slider.lua:119
     */
    var handle_border_width: Float;

    /**
     * The bar (background) shape.
     * @see lib/wibox/widget/slider.lua:132
     */
    var bar_shape: externs.gears.Shape;

    /**
     * The bar (background) height.
     * @see lib/wibox/widget/slider.lua:144
     */
    var bar_height: Float;

    /**
     * The bar (background) color.
     * @see lib/wibox/widget/slider.lua:156
     */
    var bar_color: externs.gears.Color;

    /**
     * The bar (active) color.
     * @see lib/wibox/widget/slider.lua:169
     */
    var bar_active_color: externs.gears.Color;

    /**
     * The bar (background) margins.
     * @see lib/wibox/widget/slider.lua:185
     */
    var bar_margins: lua.Table<String, Dynamic>;

    /**
     * The bar (background) border width.
     * @see lib/wibox/widget/slider.lua:190
     */
    var bar_border_width: Float;

    /**
     * The bar (background) border_color.
     * @see lib/wibox/widget/slider.lua:202
     */
    var bar_border_color: externs.gears.Color;

    /**
     * The slider value.
     * @see lib/wibox/widget/slider.lua:215
     */
    var value: Float;

    /**
     * The slider minimum value.
     * @see lib/wibox/widget/slider.lua:221
     */
    var minimum: Float;

    /**
     * The slider maximum value.
     * @see lib/wibox/widget/slider.lua:227
     */
    var maximum: Float;

    /** Create a slider widget.
     *
     * @see lib/wibox/widget/slider.lua:582
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;
}

