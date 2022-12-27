package externs.wibox.container;


@:luaRequire("wibox.container.place")
extern class Place extends externs.wibox.widget.Base {
    /** A container used to place smaller widgets into larger space.
     * @see lib/wibox/container/place.lua:14
     */

    /**
     * The widget to be placed.
     * @see lib/wibox/container/place.lua:84
     */
    var widget: externs.wibox.Widget;

    /**
     * The vertical alignment.
     * @see lib/wibox/container/place.lua:139
     */
    var valign: String;

    /**
     * The horizontal alignment.
     * @see lib/wibox/container/place.lua:173
     */
    var halign: String;

    /**
     * Fill the vertical space.
     * @see lib/wibox/container/place.lua:199
     */
    var fill_vertical: Bool;

    /**
     * Fill the horizontal space.
     * @see lib/wibox/container/place.lua:211
     */
    var fill_horizontal: Bool;

    /**
     * Stretch the contained widget so it takes all the vertical space.
     * @see lib/wibox/container/place.lua:245
     */
    var content_fill_vertical: Bool;

    /**
     * Stretch the contained widget so it takes all the horizontal space.
     * @see lib/wibox/container/place.lua:279
     */
    var content_fill_horizontal: Bool;

    /** Reset this layout.
     *
     * @see lib/wibox/container/place.lua:101
     */
    function reset(): Void;

    /** Returns a new place container.
     *
     * @see lib/wibox/container/place.lua:292
     * @param widget externs.wibox.Widget  The widget to display.
     * @param halign String  The horizontal alignment
     * @param valign String  The vertical alignment
     */
    @:selfCall function new(widget: externs.wibox.Widget, halign: String, valign: String);
}
