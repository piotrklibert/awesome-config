package externs.wibox.layout;


@:luaRequire("wibox.layout.ratio")
extern class Ratio extends externs.wibox.layout.Flex {
    /** A layout filling all the available space.
     * @see lib/wibox/layout/ratio.lua:25
     */

    /**
     * The widget used to fill the spacing between the layout elements.
     * @see lib/wibox/layout/ratio.lua:93
     */
    var spacing_widget: externs.wibox.Widget;

    /**
     * Add spacing between each layout widgets.
     * @see lib/wibox/layout/ratio.lua:115
     */
    var spacing: Float;

    /**
     * Set how the space of invisible or `0x0` sized widget is redistributed.
     * @see lib/wibox/layout/ratio.lua:585
     */
    var inner_fill_strategy: String;

    /** Increase the ratio of "widget".
     *
     * @see lib/wibox/layout/ratio.lua:302
     * @param index Float  The widget index to change
     * @param increment Float  An floating point value between -1 and 1 where the end result is within 0 and 1
     */
    function inc_ratio(index: Float, increment: Float): Void;

    /** Increment the ratio of the first instance of `widget`.
     *
     * @see lib/wibox/layout/ratio.lua:321
     * @param widget externs.wibox.Widget  The widget to adjust
     * @param increment Float  An floating point value between -1 and 1 where the end result is within 0 and 1
     */
    function inc_widget_ratio(widget: externs.wibox.Widget, increment: Float): Void;

    /** Set the ratio of the widget at position `index`.
     *
     * @see lib/wibox/layout/ratio.lua:334
     * @param index Float  The index of the widget to change
     * @param percent Float  An floating point value between 0 and 1
     */
    function set_ratio(index: Float, percent: Float): Void;

    /** Get the ratio at `index`.
     *
     * @see lib/wibox/layout/ratio.lua:363
     * @param index Float  The widget index to query
     */
    function get_ratio(index: Float): Float;

    /** Set the ratio of `widget` to `percent`.
     *
     * @see lib/wibox/layout/ratio.lua:373
     * @param widget externs.wibox.Widget  The widget to adjust.
     * @param percent Float  A floating point value between 0 and 1.
     */
    function set_widget_ratio(widget: externs.wibox.Widget, percent: Float): Void;

    /** Update all widgets to match a set of a ratio.
     *
     * @see lib/wibox/layout/ratio.lua:410
     * @param index Float  The index of the widget to change
     * @param before Float  The sum of the ratio before the widget
     * @param itself Float  The ratio for "widget"
     * @param after Float  The sum of the ratio after the widget
     */
    function adjust_ratio(index: Float, before: Float, itself: Float, after: Float): Void;

    /** Update all widgets to match a set of a ratio.
     *
     * @see lib/wibox/layout/ratio.lua:472
     * @param widget externs.wibox.Widget  The widget to adjust
     * @param before Float  The sum of the ratio before the widget
     * @param itself Float  The ratio for "widget"
     * @param after Float  The sum of the ratio after the widget
     */
    function adjust_widget_ratio(widget: externs.wibox.Widget, before: Float, itself: Float, after: Float): Void;

    /** Add some widgets to the given fixed layout.
     *
     * @see lib/wibox/layout/ratio.lua:502
     * @param ...rest externs.wibox.Widget  Widgets that should be added (must at least be one)
     */
    function add(...rest: externs.wibox.Widget): Void;

    /** Remove a widget from the layout.
     *
     * @see lib/wibox/layout/ratio.lua:526
     * @param index Float  The widget index to remove
     */
    function remove(index: Float): Bool;

    /** Insert a new widget in the layout at position `index`.
     *
     * @see lib/wibox/layout/ratio.lua:551
     * @param index Float  The position.
     * @param widget externs.wibox.Widget  The widget.
     */
    function insert(index: Float, widget: externs.wibox.Widget): Void;

    /** Returns a new horizontal ratio layout.
     *
     * @see lib/wibox/layout/ratio.lua:623
     * @param ...rest externs.wibox.Widget  Widgets that should be added to the layout.
     */
    @:selfCall function new(...rest: externs.wibox.Widget): Void;

    /** Returns a new vertical ratio layout.
     *
     * @see lib/wibox/layout/ratio.lua:631
     * @param ...rest externs.wibox.Widget  Widgets that should be added to the layout.
     */
    static function vertical(...rest: externs.wibox.Widget): Void;

    /** Set a widget at a specific index, replacing the current one.
     *
     * @see lib/wibox/layout/ratio.lua:649
     * @param index Float  A widget or a widget index
     * @param widget2 externs.wibox.Widget  The widget to replace the previous one with
     */
    function set(index: Float, widget2: externs.wibox.Widget): Bool;

    /** Replace the first instance of `widget` in the layout with `widget2`.
     *
     * @see lib/wibox/layout/ratio.lua:665
     * @param widget externs.wibox.Widget  The widget to replace
     * @param widget2 externs.wibox.Widget  The widget to replace `widget` with
     * @param recursive Bool  Recurse into all compatible layouts to find the widget.
     */
    function replace_widget(widget: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/ratio.lua:680
     * @param index1 Float  The first widget index
     * @param index2 Float  The second widget index
     */
    function swap(index1: Float, index2: Float): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/ratio.lua:703
     * @param widget1 externs.wibox.Widget  The first widget
     * @param widget2 externs.wibox.Widget  The second widget
     * @param recursive Bool  Recurse into all compatible layouts to find the widget.
     */
    function swap_widgets(widget1: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;

    /** Reset the layout.
     *
     * @see lib/wibox/layout/ratio.lua:709
     */
    function reset(): Void;
}

