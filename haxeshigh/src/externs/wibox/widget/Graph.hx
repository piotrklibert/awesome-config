package externs.wibox.widget;


@:luaRequire("wibox.widget.graph")
extern class Graph extends externs.wibox.widget.Base {
    /** A graph widget.
     * @see lib/wibox/widget/graph.lua:28
     */

    /**
     * Set the graph border_width.
     * @see lib/wibox/widget/graph.lua:62
     */
    var border_width: Float;

    /**
     * Set the graph border color.
     * @see lib/wibox/widget/graph.lua:83
     */
    var border_color: externs.gears.Color;

    /**
     * Set the graph foreground color.
     * @see lib/wibox/widget/graph.lua:105
     */
    var color: externs.gears.Color;

    /**
     * Set the graph background color.
     * @see lib/wibox/widget/graph.lua:125
     */
    var background_color: externs.gears.Color;

    /**
     * Set the colors for data groups.
     * @see lib/wibox/widget/graph.lua:178
     */
    var group_colors: lua.Table<String, Dynamic>;

    /**
     * The maximum value the graph should handle.
     * @see lib/wibox/widget/graph.lua:204
     */
    var max_value: Float;

    /**
     * The minimum value the graph should handle.
     * @see lib/wibox/widget/graph.lua:231
     */
    var min_value: Float;

    /**
     * Set the graph to automatically scale its values.
     * @see lib/wibox/widget/graph.lua:260
     */
    var scale: Bool;

    /**
     * Clamp graph bars to keep them inside the widget for out-of-range values.
     * @see lib/wibox/widget/graph.lua:298
     */
    var clamp_bars: Bool;

    /**
     * The value corresponding to the starting point of graph bars.
     * @see lib/wibox/widget/graph.lua:331
     */
    var baseline_value: Float;

    /**
     * Set the width or the individual steps.
     * @see lib/wibox/widget/graph.lua:353
     */
    var step_width: Float;

    /**
     * Set the spacing between the steps.
     * @see lib/wibox/widget/graph.lua:371
     */
    var step_spacing: Float;

    /**
     * The step shape.
     * @see lib/wibox/widget/graph.lua:400
     */
    var step_shape: extype.extern.Mixed.Mixed2<externs.gears.Shape, haxe.Constraints.Function>;

    /**
     * Set the graph to draw stacks.
     * @see lib/wibox/widget/graph.lua:444
     */
    var stack: Bool;

    /**
     * Display NaN indication.
     * @see lib/wibox/widget/graph.lua:490
     */
    var nan_indication: Bool;

    /**
     * The color of NaN indication.
     * @see lib/wibox/widget/graph.lua:543
     */
    var nan_color: externs.gears.Color;

    /**
     * Set the graph capacity.
     * @see lib/wibox/widget/graph.lua:1096
     */
    var capacity: Null<Int>;

    /** Determine the color to paint a data group with.
     *
     * @see lib/wibox/widget/graph.lua:689
     * @param group_idx Float  The index of the data group.
     */
    function pick_data_group_color(group_idx: Float): externs.gears.Color;

    /** Determine how many values should be drawn for a given widget width.
     *
     * @see lib/wibox/widget/graph.lua:983
     * @param usable_width Float  <no desc>
     */
    function compute_drawn_values_num(usable_width: Float): Void;

    /** Add a value to the graph.
     *
     * @see lib/wibox/widget/graph.lua:1029
     * @param value Float  The value to be added to a graph's data group.
     * @param group Int  The index of the data group.
     */
    function add_value(value: Float, group: Int): Void;

    /** Clear the graph.
     *
     * @see lib/wibox/widget/graph.lua:1073
     */
    function clear(): Void;

    /** Create a graph widget.
     *
     * @see lib/wibox/widget/graph.lua:1195
     * @param args lua.Table<String, Dynamic>  Standard widget() arguments.
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;
}

