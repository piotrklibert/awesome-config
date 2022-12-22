package externs.wibox;


@:luaRequire("wibox.widget")
extern class Widget {
/** 
 * lib/wibox/widget/init.lua:7
 */
/**
 * Draw a widget directly to a given cairo context.
 * @see lib/wibox/widget/init.lua:41
 * @param wdg externs.wibox.Widget  A widget to draw
 * @param cr cairo_context  The cairo context to draw the widget on
 * @param width Int  The width of the widget
 * @param height Int  The height of the widget
 * @param context lua.Table<String, Dynamic>  The context information to give to the widget.
 */
static function draw_to_cairo_context(wdg: externs.wibox.Widget, cr: cairo_context, width: Int, height: Int, context: lua.Table<String, Dynamic>);
/**
 * Create an SVG file showing this widget.
 * @see lib/wibox/widget/init.lua:55
 * @param wdg externs.wibox.Widget  A widget
 * @param path String  The output file path
 * @param width Int  The surface width
 * @param height Int  The surface height
 * @param context lua.Table<String, Dynamic>  The context information to give to the widget.
 */
static function draw_to_svg_file(wdg: externs.wibox.Widget, path: String, width: Int, height: Int, context: lua.Table<String, Dynamic>);
/**
 * Create a cairo image surface showing this widget.
 * @see lib/wibox/widget/init.lua:70
 * @param wdg externs.wibox.Widget  A widget
 * @param width Int  The surface width
 * @param height Int  The surface height
 * @param format Dynamic  The surface format
 * @param context lua.Table<String, Dynamic>  The context information to give to the widget.
 */
static function draw_to_image_surface(wdg: externs.wibox.Widget, width: Int, height: Int, format: Dynamic, context: lua.Table<String, Dynamic>);
}
