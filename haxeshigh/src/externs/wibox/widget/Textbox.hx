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
     * @param s haxe.extern.EitherType<Int, externs.Screen>  The screen on which the textbox will be displayed.
     */
    function get_preferred_size(s: haxe.extern.EitherType<Int, externs.Screen>): Int;

    /** Get the preferred height of a textbox at a given width.
     *
     * @see lib/wibox/widget/textbox.lua:115
     * @param width Int  The available width.
     * @param s haxe.extern.EitherType<Int, externs.Screen>  The screen on which the textbox will be displayed.
     */
    function get_height_for_width(width: Int, s: haxe.extern.EitherType<Int, externs.Screen>): Int;

    /** Get the preferred size of a textbox.
     *
     * @see lib/wibox/widget/textbox.lua:135
     * @param dpi Int  The DPI value to render at.
     */
    function get_preferred_size_at_dpi(dpi: Int): Int;

    /** Get the preferred height of a textbox at a given width.
     *
     * @see lib/wibox/widget/textbox.lua:152
     * @param width Int  The available width.
     * @param dpi Int  The DPI value to render at.
     */
    function get_height_for_width_at_dpi(width: Int, dpi: Int): Int;

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
    @:selfCall function new(text: String, ignore_markup: Bool): Void;

    /** Get geometry of text label, as if textbox would be created for it on the screen.
     *
     * @see lib/wibox/widget/textbox.lua:617
     * @param text String  The text content, pango markup supported.
     * @param s haxe.extern.EitherType<Int, externs.Screen>  The screen on which the textbox would be displayed.
     * @param font String  The font description as string.
     */
    static function get_markup_geometry(text: String, s: haxe.extern.EitherType<Int, externs.Screen>, font: String): lua.Table<String, Dynamic>;
}

