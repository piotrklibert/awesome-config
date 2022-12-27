package externs.wibox.widget;


@:luaRequire("wibox.widget.textbox")
extern class Textbox extends externs.wibox.widget.Base {
    /** A widget to display either plain or HTML text.
     * @see lib/wibox/widget/textbox.lua:23
     */

    /**
     * Set the HTML text of the textbox.
     * @see lib/wibox/widget/textbox.lua:230
     */
    var markup: String;

    /**
     * Set a textbox plain text.
     * @see lib/wibox/widget/textbox.lua:273
     */
    var text: String;

    /**
     * Set the text ellipsize mode.
     * @see lib/wibox/widget/textbox.lua:332
     */
    var ellipsize: String;

    /**
     * Set a textbox wrap mode.
     * @see lib/wibox/widget/textbox.lua:370
     */
    var wrap: String;

    /**
     * The vertical text alignment.
     * @see lib/wibox/widget/textbox.lua:411
     */
    var valign: String;

    /**
     * The horizontal text alignment.
     * @see lib/wibox/widget/textbox.lua:452
     */
    var align: String;

    /**
     * Set a textbox font.
     * @see lib/wibox/widget/textbox.lua:559
     */
    var font: String;

    /** Get the preferred size of a textbox.
     *
     * @see lib/wibox/widget/textbox.lua:94
     * @param s extype.extern.Mixed.Mixed2<Int, externs.Screen>  The screen on which the textbox will be displayed.
     */
    function get_preferred_size(s: extype.extern.Mixed.Mixed2<Int, externs.Screen>): Float;

    /** Get the preferred height of a textbox at a given width.
     *
     * @see lib/wibox/widget/textbox.lua:115
     * @param width Float  The available width.
     * @param s extype.extern.Mixed.Mixed2<Int, externs.Screen>  The screen on which the textbox will be displayed.
     */
    function get_height_for_width(width: Float, s: extype.extern.Mixed.Mixed2<Int, externs.Screen>): Float;

    /** Get the preferred size of a textbox.
     *
     * @see lib/wibox/widget/textbox.lua:135
     * @param dpi Float  The DPI value to render at.
     */
    function get_preferred_size_at_dpi(dpi: Float): Float;

    /** Get the preferred height of a textbox at a given width.
     *
     * @see lib/wibox/widget/textbox.lua:152
     * @param width Float  The available width.
     * @param dpi Float  The DPI value to render at.
     */
    function get_height_for_width_at_dpi(width: Float, dpi: Float): Float;

    /** Set the text of the textbox.(with [Pango markup](https://docs.gtk.org/Pango/pango_markup.html)).
     *
     * @see lib/wibox/widget/textbox.lua:171
     * @param text String  The text to set. This can contain pango markup (e.g. `<b>bold</b>`). You can use `gears.string.escape` to escape parts of it.
     */
    function set_markup_silently(text: String): Bool;

    /** Create a new textbox.
     *
     * @see lib/wibox/widget/textbox.lua:580
     * @param text String  The textbox content
     * @param ignore_markup Bool  Ignore the pango/HTML markup
     */
    @:selfCall function new(text: String, ignore_markup: Bool = false);

    /** Get geometry of text label, as if textbox would be created for it on the screen.
     *
     * @see lib/wibox/widget/textbox.lua:617
     * @param text String  The text content, pango markup supported.
     * @param s extype.extern.Mixed.Mixed2<Int, externs.Screen>  The screen on which the textbox would be displayed.
     * @param font String  The font description as string.
     */
    static function get_markup_geometry(text: String, s: extype.extern.Mixed.Mixed2<Int, externs.Screen>, font: String): lua.Table<String, Dynamic>;
}
