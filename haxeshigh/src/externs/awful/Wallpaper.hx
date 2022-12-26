package externs.awful;


@:luaRequire("awful.wallpaper")
extern class Wallpaper {
    /** Allows to use the wibox widget system to draw the wallpaper.
     * @see lib/awful/wallpaper.lua:449
     */

    /**
     * The wallpaper widget.
     * @see lib/awful/wallpaper.lua:742
     */
    var widget: wibox.widget;

    /**
     * The wallpaper DPI (dots per inch).
     * @see lib/awful/wallpaper.lua:780
     */
    var dpi: Int;

    /**
     * The wallpaper screen.
     * @see lib/awful/wallpaper.lua:791
     */
    var screen: externs.Screen;

    /**
     * A list of screen for this wallpaper.
     * @see lib/awful/wallpaper.lua:844
     */
    var screens: lua.Table<String, Dynamic>;

    /**
     * The background color.
     * @see lib/awful/wallpaper.lua:855
     */
    var bg: externs.gears.Color;

    /**
     * The foreground color.
     * @see lib/awful/wallpaper.lua:865
     */
    var fg: externs.gears.Color;

    /**
     * Honor the workarea.
     * @see lib/awful/wallpaper.lua:897
     */
    var honor_workarea: Bool;

    /**
     * Honor the screen padding.
     * @see lib/awful/wallpaper.lua:956
     */
    var honor_padding: Bool;

    /**
     * Returns the list of screen(s) area which won't be covered by the wallpaper.
     * @see lib/awful/wallpaper.lua:968
     */
    var uncovered_areas: lua.Table<String, Dynamic>;

    /**
     * The color for the uncovered areas.
     * @see lib/awful/wallpaper.lua:981
     */
    var uncovered_areas_color: externs.gears.Color;

    /**
     * Defines where the wallpaper is placed when there is multiple screens.
     * @see lib/awful/wallpaper.lua:1062
     */
    var panning_area: haxe.extern.EitherType<haxe.Constraints.Function, String>;

    /** Add another screen (enable panning).
     *
     * @see lib/awful/wallpaper.lua:1190
     * @param screen externs.Screen  The screen object.
     */
    function add_screen(screen: externs.Screen): Void;

    /** Detach the wallpaper from all screens.
     *
     * @see lib/awful/wallpaper.lua:1219
     */
    function detach(): Void;

    /** Repaint the wallpaper.
     *
     * @see lib/awful/wallpaper.lua:1240
     */
    function repaint(): Void;

    /** Remove a screen.
     *
     * @see lib/awful/wallpaper.lua:1283
     * @param screen externs.Screen  The screen to remove.
     */
    function remove_screen(screen: externs.Screen): Void;

    /** Create a wallpaper.
     *
     * @see lib/awful/wallpaper.lua:1318
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;
}

