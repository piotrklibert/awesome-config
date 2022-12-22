package externs.wibox.layout;


@:luaRequire("wibox.layout.flex")
extern class Flex extends externs.wibox.layout.Fixed {
/** A `flex` layout may be initialized with any number of child widgets, and
 during runtime widgets may be added and removed dynamically.
 * lib/wibox/layout/flex.lua:35
 */
/**
 * From `wibox.layout.fixed`.
 * @see lib/wibox/layout/flex.lua:52
 */
var fill_space: Bool;
/**
 * A widget to insert as a separator between child widgets.
 * @see lib/wibox/layout/flex.lua:147
 */
var spacing_widget: externs.wibox.Widget;
/**
 * The amount of space inserted between the child widgets.
 * @see lib/wibox/layout/flex.lua:171
 */
var spacing: Int;
/**
 * Set the maximum size the widgets in this layout will take.
 * @see lib/wibox/layout/flex.lua:268
 */
var max_widget_size: Int;
/**
 * Creates and returns a new horizontal flex layout.
 * @see lib/wibox/layout/flex.lua:290
 * @param ...rest externs.wibox.Widget  Widgets that should be added to the layout.
 */
static function horizontal(...rest: externs.wibox.Widget);
/**
 * Creates and returns a new vertical flex layout.
 * @see lib/wibox/layout/flex.lua:298
 * @param ...rest externs.wibox.Widget  Widgets that should be added to the layout.
 */
static function vertical(...rest: externs.wibox.Widget);
/**
 * Add some widgets to the given fixed layout.
 * @see lib/wibox/layout/flex.lua:60
 * @param ...rest externs.wibox.Widget  Widgets that should be added (must at least be one).
 */
function add(...rest: externs.wibox.Widget);
/**
 * Remove a widget from the layout.
 * @see lib/wibox/layout/flex.lua:67
 * @param The index  widget index to remove.
 */
function remove(The: index): Bool;
/**
 * Remove one or more widgets from the layout.
 * @see lib/wibox/layout/flex.lua:77
 * @param ...rest externs.wibox.Widget  Widgets that should be removed (must at least be one).
 */
function remove_widgets(...rest: externs.wibox.Widget): Bool;
/**
 * Insert a new widget in the layout at position `index`.
 * @see lib/wibox/layout/flex.lua:89
 * @param index Int  The position
 * @param widget externs.wibox.Widget  The widget
 */
function insert(index: Int, widget: externs.wibox.Widget): Bool;
/**
 * Set a widget at a specific index, replacing the current one.
 * @see lib/wibox/layout/flex.lua:316
 * @param index Int  A widget or a widget index
 * @param widget2 externs.wibox.Widget  The widget to replace the previous one with
 */
function set(index: Int, widget2: externs.wibox.Widget): Bool;
/**
 * Replace the first instance of `widget` in the layout with `widget2`.
 * @see lib/wibox/layout/flex.lua:332
 * @param widget externs.wibox.Widget  The widget to replace
 * @param widget2 externs.wibox.Widget  The widget to replace `widget` with
 * @param recursive Bool  Recurse into all compatible layouts to
   find the widget.
 */
function replace_widget(widget: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;
/**
 * Swap 2 widgets in a layout.
 * @see lib/wibox/layout/flex.lua:347
 * @param index1 Int  The first widget index
 * @param index2 Int  The second widget index
 */
function swap(index1: Int, index2: Int): Bool;
/**
 * Swap 2 widgets in a layout.
 * @see lib/wibox/layout/flex.lua:370
 * @param widget1 externs.wibox.Widget  The first widget
 * @param widget2 externs.wibox.Widget  The second widget
 * @param recursive Bool  Recurse into all compatible layouts to
   find the widget.
 */
function swap_widgets(widget1: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;
/**
 * Reset the layout.
 * @see lib/wibox/layout/flex.lua:376
 */
function reset();
}
