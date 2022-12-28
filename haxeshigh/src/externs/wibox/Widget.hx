package externs.wibox;


typedef Widget = externs.wibox.widget.Base;


@:luaRequire("wibox.widget")
extern class WidgetTools {
    /**
     * @see lib/wibox/widget/init.lua:7
     */

    @:selfCall static function widget(arg: lib.LuaTable<String, Dynamic>): Widget;

    /** Draw a widget directly to a given cairo context.
     *
     * @see lib/wibox/widget/init.lua:41
     * @param wdg externs.wibox.Widget  A widget to draw
     * @param cr Dynamic  The cairo context to draw the widget on
     * @param width Float  The width of the widget
     * @param height Float  The height of the widget
     * @param context lua.Table<String, Dynamic>  The context information to give to the widget.
     */
    static function draw_to_cairo_context(wdg: externs.wibox.Widget, cr: Dynamic, width: Float, height: Float, context: lua.Table<String, Dynamic>): Void;

    /** Create an SVG file showing this widget.
     *
     * @see lib/wibox/widget/init.lua:55
     * @param wdg externs.wibox.Widget  A widget
     * @param path String  The output file path
     * @param width Float  The surface width
     * @param height Float  The surface height
     * @param context lua.Table<String, Dynamic>  The context information to give to the widget.
     */
    static function draw_to_svg_file(wdg: externs.wibox.Widget, path: String, width: Float, height: Float, context: lua.Table<String, Dynamic>): Void;

    /** Create a cairo image surface showing this widget.
     *
     * @see lib/wibox/widget/init.lua:70
     * @param wdg externs.wibox.Widget  A widget
     * @param width Float  The surface width
     * @param height Float  The surface height
     * @param format Dynamic  The surface format
     * @param context lua.Table<String, Dynamic>  The context information to give to the widget.
     */
    static function draw_to_image_surface(wdg: externs.wibox.Widget, width: Float, height: Float, format: Dynamic, context: lua.Table<String, Dynamic>): Void;
}
