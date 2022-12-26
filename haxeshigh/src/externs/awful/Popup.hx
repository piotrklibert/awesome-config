package externs.awful;


@:luaRequire("awful.popup")
extern class Popup extends externs.Wibox {
    /** An auto-resized, free floating or modal wibox built around a widget.
     * @see lib/awful/popup.lua:103
     */

    /**
     * Set the preferred popup position relative to its parent.
     * @see lib/awful/popup.lua:284
     */
    var preferred_positions: haxe.extern.EitherType<lua.Table<String, Dynamic>, String>;

    /**
     * Set the preferred popup anchors relative to the parent.
     * @see lib/awful/popup.lua:338
     */
    var preferred_anchors: haxe.extern.EitherType<lua.Table<String, Dynamic>, String>;

    /**
     * The current position relative to the parent object.
     * @see lib/awful/popup.lua:354
     */
    var current_position: String;

    /**
     * Get the current anchor relative to the parent object.
     * @see lib/awful/popup.lua:368
     */
    var current_anchor: String;

    /**
     * Hide the popup when right clicked.
     * @see lib/awful/popup.lua:428
     */
    var hide_on_right_click: Bool;

    /**
     * The popup minimum width.
     * @see lib/awful/popup.lua:441
     */
    var minimum_width: Int;

    /**
     * The popup minimum height.
     * @see lib/awful/popup.lua:447
     */
    var minimum_height: Int;

    /**
     * The popup maximum width.
     * @see lib/awful/popup.lua:453
     */
    var maximum_width: Int;

    /**
     * The popup maximum height.
     * @see lib/awful/popup.lua:459
     */
    var maximum_height: Int;

    /**
     * The distance between the popup and its parent (if any).
     * @see lib/awful/popup.lua:508
     */
    var offset: haxe.extern.EitherType<lua.Table<String, Dynamic>, Int>;

    /**
     * Set the placement function.
     * @see lib/awful/popup.lua:539
     */
    var placement: Dynamic;

    /**
     * Border width.
     * @see lib/awful/popup.lua:687
     */
    var border_width: Int;

    /**
     * Border color.
     * @see lib/awful/popup.lua:710
     */
    var border_color: String;

    /**
     * On top of other windows.
     * @see lib/awful/popup.lua:717
     */
    var ontop: Bool;

    /**
     * The mouse cursor.
     * @see lib/awful/popup.lua:725
     */
    var cursor: String;

    /**
     * Visibility.
     * @see lib/awful/popup.lua:732
     */
    var visible: Bool;

    /**
     * The opacity of the wibox, between 0 and 1.
     * @see lib/awful/popup.lua:739
     */
    var opacity: Int;

    /**
     * The window type (desktop, normal, dock, ...).
     * @see lib/awful/popup.lua:747
     */
    var type: String;

    /**
     * The x coordinates.
     * @see lib/awful/popup.lua:754
     */
    var x: Int;

    /**
     * The y coordinates.
     * @see lib/awful/popup.lua:761
     */
    var y: Int;

    /**
     * The width of the wibox.
     * @see lib/awful/popup.lua:768
     */
    var width: Int;

    /**
     * The height of the wibox.
     * @see lib/awful/popup.lua:775
     */
    var height: Int;

    /**
     * The wibox screen.
     * @see lib/awful/popup.lua:782
     */
    var screen: Dynamic;

    /**
     * The wibox's `drawable`.
     * @see lib/awful/popup.lua:789
     */
    var drawable: drawable;

    /**
     * The widget that the `wibox` displays.
     * @see lib/awful/popup.lua:795
     */
    var widget: Dynamic;

    /**
     * The X window id.
     * @see lib/awful/popup.lua:803
     */
    var window: String;

    /**
     * The wibox's bounding shape as a (native) cairo surface.
     * @see lib/awful/popup.lua:815
     */
    var shape_bounding: Dynamic;

    /**
     * The wibox's clip shape as a (native) cairo surface.
     * @see lib/awful/popup.lua:826
     */
    var shape_clip: Dynamic;

    /**
     * The wibox's input shape as a (native) cairo surface.
     * @see lib/awful/popup.lua:838
     */
    var shape_input: Dynamic;

    /**
     * The wibar's shape.
     * @see lib/awful/popup.lua:846
     */
    var shape: externs.gears.Shape;

    /**
     * Forward the inputs to the client below the wibox.
     * @see lib/awful/popup.lua:860
     */
    var input_passthrough: Bool;

    /**
     * Get or set mouse buttons bindings to a wibox.
     * @see lib/awful/popup.lua:867
     */
    var buttons: Dynamic;

    /**
     * The background of the wibox.
     * @see lib/awful/popup.lua:934
     */
    var bg: Dynamic;

    /**
     * The background image of the drawable.
     * @see lib/awful/popup.lua:945
     */
    var bgimage: haxe.extern.EitherType<externs.gears.Surface, String, haxe.Constraints.Function>;

    /**
     * The foreground (text) of the wibox.
     * @see lib/awful/popup.lua:955
     */
    var fg: externs.gears.Color;

    /** Move the wibox to a position relative to `geo`.
     *
     * @see lib/awful/popup.lua:383
     * @param obj Dynamic  An object such as a wibox, client or a table entry returned by `wibox:find_widgets()`.
     */
    function move_next_to(obj: Dynamic): lua.Table<String, Dynamic>;

    /** Bind the popup to a widget button press.
     *
     * @see lib/awful/popup.lua:406
     * @param widget externs.wibox.Widget  The widget
     * @param button Int  The button index
     */
    function bind_to_widget(widget: externs.wibox.Widget, button: Int): Void;

    /** Unbind the popup from a widget button.
     *
     * @see lib/awful/popup.lua:418
     * @param widget externs.wibox.Widget  The widget
     */
    function unbind_to_widget(widget: externs.wibox.Widget): Void;

    /** Create a new popup build around a passed in widget.
     *
     * @see lib/awful/popup.lua:613
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;

    /** Get or set wibox geometry.
     *
     * @see lib/awful/popup.lua:877
     * @param A Dynamic  table with coordinates to modify.
     */
    function geometry(A: Dynamic): Void;

    /** Get or set wibox struts.
     *
     * @see lib/awful/popup.lua:893
     * @param strut Dynamic  A table with new strut, or nothing
     */
    function struts(strut: Dynamic): Void;

    /** Set a declarative widget hierarchy description.
     *
     * @see lib/awful/popup.lua:918
     * @param args Dynamic  An array containing the widgets disposition
     */
    function setup(args: Dynamic): Void;

    /** Find a widget by a point.
     *
     * @see lib/awful/popup.lua:965
     * @param x Int  X coordinate of the point
     * @param y Int  Y coordinate of the point
     */
    function find_widgets(x: Int, y: Int): lua.Table<String, Dynamic>;
}

