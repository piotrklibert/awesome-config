package externs.gears;


@:luaRequire("gears.geometry")
extern class Geometry {
    /** Helper functions used to compute geometries.
     * @see lib/gears/geometry.lua:12
     */

    /** Get the square distance between a rectangle and a point.
     *
     * @see lib/gears/geometry.lua:26
     * @param geom lua.Table<String, Dynamic>  A rectangle
     * @param x Float  X coordinate of point
     * @param y Float  Y coordinate of point
     */
    static function get_square_distance(geom: lua.Table<String, Dynamic>, x: Float, y: Float): Float;

    /** Return the closest rectangle from `list` for a given point.
     *
     * @see lib/gears/geometry.lua:47
     * @param list lua.Table<String, Dynamic>  A list of geometry tables.
     * @param x Float  The x coordinate
     * @param y Float  The y coordinate
     */
    static function get_closest_by_coord(list: lua.Table<String, Dynamic>, x: Float, y: Float): Void;

    /** Return the rectangle containing the [x, y] point.
     *
     * @see lib/gears/geometry.lua:72
     * @param list lua.Table<String, Dynamic>  A list of geometry tables.
     * @param x Float  The x coordinate
     * @param y Float  The y coordinate
     */
    static function get_by_coord(list: lua.Table<String, Dynamic>, x: Float, y: Float): Void;

    /** Get the nearest rectangle in the given direction.
     *
     * @see lib/gears/geometry.lua:149
     * @param dir String  The direction, can be either *up*, *down*, *left* or *right*.
     * @param recttbl lua.Table<String, Dynamic>  A table of rectangle specifications.
     * @param cur lua.Table<String, Dynamic>  The current rectangle.
     */
    static function get_in_direction(dir: String, recttbl: lua.Table<String, Dynamic>, cur: lua.Table<String, Dynamic>): Void;

    /** Return true if the area are exactly identical.
     *
     * @see lib/gears/geometry.lua:178
     * @param a lua.Table<String, Dynamic>  The area.
     * @param b lua.Table<String, Dynamic>  The other area.
     */
    static function are_equal(a: lua.Table<String, Dynamic>, b: lua.Table<String, Dynamic>): Bool;

    /** Return if rectangle `a` is within rectangle `b`.
     *
     * @see lib/gears/geometry.lua:196
     * @param a lua.Table<String, Dynamic>  The smaller area.
     * @param b lua.Table<String, Dynamic>  The larger area.
     */
    static function is_inside(a: lua.Table<String, Dynamic>, b: lua.Table<String, Dynamic>): Bool;

    /** Check if an area intersect another area.
     *
     * @see lib/gears/geometry.lua:209
     * @param a lua.Table<String, Dynamic>  The area.
     * @param b lua.Table<String, Dynamic>  The other area.
     */
    static function area_intersect_area(a: lua.Table<String, Dynamic>, b: lua.Table<String, Dynamic>): Void;

    /** Get the intersect area between a and b.
     *
     * @see lib/gears/geometry.lua:230
     * @param a lua.Table<String, Dynamic>  The area.
     * @param b lua.Table<String, Dynamic>  The other area.
     */
    static function get_intersection(a: lua.Table<String, Dynamic>, b: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Remove an area from a list, splitting the space between several area that can overlap.
     *
     * @see lib/gears/geometry.lua:252
     * @param areas lua.Table<String, Dynamic>  Table of areas.
     * @param elem lua.Table<String, Dynamic>  Area to remove.
     */
    static function area_remove(areas: lua.Table<String, Dynamic>, elem: lua.Table<String, Dynamic>): Void;
}

