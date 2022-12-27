package externs.wibox.widget;


@:luaRequire("wibox.widget.separator")
extern class Separator extends externs.wibox.widget.Base {
    /** A flexible separator widget.
     * @see lib/wibox/widget/separator.lua:32
     */

    /**
     * The separator's orientation.
     * @see lib/wibox/widget/separator.lua:59
     */
    var orientation: String;

    /**
     * The separator's thickness.
     * @see lib/wibox/widget/separator.lua:68
     */
    var thickness: Float;

    /**
     * The separator's shape.
     * @see lib/wibox/widget/separator.lua:88
     */
    var shape: haxe.Constraints.Function;

    /**
     * The relative percentage covered by the bar.
     * @see lib/wibox/widget/separator.lua:95
     */
    var span_ratio: Dynamic;

    /**
     * The separator's color.
     * @see lib/wibox/widget/separator.lua:102
     */
    var color: externs.gears.Color;

    /**
     * The separator's border color.
     * @see lib/wibox/widget/separator.lua:123
     */
    var border_color: externs.gears.Color;

    /**
     * The separator's border width.
     * @see lib/wibox/widget/separator.lua:129
     */
    var border_width: Float;

    /** Create a new separator.
     *
     * @see lib/wibox/widget/separator.lua:238
     * @param args lua.Table<String, Dynamic>  The arguments (all properties are available).
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;
}

