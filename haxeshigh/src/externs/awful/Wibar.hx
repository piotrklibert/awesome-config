package externs.awful;


@:luaRequire("awful.wibar")
extern class Wibar extends externs.awful.Popup {
    /** The main AwesomeWM "bar" module.
     * @see lib/awful/wibar.lua:68
     */

    /**
     * If the wibar needs to be stretched to fill the screen.
     * @see lib/awful/wibar.lua:146
     */
    var stretch: Bool;

    /**
     * How to align non-stretched wibars.
     * @see lib/awful/wibar.lua:201
     */
    var align: String;

    /**
     * Margins on each side of the wibar.
     * @see lib/awful/wibar.lua:245
     */
    var margins: extype.extern.Mixed.Mixed2<Float, lua.Table<String, Dynamic>>;

    /**
     * Allow or deny the tiled clients to cover the wibar.
     * @see lib/awful/wibar.lua:281
     */
    var restrict_workarea: Bool;

    /**
     * The wibox position.
     * @see lib/awful/wibar.lua:489
     */
    var position: String;

    /**
     * Border width.
     * @see lib/awful/wibar.lua:881
     */
    var border_width: Int;

    /**
     * Border color.
     * @see lib/awful/wibar.lua:904
     */
    var border_color: String;

    /**
     * On top of other windows.
     * @see lib/awful/wibar.lua:911
     */
    var ontop: Bool;

    /**
     * The mouse cursor.
     * @see lib/awful/wibar.lua:919
     */
    var cursor: String;

    /**
     * Visibility.
     * @see lib/awful/wibar.lua:926
     */
    var visible: Bool;

    /**
     * The opacity of the wibox, between 0 and 1.
     * @see lib/awful/wibar.lua:933
     */
    var opacity: Float;

    /**
     * The window type (desktop, normal, dock, ...).
     * @see lib/awful/wibar.lua:941
     */
    var type: String;

    /**
     * The x coordinates.
     * @see lib/awful/wibar.lua:948
     */
    var x: Int;

    /**
     * The y coordinates.
     * @see lib/awful/wibar.lua:955
     */
    var y: Int;

    /**
     * The width of the wibox.
     * @see lib/awful/wibar.lua:962
     */
    var width: Int;

    /**
     * The height of the wibox.
     * @see lib/awful/wibar.lua:969
     */
    var height: Int;

    /**
     * The wibox screen.
     * @see lib/awful/wibar.lua:976
     */
    var screen: externs.Screen;

    /**
     * The wibox's `drawable`.
     * @see lib/awful/wibar.lua:983
     */
    var drawable: externs.wibox.Drawable;

    /**
     * The widget that the `wibox` displays.
     * @see lib/awful/wibar.lua:989
     */
    var widget: externs.wibox.Widget;

    /**
     * The X window id.
     * @see lib/awful/wibar.lua:997
     */
    var window: String;

    /**
     * The wibox's bounding shape as a (native) cairo surface.
     * @see lib/awful/wibar.lua:1009
     */
    var shape_bounding: Dynamic;

    /**
     * The wibox's clip shape as a (native) cairo surface.
     * @see lib/awful/wibar.lua:1020
     */
    var shape_clip: Dynamic;

    /**
     * The wibox's input shape as a (native) cairo surface.
     * @see lib/awful/wibar.lua:1032
     */
    var shape_input: Dynamic;

    /**
     * The wibar's shape.
     * @see lib/awful/wibar.lua:1040
     */
    var shape: externs.gears.Shape;

    /**
     * Forward the inputs to the client below the wibox.
     * @see lib/awful/wibar.lua:1054
     */
    var input_passthrough: Bool;

    /**
     * Get or set mouse buttons bindings to a wibox.
     * @see lib/awful/wibar.lua:1061
     */
    var buttons: Dynamic;

    /**
     * The background of the wibox.
     * @see lib/awful/wibar.lua:1128
     */
    var bg: Dynamic;

    /**
     * The background image of the drawable.
     * @see lib/awful/wibar.lua:1139
     */
    var bgimage: extype.extern.Mixed.Mixed3<externs.gears.Surface, String, haxe.Constraints.Function>;

    /**
     * The foreground (text) of the wibox.
     * @see lib/awful/wibar.lua:1149
     */
    var fg: externs.gears.Color;

    /** Remove a wibar.
     *
     * @see lib/awful/wibar.lua:638
     */
    function remove(): Void;

    /** Create a new wibox and attach it to a screen edge.
     *
     * @see lib/awful/wibar.lua:753
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>);

    /** Get or set wibox geometry.
     *
     * @see lib/awful/wibar.lua:1071
     * @param A Dynamic  table with coordinates to modify.
     */
    function geometry(A: Dynamic): Void;

    /** Get or set wibox struts.
     *
     * @see lib/awful/wibar.lua:1087
     * @param strut Dynamic  A table with new strut, or nothing
     */
    function struts(strut: Dynamic): Void;

    /** Set a declarative widget hierarchy description.
     *
     * @see lib/awful/wibar.lua:1112
     * @param args Dynamic  An array containing the widgets disposition
     */
    function setup(args: Dynamic): Void;

    /** Find a widget by a point.
     *
     * @see lib/awful/wibar.lua:1159
     * @param x Float  X coordinate of the point
     * @param y Float  Y coordinate of the point
     */
    function find_widgets(x: Float, y: Float): lua.Table<String, Dynamic>;

    /** Emit a signal.
     *
     * @see lib/awful/wibar.lua:1175
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see lib/awful/wibar.lua:1181
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/awful/wibar.lua:1194
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}
