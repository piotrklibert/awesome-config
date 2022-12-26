package externs.wibox.widget;


@:luaRequire("wibox.widget.checkbox")
extern class Checkbox extends externs.wibox.widget.Base {
    /** A boolean display widget.
     * @see lib/wibox/widget/checkbox.lua:54
     */

    /**
     * The outer (unchecked area) border width.
     * @see lib/wibox/widget/checkbox.lua:129
     */
    var border_width: Int;

    /**
     * The outer (unchecked area) background color, pattern or gradient.
     * @see lib/wibox/widget/checkbox.lua:153
     */
    var bg: externs.gears.Color;

    /**
     * The outer (unchecked area) border color.
     * @see lib/wibox/widget/checkbox.lua:160
     */
    var border_color: externs.gears.Color;

    /**
     * The checked part border color.
     * @see lib/wibox/widget/checkbox.lua:167
     */
    var check_border_color: externs.gears.Color;

    /**
     * The checked part border width.
     * @see lib/wibox/widget/checkbox.lua:174
     */
    var check_border_width: Int;

    /**
     * The checked part filling color.
     * @see lib/wibox/widget/checkbox.lua:181
     */
    var check_color: externs.gears.Color;

    /**
     * The outer (unchecked area) shape.
     * @see lib/wibox/widget/checkbox.lua:203
     */
    var shape: externs.gears.Shape;

    /**
     * The checked part shape.
     * @see lib/wibox/widget/checkbox.lua:226
     */
    var check_shape: externs.gears.Shape;

    /**
     * The padding between the outline and the progressbar.
     * @see lib/wibox/widget/checkbox.lua:237
     */
    var paddings: haxe.extern.EitherType<lua.Table<String, Dynamic>, Int>;

    /**
     * The checkbox color.
     * @see lib/wibox/widget/checkbox.lua:247
     */
    var color: externs.gears.Color;

    /**
     * If the checkbox is checked.
     * @see lib/wibox/widget/checkbox.lua:340
     */
    var checked: Bool;

    /** Create a new checkbox.
     *
     * @see lib/wibox/widget/checkbox.lua:370
     * @param checked Bool  <no desc>
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(checked: Bool, args: lua.Table<String, Dynamic>): Void;
}

