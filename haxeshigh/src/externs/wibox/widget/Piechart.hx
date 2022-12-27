package externs.wibox.widget;


@:luaRequire("wibox.widget.piechart")
extern class Piechart extends externs.wibox.widget.Base {
    /** Display percentage in a circle.
     * @see lib/wibox/widget/piechart.lua:32
     */

    /**
     * The pie chart data list.
     * @see lib/wibox/widget/piechart.lua:165
     */
    var data_list: lua.Table<String, Dynamic>;

    /**
     * The pie chart data.
     * @see lib/wibox/widget/piechart.lua:171
     */
    var data: lua.Table<String, Dynamic>;

    /**
     * The border color.
     * @see lib/wibox/widget/piechart.lua:185
     */
    var border_color: externs.gears.Color;

    /**
     * The pie elements border width.
     * @see lib/wibox/widget/piechart.lua:196
     */
    var border_width: Float;

    /**
     * The pie chart colors.
     * @see lib/wibox/widget/piechart.lua:207
     */
    var colors: lua.Table<String, Dynamic>;

    /**
     * If the pie chart has labels.
     * @see lib/wibox/widget/piechart.lua:223
     */
    var display_labels: Bool;

    /** Create a new piechart.
     *
     * @see lib/wibox/widget/piechart.lua:275
     * @param data_list lua.Table<String, Dynamic>  The data.
     */
    @:selfCall function new(data_list: lua.Table<String, Dynamic>);
}
