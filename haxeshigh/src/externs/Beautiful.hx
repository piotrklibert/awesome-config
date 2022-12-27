package externs;


@:luaRequire("beautiful")
extern class Beautiful {
    /** Theme library.
     * @see lib/beautiful/init.lua:10
     */

    /** Get GTK+3 theme variables from GtkStyleContext
     *
     * @see lib/beautiful/init.lua:90
     */
    static function get_theme_variables(): lua.Table<String, Dynamic>;

    /** Get a font description.
     *
     * @see lib/beautiful/init.lua:216
     * @param name extype.extern.Mixed.Mixed2<String, lgi.Pango.FontDescription>  The name of the font.
     */
    static function get_font(name: extype.extern.Mixed.Mixed2<String, lgi.Pango.FontDescription>): lgi.Pango.FontDescription;

    /** Get a new font with merged attributes, based on another one.
     *
     * @see lib/beautiful/init.lua:227
     * @param name extype.extern.Mixed.Mixed2<String, Pango.FontDescription>  The base font.
     * @param merge String  Attributes that should be merged, e.g. "bold".
     */
    static function get_merged_font(name: extype.extern.Mixed.Mixed2<String, Pango.FontDescription>, merge: String): lgi.Pango.FontDescription;

    /** Get the height of a font.
     *
     * @see lib/beautiful/init.lua:239
     * @param name Dynamic  Name of the font.
     */
    static function get_font_height(name: Dynamic): Void;

    /** Function that initializes the theme settings.
     *
     * @see lib/beautiful/init.lua:272
     * @param config extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>  The theme to load. It can be either the path to the theme file (which should return a table) or directly a table containing all the theme values.
     */
    static function init(config: extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>): Null<true>;

    /** Get the current theme.
     *
     * @see lib/beautiful/init.lua:323
     */
    static function get(): lua.Table<String, Dynamic>;

    /** Generate selected taglist square.
     *
     * @see lib/beautiful/init.lua:23
     * @param size Float  Size.
     * @param fg externs.gears.Color  Background color.
     */
    static function taglist_squares_sel(size: Float, fg: externs.gears.Color): Void;

    /** Generate unselected taglist square.
     *
     * @see lib/beautiful/init.lua:36
     * @param size Float  Size.
     * @param fg externs.gears.Color  Background color.
     */
    static function taglist_squares_unsel(size: Float, fg: externs.gears.Color): Void;

    /** Put Awesome WM name onto cairo surface.
     *
     * @see lib/beautiful/init.lua:90
     * @param cr Dynamic  Cairo surface.
     * @param height Float  Height.
     * @param bg externs.gears.Color  Background color.
     * @param fg externs.gears.Color  Main foreground color.
     * @param alt_fg externs.gears.Color  Accent foreground color.
     */
    static function gen_awesome_name(cr: Dynamic, height: Float, bg: externs.gears.Color, fg: externs.gears.Color, alt_fg: externs.gears.Color): Void;

    /** Put Awesome WM logo onto cairo surface.
     *
     * @see lib/beautiful/init.lua:159
     * @param cr Dynamic  Cairo surface.
     * @param width Float  Width.
     * @param height Float  Height.
     * @param bg externs.gears.Color  Background color.
     * @param fg externs.gears.Color  Foreground color.
     */
    static function gen_logo(cr: Dynamic, width: Float, height: Float, bg: externs.gears.Color, fg: externs.gears.Color): Void;

    /** Generate Awesome WM logo.
     *
     * @see lib/beautiful/init.lua:182
     * @param size Float  Size.
     * @param bg externs.gears.Color  Background color.
     * @param fg externs.gears.Color  Background color.
     */
    static function awesome_icon(size: Float, bg: externs.gears.Color, fg: externs.gears.Color): Void;

    /** Generate Awesome WM wallpaper.
     *
     * @see lib/beautiful/init.lua:196
     * @param bg externs.gears.Color  Background color.
     * @param fg externs.gears.Color  Main foreground color.
     * @param alt_fg externs.gears.Color  Accent foreground color.
     * @param s externs.Screen  Screen (to get wallpaper size).
     */
    static function wallpaper(bg: externs.gears.Color, fg: externs.gears.Color, alt_fg: externs.gears.Color, s: externs.Screen): Void;

    /** Recolor titlebar icons.
     *
     * @see lib/beautiful/init.lua:225
     * @param theme lua.Table<String, Dynamic>  Beautiful theme table.
     * @param color externs.gears.Color  Icons' color.
     * @param state String  `"normal"` or `"focus"`.
     * @param postfix String  `nil`, `"hover"` or `"press"`.
     * @param toggle_state String  `nil`, `"active"` or `"inactive"`.
     */
    static function recolor_titlebar(theme: lua.Table<String, Dynamic>, color: externs.gears.Color, state: String, postfix: String, toggle_state: String): lua.Table<String, Dynamic>;

    /** Recolor layout icons.
     *
     * @see lib/beautiful/init.lua:277
     * @param theme lua.Table<String, Dynamic>  Beautiful theme table
     * @param color externs.gears.Color  Icons' color.
     */
    static function recolor_layout(theme: lua.Table<String, Dynamic>, color: externs.gears.Color): lua.Table<String, Dynamic>;

    /** Get current base colorscheme from xrdb.
     *
     * @see lib/beautiful/init.lua:50
     */
    static function get_current_theme(): lua.Table<String, Dynamic>;

    /** Set DPI for a given screen (defaults to global).
     *
     * @see lib/beautiful/init.lua:123
     * @param dpi Float  DPI value.
     * @param s Int  Screen.
     */
    static function set_dpi(dpi: Float, s: Int): Void;

    /** Compute resulting size applying current DPI value (optionally per screen).
     *
     * @see lib/beautiful/init.lua:138
     * @param size Float  Size
     * @param s extype.extern.Mixed.Mixed2<Int, externs.Screen>  The screen.
     */
    static function apply_dpi(size: Float, s: extype.extern.Mixed.Mixed2<Int, externs.Screen>): Int;
}

