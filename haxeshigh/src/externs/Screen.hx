package externs;


@:luaRequire("awful.screen")
extern class Screen {
    /** awesome screen API.
     * @see objects/screen.c:54
     */

    /**
     * The screen coordinates.
     * @see objects/screen.c:211
     */
    var geometry: lua.Table<String, Dynamic>;

    /**
     * The internal screen number.
     * @see objects/screen.c:255
     */
    var index: Int;

    /**
     * The screen workarea.
     * @see objects/screen.c:262
     */
    var workarea: externs.Overrides.Geometry;

    /**
     * The area where clients can be tiled.
     * @see objects/screen.c:203
     */
    var tiling_area: externs.Overrides.Geometry;

    /**
     * Take a screenshot of the physical screen.
     * @see objects/screen.c:219
     */
    var content: externs.gears.Surface;

    /**
     * The screen padding.
     * @see objects/screen.c:279
     */
    var padding: externs.Overrides.Padding;

    /**
     * A list of outputs for this screen with their size in mm.
     * @see objects/screen.c:332
     */
    var outputs: lua.Table<String, externs.Overrides.Output>;

    /**
     * The list of visible clients for the screen.
     * @see objects/screen.c:463
     */
    var clients: lua.Table<String, externs.Client>;

    /**
     * Get the list of clients assigned to the screen but not currently visible.
     * @see objects/screen.c:491
     */
    var hidden_clients: lua.Table<String, externs.Client>;

    /**
     * All clients assigned to the screen.
     * @see objects/screen.c:510
     */
    var all_clients: lua.Table<String, externs.Client>;

    /**
     * Tiled clients for the screen.
     * @see objects/screen.c:537
     */
    var tiled_clients: lua.Table<String, externs.Client>;

    /**
     * A list of all tags on the screen.
     * @see objects/screen.c:587
     */
    var tags: lua.Table<String, externs.Tag>;

    /**
     * A list of all selected tags on the screen.
     * @see objects/screen.c:613
     */
    var selected_tags: lua.Table<String, externs.Tag>;

    /**
     * The first selected tag.
     * @see objects/screen.c:633
     */
    var selected_tag: externs.Tag;

    /**
     * The number of pixels per inch of the screen.
     * @see objects/screen.c:787
     */
    var dpi: Float;

    /**
     * The lowest density DPI from all of the (physical) outputs.
     * @see objects/screen.c:792
     */
    var minimum_dpi: Float;

    /**
     * The highest density DPI from all of the (physical) outputs.
     * @see objects/screen.c:797
     */
    var maximum_dpi: Float;

    /**
     * The preferred DPI from all of the (physical) outputs.
     * @see objects/screen.c:806
     */
    var preferred_dpi: Float;

    /**
     * The maximum diagonal size in millimeters.
     * @see objects/screen.c:811
     */
    var mm_maximum_size: Float;

    /**
     * The minimum diagonal size in millimeters.
     * @see objects/screen.c:816
     */
    var mm_minimum_size: Float;

    /**
     * The maximum diagonal size in inches.
     * @see objects/screen.c:821
     */
    var inch_maximum_size: Float;

    /**
     * The minimum diagonal size in inches.
     * @see objects/screen.c:826
     */
    var inch_minimum_size: Float;

    /** Get the number of instances.
     *
     * @see objects/screen.c:267
     */
    static function instances(): Void;

    /** Iterate over screens.
     *
     * @see objects/screen.c:1554
     */
    static function screen(): Void;

    /** Get the number of screens.
     *
     * @see objects/screen.c:1641
     */
    static function count(): Void;

    /** Add a fake screen.
     *
     * @see objects/screen.c:1667
     * @param x Int  X-coordinate for screen.
     * @param y Int  Y-coordinate for screen.
     * @param width Int  width for screen.
     * @param height Int  height for screen.
     */
    @:selfCall function new(x: Int, y: Int, width: Int, height: Int);

    /** Remove a screen.
     *
     * @see objects/screen.c:1719
     */
    function fake_remove(): Void;

    /** Resize a screen.
     *
     * @see objects/screen.c:1762
     * @param x Int  The new X-coordinate for screen.
     * @param y Int  The new Y-coordinate for screen.
     * @param width Int  The new width for screen.
     * @param height Int  The new height for screen.
     */
    function fake_resize(x: Int, y: Int, width: Int, height: Int): Void;

    /** Swap a screen with another one in global screen list.
     *
     * @see objects/screen.c:1802
     * @param s externs.Client  A screen to swap with.
     */
    function swap(s: externs.Client): Void;

    /** Disconnect from a signal.
     *
     * @see objects/screen.c:1915
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback that should be disconnected.
     */
    static function disconnect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Emit a signal.
     *
     * @see objects/screen.c:1921
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    static function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see objects/screen.c:1923
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    static function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Get the square distance between a `screen` and a point.
     *
     * @see objects/screen.c:67
     * @param x Float  X coordinate of point
     * @param y Float  Y coordinate of point
     */
    function get_square_distance(x: Float, y: Float): Float;

    /** Return the screen index corresponding to the given (pixel) coordinates.
     *
     * @see objects/screen.c:79
     * @param x Float  The x coordinate
     * @param y Float  The y coordinate
     */
    static function getbycoord(x: Float, y: Float): Float;

    /** Move the focus to a screen.
     *
     * @see objects/screen.c:96
     * @param _screen externs.Screen  Screen number (defaults / falls back to mouse.screen).
     */
    static function focus(_screen: externs.Screen): Void;

    /** Get the next screen in a specific direction.
     *
     * @see objects/screen.c:139
     * @param self Dynamic  Screen.
     * @param dir Dynamic  The direction, can be either "up", "down", "left" or "right".
     */
    function get_next_in_direction(self: Dynamic, dir: Dynamic): Void;

    /** Move the focus to a screen in a specific direction.
     *
     * @see objects/screen.c:160
     * @param dir Dynamic  The direction, can be either "up", "down", "left" or "right".
     * @param _screen Dynamic  Screen.
     */
    static function focus_bydirection(dir: Dynamic, _screen: Dynamic): Void;

    /** Move the focus to a screen relative to the current one,
     *
     * @see objects/screen.c:177
     * @param offset Int  Value to add to the current focused screen index. 1 to focus the next one, -1 to focus the previous one.
     */
    static function focus_relative(offset: Int): Void;

    /** Get the preferred screen in the context of a client.
     *
     * @see objects/screen.c:368
     * @param c externs.Client  A client.
     */
    static function preferred(c: externs.Client): externs.Screen;

    /** Get the focused screen.
     *
     * @see objects/screen.c:387
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    static function focused(args: Null<externs.Overrides.FocusedOptions> = null): externs.Screen;

    /** Get a placement bounding geometry.
     *
     * @see objects/screen.c:417
     * @param args lua.Table<String, Dynamic>  The arguments
     */
    static function get_bounding_geometry(args: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Get the list of visible clients for the screen.
     *
     * @see objects/screen.c:470
     * @param stacked Bool  Use stacking order? (top to bottom)
     */
    function get_clients(stacked: Bool): lua.Table<String, Dynamic>;

    /** Get all clients assigned to the screen.
     *
     * @see objects/screen.c:517
     * @param stacked Bool  Use stacking order? (top to bottom)
     */
    function get_all_clients(stacked: Bool): lua.Table<String, Dynamic>;

    /** Get tiled clients for the screen.
     *
     * @see objects/screen.c:544
     * @param stacked Bool  Use stacking order? (top to bottom)
     */
    function get_tiled_clients(stacked: Bool): lua.Table<String, Dynamic>;

    /** Call a function for each existing and created-in-the-future screen.
     *
     * @see objects/screen.c:563
     * @param func haxe.Constraints.Function  The function to call.
     */
    static function connect_for_each_screen(func: haxe.Constraints.Function): Void;

    /** Undo the effect of connect_for_each_screen.
     *
     * @see objects/screen.c:573
     * @param func haxe.Constraints.Function  The function that should no longer be called.
     */
    static function disconnect_for_each_screen(func: haxe.Constraints.Function): Void;

    /** Split the screen into multiple screens.
     *
     * @see objects/screen.c:688
     * @param ratios lua.Table<String, Dynamic>  The different ratios to split into. If none is provided, it is split in half.
     * @param mode String  Either "vertical" or "horizontal". If none is specified, it will split along the longest axis.
     */
    function split(ratios: lua.Table<String, Dynamic>, mode: String): Void;

    /** Enable the automatic calculation of the screen DPI (experimental).
     *
     * @see objects/screen.c:769
     * @param enabled Bool  Enable or disable automatic DPI support.
     */
    static function set_auto_dpi_enabled(enabled: Bool): Void;

    /** Connect to a signal weakly.
     *
     * @see objects/screen.c:1112
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}
