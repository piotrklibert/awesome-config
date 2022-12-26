package externs.wibox.widget;


@:luaRequire("wibox.widget.progressbar")
extern class Progressbar extends externs.wibox.widget.Base {
    /** A progressbar widget.
     * @see lib/wibox/widget/progressbar.lua:145
     */

    /**
     * The progressbar border color.
     * @see lib/wibox/widget/progressbar.lua:181
     */
    var border_color: externs.gears.Color;

    /**
     * The progressbar border width.
     * @see lib/wibox/widget/progressbar.lua:202
     */
    var border_width: Int;

    /**
     * The progressbar inner border color.
     * @see lib/wibox/widget/progressbar.lua:226
     */
    var bar_border_color: externs.gears.Color;

    /**
     * The progressbar inner border width.
     * @see lib/wibox/widget/progressbar.lua:247
     */
    var bar_border_width: Int;

    /**
     * The progressbar foreground color.
     * @see lib/wibox/widget/progressbar.lua:268
     */
    var color: externs.gears.Color;

    /**
     * The progressbar background color.
     * @see lib/wibox/widget/progressbar.lua:289
     */
    var background_color: externs.gears.Color;

    /**
     * The progressbar inner shape.
     * @see lib/wibox/widget/progressbar.lua:315
     */
    var bar_shape: externs.gears.Shape;

    /**
     * The progressbar shape.
     * @see lib/wibox/widget/progressbar.lua:338
     */
    var shape: externs.gears.Shape;

    /**
     * Force the inner part (the bar) to fit in the background shape.
     * @see lib/wibox/widget/progressbar.lua:376
     */
    var clip: Bool;

    /**
     * The progressbar to draw ticks.
     * @see lib/wibox/widget/progressbar.lua:396
     */
    var ticks: Bool;

    /**
     * The progressbar ticks gap.
     * @see lib/wibox/widget/progressbar.lua:417
     */
    var ticks_gap: Int;

    /**
     * The progressbar ticks size.
     * @see lib/wibox/widget/progressbar.lua:495
     */
    var ticks_size: Int;

    /**
     * The maximum value the progressbar should handle.
     * @see lib/wibox/widget/progressbar.lua:518
     */
    var max_value: Int;

    /**
     * The progressbar margins.
     * @see lib/wibox/widget/progressbar.lua:620
     */
    var margins: haxe.extern.EitherType<(table, Int, nil)>;

    /**
     * The progressbar padding.
     * @see lib/wibox/widget/progressbar.lua:675
     */
    var paddings: haxe.extern.EitherType<(table, Int, nil)>;

    /**
     * Set the progressbar value.
     * @see lib/wibox/widget/progressbar.lua:930
     */
    var value: Int;

    /** Create a progressbar widget.
     *
     * @see lib/wibox/widget/progressbar.lua:1002
     * @param args lua.Table<String, Dynamic>  Standard widget() arguments. You should add width and height constructor parameters to set progressbar geometry.
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;
}

