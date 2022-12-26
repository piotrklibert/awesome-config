package externs.gears;


@:luaRequire("gears.surface")
extern class Surface {
    /** 
     * @see lib/gears/surface.lua:7
     */

    /** Try to convert the argument into an lgi cairo surface.
     *
     * @see lib/gears/surface.lua:40
     * @param _surface Dynamic  The surface to load or nil
     * @param _default Dynamic  The default value to return on error; when nil, then a surface in an error state is returned.
     */
    static function load_uncached_silently(_surface: Dynamic, _default: Dynamic): Void;

    /** Try to convert the argument into an lgi cairo surface.
     *
     * @see lib/gears/surface.lua:77
     * @param _surface Dynamic  The surface to load or nil
     * @param _default Dynamic  The default value to return on error; when nil, then a surface in an error state is returned.
     */
    static function load_silently(_surface: Dynamic, _default: Dynamic): Void;

    /** Try to convert the argument into an lgi cairo surface.
     *
     * @see lib/gears/surface.lua:112
     * @param _surface Dynamic  The surface to load or nil
     */
    static function load_uncached(_surface: Dynamic): Void;

    /** Try to convert the argument into an lgi cairo surface.
     *
     * @see lib/gears/surface.lua:122
     * @param _surface Dynamic  The surface to load or nil
     */
    static function surface(_surface: Dynamic): Void;

    /** Get the size of a cairo surface
     *
     * @see lib/gears/surface.lua:134
     * @param surf Dynamic  The surface you are interested in
     */
    static function get_size(surf: Dynamic): Void;

    /** Create a copy of a cairo surface.
     *
     * @see lib/gears/surface.lua:151
     * @param s Dynamic  Source surface.
     */
    static function duplicate_surface(s: Dynamic): Void;

    /** Create a surface from a `gears.shape` Any additional parameters will be passed to the shape function
     *
     * @see lib/gears/surface.lua:176
     * @param width Int  The surface width
     * @param height Int  The surface height
     * @param shape Dynamic  A `gears.shape` compatible function
     * @param shape_color Dynamic  The shape color or pattern
     * @param bg_color Dynamic  The surface background color
     */
    static function load_from_shape(width: Int, height: Int, shape: Dynamic, shape_color: Dynamic, bg_color: Dynamic): Dynamic;

    /** Apply a shape to a client or a wibox.
     *
     * @see lib/gears/surface.lua:203
     * @param draw Dynamic  A wibox or a client
     * @param shape Dynamic  or gears.shape function or a custom function with a context, width and height as parameter.
     * @param Any Dynamic  additional parameters will be passed to the shape function.
     */
    static function apply_shape_bounding(draw: Dynamic, shape: Dynamic, Any: Dynamic): Void;
}

