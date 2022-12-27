package externs.wibox;


@:luaRequire("wibox.drawable")
extern class Drawable {
    /** Handling of drawables.
     * @see lib/wibox/drawable.lua:9
     */

    /** Find a widget by a point.
     *
     * @see lib/wibox/drawable.lua:214
     * @param x Dynamic  X coordinate of the point
     * @param y Dynamic  Y coordinate of the point
     */
    static function find_widgets(x: Dynamic, y: Dynamic): lua.Table<String, Dynamic>;

    /** Set the widget that the drawable displays
     *
     * @see lib/wibox/drawable.lua:229
     * @param widget Dynamic  <no desc>
     */
    static function set_widget(widget: Dynamic): Void;

    /** Set the background of the drawable
     *
     * @see lib/wibox/drawable.lua:245
     * @param c Dynamic  The background to use. This must either be a cairo pattern object, nil or a string that gears.color() understands.
     */
    static function set_bg(c: Dynamic): Void;

    /** Set the background image of the drawable If `image` is a function, it will be called with `(context, cr, width, height)` as arguments.
     *
     * @see lib/wibox/drawable.lua:278
     * @param image Dynamic  A background image or a function
     */
    static function set_bgimage(image: Dynamic): Void;

    /** Set the foreground of the drawable
     *
     * @see lib/wibox/drawable.lua:293
     * @param c Dynamic  The foreground to use. This must either be a cairo pattern object, nil or a string that gears.color() understands.
     */
    static function set_fg(c: Dynamic): Void;
}

