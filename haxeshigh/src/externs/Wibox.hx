package externs;


@:luaRequire("wibox")
extern class Wibox {
    /**
     * @see lib/wibox/init.lua:7
     */

    /**
     * Border width.
     * @see lib/wibox/init.lua:46
     */
    var border_width: Int;

    /**
     * Border color.
     * @see lib/wibox/init.lua:69
     */
    var border_color: String;

    /**
     * On top of other windows.
     * @see lib/wibox/init.lua:76
     */
    var ontop: Bool;

    /**
     * The mouse cursor.
     * @see lib/wibox/init.lua:84
     */
    var cursor: String;

    /**
     * Visibility.
     * @see lib/wibox/init.lua:91
     */
    var visible: Bool;

    /**
     * The opacity of the wibox, between 0 and 1.
     * @see lib/wibox/init.lua:98
     */
    var opacity: Float;

    /**
     * The window type (desktop, normal, dock, ...).
     * @see lib/wibox/init.lua:106
     */
    var type: String;

    /**
     * The x coordinates.
     * @see lib/wibox/init.lua:113
     */
    var x: Int;

    /**
     * The y coordinates.
     * @see lib/wibox/init.lua:120
     */
    var y: Int;

    /**
     * The width of the wibox.
     * @see lib/wibox/init.lua:127
     */
    var width: Int;

    /**
     * The height of the wibox.
     * @see lib/wibox/init.lua:134
     */
    var height: Int;

    /**
     * The wibox screen.
     * @see lib/wibox/init.lua:141
     */
    var screen: externs.Screen;

    /**
     * The wibox's `drawable`.
     * @see lib/wibox/init.lua:148
     */
    var drawable: externs.wibox.Drawable;

    /**
     * The widget that the `wibox` displays.
     * @see lib/wibox/init.lua:154
     */
    var widget: externs.wibox.Widget;

    /**
     * The X window id.
     * @see lib/wibox/init.lua:162
     */
    var window: String;

    /**
     * The wibox's bounding shape as a (native) cairo surface.
     * @see lib/wibox/init.lua:174
     */
    var shape_bounding: Dynamic;

    /**
     * The wibox's clip shape as a (native) cairo surface.
     * @see lib/wibox/init.lua:185
     */
    var shape_clip: Dynamic;

    /**
     * The wibox's input shape as a (native) cairo surface.
     * @see lib/wibox/init.lua:197
     */
    var shape_input: Dynamic;

    /**
     * The wibar's shape.
     * @see lib/wibox/init.lua:205
     */
    var shape: externs.gears.Shape;

    /**
     * Forward the inputs to the client below the wibox.
     * @see lib/wibox/init.lua:219
     */
    var input_passthrough: Bool;

    /**
     * Get or set mouse buttons bindings to a wibox.
     * @see lib/wibox/init.lua:226
     */
    var buttons: Dynamic;

    /**
     * The background of the wibox.
     * @see lib/wibox/init.lua:293
     */
    var bg: Dynamic;

    /**
     * The background image of the drawable.
     * @see lib/wibox/init.lua:304
     */
    var bgimage: extype.extern.Mixed.Mixed3<externs.gears.Surface, String, haxe.Constraints.Function>;

    /**
     * The foreground (text) of the wibox.
     * @see lib/wibox/init.lua:314
     */
    var fg: externs.gears.Color;

    /** Get or set wibox geometry.
     *
     * @see lib/wibox/init.lua:236
     * @param A Dynamic  table with coordinates to modify.
     */
    function geometry(A: Dynamic): Void;

    /** Get or set wibox struts.
     *
     * @see lib/wibox/init.lua:252
     * @param strut Dynamic  A table with new strut, or nothing
     */
    function struts(strut: Dynamic): Void;

    /** Set a declarative widget hierarchy description.
     *
     * @see lib/wibox/init.lua:277
     * @param args Dynamic  An array containing the widgets disposition
     */
    function setup(args: Dynamic): Void;

    /** Find a widget by a point.
     *
     * @see lib/wibox/init.lua:324
     * @param x Float  X coordinate of the point
     * @param y Float  Y coordinate of the point
     */
    function find_widgets(x: Float, y: Float): lua.Table<String, Dynamic>;

    /** Create a widget that reflects the current state of this wibox.
     *
     * @see lib/wibox/init.lua:363
     */
    function to_widget(): externs.wibox.Widget;

    /** Save a screenshot of the wibox to `path`.
     *
     * @see lib/wibox/init.lua:387
     * @param path String  The path.
     * @param context lua.Table<String, Dynamic>  A widget context.
     */
    function save_to_svg(path: String, context: lua.Table<String, Dynamic>): Void;

    /** Create a wibox.
     *
     * @see lib/wibox/init.lua:595
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: externs.Overrides.WiboxArgs);

    /** Redraw a wibox.
     *
     * @see lib/wibox/init.lua:710
     * @param wibox Dynamic  <no desc>
     */
    function draw(wibox: Dynamic): Void;

    /** Connect a global signal on the wibox class.
     *
     * @see lib/wibox/init.lua:725
     * @param name String  The name of the signal
     * @param func haxe.Constraints.Function  The function to attach
     */
    static function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Emit a wibox signal.
     *
     * @see lib/wibox/init.lua:730
     * @param name String  The signal name.
     * @param ...rest Dynamic  The signal callback arguments
     */
    static function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Disconnect a signal from a source.
     *
     * @see lib/wibox/init.lua:736
     * @param name String  The name of the signal
     * @param func haxe.Constraints.Function  The attached function
     */
    static function disconnect_signal(name: String, func: haxe.Constraints.Function): Bool;
}
