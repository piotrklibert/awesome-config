package externs.wibox.layout;


@:luaRequire("wibox.layout.fixed")
extern class Fixed extends externs.wibox.widget.Base {
/** A `fixed` layout may be initialized with any number of child widgets, and
 during runtime widgets may be added and removed dynamically.
 * lib/wibox/layout/fixed.lua:36
 */
/**
 * A widget to insert as a separator between child widgets.
 * @see lib/wibox/layout/fixed.lua:356
 */
var spacing_widget: externs.wibox.Widget;
/**
 * Set the layout's fill_space property.
 * @see lib/wibox/layout/fixed.lua:460
 */
var fill_space: Bool;
/**
 * The amount of space inserted between the child widgets.
 * @see lib/wibox/layout/fixed.lua:525
 */
var spacing: Int;
/**
 * Creates and returns a new horizontal fixed layout.
 * @see lib/wibox/layout/fixed.lua:489
 * @param ...rest externs.wibox.Widget  Widgets that should be added to the layout.
 */
static function horizontal(...rest: externs.wibox.Widget);
/**
 * Creates and returns a new vertical fixed layout.
 * @see lib/wibox/layout/fixed.lua:497
 * @param ...rest externs.wibox.Widget  Widgets that should be added to the layout.
 */
static function vertical(...rest: externs.wibox.Widget);
/**
 * Add some widgets to the given layout.
 * @see lib/wibox/layout/fixed.lua:148
 * @param ...rest externs.wibox.Widget  Widgets that should be added (must at least be one).
 */
function add(...rest: externs.wibox.Widget);
/**
 * Remove a widget from the layout.
 * @see lib/wibox/layout/fixed.lua:167
 * @param index Int  The widget index to remove
 */
function remove(index: Int): Bool;
/**
 * Remove one or more widgets from the layout.
 * @see lib/wibox/layout/fixed.lua:185
 * @param ...rest externs.wibox.Widget  Widgets that should be removed (must at least be one)
 */
function remove_widgets(...rest: externs.wibox.Widget): Bool;
/**
 * Replace the first instance of `widget` in the layout with `widget2`.
 * @see lib/wibox/layout/fixed.lua:225
 * @param widget externs.wibox.Widget  The widget to replace
 * @param widget2 externs.wibox.Widget  The widget to replace `widget` with
 * @param recursive Bool  Digg in all compatible layouts to find the widget.
 */
function replace_widget(widget: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;
/**
 * Insert a new widget in the layout at position `index`.
 * @see lib/wibox/layout/fixed.lua:373
 * @param index Int  The position.
 * @param widget externs.wibox.Widget  The widget.
 */
function insert(index: Int, widget: externs.wibox.Widget): Bool;
/**
 * Set a widget at a specific index, replacing the current one.
 * @see lib/wibox/layout/fixed.lua:551
 * @param index Int  A widget or a widget index
 * @param widget2 externs.wibox.Widget  The widget to replace the previous one with
 */
function set(index: Int, widget2: externs.wibox.Widget): Bool;
/**
 * Replace the first instance of `widget` in the layout with `widget2`.
 * @see lib/wibox/layout/fixed.lua:567
 * @param widget externs.wibox.Widget  The widget to replace
 * @param widget2 externs.wibox.Widget  The widget to replace `widget` with
 * @param recursive Bool  Recurse into all compatible layouts to
   find the widget.
 */
function replace_widget(widget: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;
/**
 * Swap 2 widgets in a layout.
 * @see lib/wibox/layout/fixed.lua:582
 * @param index1 Int  The first widget index
 * @param index2 Int  The second widget index
 */
function swap(index1: Int, index2: Int): Bool;
/**
 * Swap 2 widgets in a layout.
 * @see lib/wibox/layout/fixed.lua:605
 * @param widget1 externs.wibox.Widget  The first widget
 * @param widget2 externs.wibox.Widget  The second widget
 * @param recursive Bool  Recurse into all compatible layouts to
   find the widget.
 */
function swap_widgets(widget1: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;
/**
 * Reset the layout.
 * @see lib/wibox/layout/fixed.lua:611
 */
function reset();
}
