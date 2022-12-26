package externs.gears;


@:luaRequire("gears.color")
extern class Color {
    /** This module simplifies the creation of cairo pattern objects.
     * @see lib/gears/color.lua:41
     */

    /** Parse a HTML-color.
     *
     * @see lib/gears/color.lua:73
     * @param col Dynamic  The color to parse
     */
    static function parse_color(col: Dynamic): Int;

    /** Create a solid pattern
     *
     * @see lib/gears/color.lua:130
     * @param col Dynamic  The color for the pattern
     */
    static function create_solid_pattern(col: Dynamic): Void;

    /** Create an image pattern from a png file
     *
     * @see lib/gears/color.lua:144
     * @param file Dynamic  The filename of the file
     */
    static function create_png_pattern(file: Dynamic): Void;

    /** Create a linear pattern object.
     *
     * @see lib/gears/color.lua:201
     * @param arg haxe.extern.EitherType<String, lua.Table<String, Dynamic>>  The argument describing the pattern.
     */
    static function create_linear_pattern(arg: haxe.extern.EitherType<String, lua.Table<String, Dynamic>>): Void;

    /** Create a radial pattern object.
     *
     * @see lib/gears/color.lua:227
     * @param arg haxe.extern.EitherType<String, lua.Table<String, Dynamic>>  The argument describing the pattern
     */
    static function create_radial_pattern(arg: haxe.extern.EitherType<String, lua.Table<String, Dynamic>>): Void;

    /** Create a pattern from a given string.
     *
     * @see lib/gears/color.lua:260
     * @param col Dynamic  The string describing the pattern.
     */
    static function create_pattern_uncached(col: Dynamic): Void;

    /** Create a pattern from a given string, same as @{gears.color}.
     *
     * @see lib/gears/color.lua:285
     */
    static function create_pattern(): Void;

    /** Check if a pattern is opaque.
     *
     * @see lib/gears/color.lua:298
     * @param col Dynamic  An argument that `create_pattern` accepts.
     */
    static function create_opaque_pattern(col: Dynamic): Void;

    /** Fill non-transparent area of an image with a given color.
     *
     * @see lib/gears/color.lua:349
     * @param image Dynamic  Image or path to it.
     * @param new_color Dynamic  New color.
     */
    static function recolor_image(image: Dynamic, new_color: Dynamic): Void;

    /** Get a valid color for Pango markup
     *
     * @see lib/gears/color.lua:362
     * @param check_color Dynamic  The color to check.
     * @param fallback String  The color to return if the first is invalid. (default: black)
     */
    static function ensure_pango_color(check_color: Dynamic, fallback: String): String;
}

