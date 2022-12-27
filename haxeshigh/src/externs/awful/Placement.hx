package externs.awful;


@:luaRequire("awful.placement")
extern class Placement {
    /** Algorithms used to place various drawables.
     * @see lib/awful/placement.lua:98
     */

    /** Move a drawable to the closest corner of the parent geometry (such as the screen).
     *
     * @see lib/awful/placement.lua:883
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  The arguments
     */
    static function closest_corner(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Place the client so no part of it will be outside the screen (workarea).
     *
     * @see lib/awful/placement.lua:936
     * @param c externs.Client  The client.
     * @param args lua.Table<String, Dynamic>  The arguments
     */
    static function no_offscreen(c: externs.Client, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Place the client where there's place available with minimum overlap.
     *
     * @see lib/awful/placement.lua:1018
     * @param c Dynamic  The client.
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function no_overlap(c: Dynamic, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Place the client under the mouse.
     *
     * @see lib/awful/placement.lua:1111
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function under_mouse(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Place the client next to the mouse.
     *
     * @see lib/awful/placement.lua:1141
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function next_to_mouse(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Resize the drawable to the cursor.
     *
     * @see lib/awful/placement.lua:1194
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function resize_to_mouse(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Move the drawable (client or wibox) `d` to a screen position or side.
     *
     * @see lib/awful/placement.lua:1275
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function align(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the top left of the parent area.
     *
     * @see lib/awful/placement.lua:1329
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function top_left(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the top right of the parent area.
     *
     * @see lib/awful/placement.lua:1341
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function top_right(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the bottom left of the parent area.
     *
     * @see lib/awful/placement.lua:1353
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function bottom_left(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the bottom right of the parent area.
     *
     * @see lib/awful/placement.lua:1365
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function bottom_right(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the left of the parent area.
     *
     * @see lib/awful/placement.lua:1377
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function left(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the right of the parent area.
     *
     * @see lib/awful/placement.lua:1389
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function right(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the top of the parent area.
     *
     * @see lib/awful/placement.lua:1402
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function top(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the bottom of the parent area.
     *
     * @see lib/awful/placement.lua:1414
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function bottom(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the center of the parent area.
     *
     * @see lib/awful/placement.lua:1426
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function centered(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Align a client to the vertical center of the parent area.
     *
     * @see lib/awful/placement.lua:1437
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function center_vertical(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): Void;

    /** Align a client to the horizontal center left of the parent area.
     *
     * @see lib/awful/placement.lua:1449
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function center_horizontal(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Stretch a drawable in a specific direction.
     *
     * @see lib/awful/placement.lua:1463
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  The arguments
     */
    static function stretch(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Stretch the drawable to the left of the parent area.
     *
     * @see lib/awful/placement.lua:1529
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function stretch_left(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Stretch the drawable to the right of the parent area.
     *
     * @see lib/awful/placement.lua:1541
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function stretch_right(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Stretch the drawable to the top of the parent area.
     *
     * @see lib/awful/placement.lua:1553
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function stretch_up(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Stretch the drawable to the bottom of the parent area.
     *
     * @see lib/awful/placement.lua:1565
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function stretch_down(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Maximize a drawable horizontally, vertically or both.
     *
     * @see lib/awful/placement.lua:1579
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  The arguments
     */
    static function maximize(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Vetically maximize the drawable in the parent area.
     *
     * @see lib/awful/placement.lua:1626
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function maximize_vertically(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): Void;

    /** Horizontally maximize the drawable in the parent area.
     *
     * @see lib/awful/placement.lua:1637
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments&#34)
     */
    static function maximize_horizontally(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): Void;

    /** Scale the drawable by either a relative or absolute percent.
     *
     * @see lib/awful/placement.lua:1651
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  The arguments
     */
    static function scale(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Move a drawable to a relative position next to another one.
     *
     * @see lib/awful/placement.lua:1750
     * @param d externs.wibox.Drawable  A wibox or client
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    static function next_to(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Restore the geometry.
     *
     * @see lib/awful/placement.lua:1878
     * @param d externs.wibox.Drawable  A drawable (like `client` or `wibox`)
     * @param args lua.Table<String, Dynamic>  The arguments
     */
    static function restore(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): Bool;

    /** Skip all preceding results of placement pipeline for fullscreen clients.
     *
     * @see lib/awful/placement.lua:1937
     * @param d externs.wibox.Drawable  A drawable (like `client`, `mouse` or `wibox`)
     * @param args lua.Table<String, Dynamic>  Other arguments
     */
    static function skip_fullscreen(d: externs.wibox.Drawable, args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;
}

