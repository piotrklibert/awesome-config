package externs.wibox.layout;


@:luaRequire("wibox.layout.align")
extern class Align extends externs.wibox.widget.Base {
    /** The `align` layout has three slots for child widgets.
     * @see lib/wibox/layout/align.lua:39
     */

    /**
     * The widget in slot one.
     * @see lib/wibox/layout/align.lua:180
     */
    var first: externs.wibox.Widget;

    /**
     * The widget in slot two.
     * @see lib/wibox/layout/align.lua:197
     */
    var second: externs.wibox.Widget;

    /**
     * The widget in slot three.
     * @see lib/wibox/layout/align.lua:214
     */
    var third: externs.wibox.Widget;

    /**
     * Set the expand mode, which determines how child widgets expand to take up unused space.
     * @see lib/wibox/layout/align.lua:288
     */
    var expand: String;

    /** Returns a new horizontal align layout.
     *
     * @see lib/wibox/layout/align.lua:336
     * @param left externs.wibox.Widget  Widget to be put in slot one.
     * @param middle externs.wibox.Widget  Widget to be put in slot two.
     * @param right externs.wibox.Widget  Widget to be put in slot three.
     */
    static function horizontal(left: externs.wibox.Widget, middle: externs.wibox.Widget, right: externs.wibox.Widget): Align;

    /** Returns a new vertical align layout.
     *
     * @see lib/wibox/layout/align.lua:356
     * @param top externs.wibox.Widget  Widget to be put in slot one.
     * @param middle externs.wibox.Widget  Widget to be put in slot two.
     * @param bottom externs.wibox.Widget  Widget to be put in slot three.
     */
    static function vertical(top: externs.wibox.Widget, middle: externs.wibox.Widget, bottom: externs.wibox.Widget): Align;

    /** Set a widget at a specific index, replacing the current one.
     *
     * @see lib/wibox/layout/align.lua:380
     * @param index Float  A widget or a widget index
     * @param widget2 externs.wibox.Widget  The widget to replace the previous one with
     */
    function set(index: Float, widget2: externs.wibox.Widget): Bool;

    /** Replace the first instance of `widget` in the layout with `widget2`.
     *
     * @see lib/wibox/layout/align.lua:396
     * @param widget externs.wibox.Widget  The widget to replace
     * @param widget2 externs.wibox.Widget  The widget to replace `widget` with
     * @param recursive Bool  Recurse into all compatible layouts to find the widget.
     */
    function replace_widget(widget: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/align.lua:411
     * @param index1 Float  The first widget index
     * @param index2 Float  The second widget index
     */
    function swap(index1: Float, index2: Float): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/align.lua:434
     * @param widget1 externs.wibox.Widget  The first widget
     * @param widget2 externs.wibox.Widget  The second widget
     * @param recursive Bool  Recurse into all compatible layouts to find the widget.
     */
    function swap_widgets(widget1: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;

    /** Reset the layout.
     *
     * @see lib/wibox/layout/align.lua:440
     */
    function reset(): Void;
}
