package externs.naughty.layout;


@:luaRequire("naughty.layout.box")
extern class Box extends externs.awful.Popup {
/** A notification popup widget.
 * lib/naughty/layout/box.lua:17
 */
/**
 * The widget notification object.
 * @see lib/naughty/layout/box.lua:175
 */
var notification: naughty.notification;
/**
 * The widget template to construct the box content.
 * @see lib/naughty/layout/box.lua:221
 */
var widget_template: Dynamic;
/**
 * Border width.
 * @see lib/naughty/layout/box.lua:433
 */
var border_width: Int;
/**
 * Border color.
 * @see lib/naughty/layout/box.lua:456
 */
var border_color: String;
/**
 * On top of other windows.
 * @see lib/naughty/layout/box.lua:463
 */
var ontop: Bool;
/**
 * The mouse cursor.
 * @see lib/naughty/layout/box.lua:471
 */
var cursor: String;
/**
 * Visibility.
 * @see lib/naughty/layout/box.lua:478
 */
var visible: Bool;
/**
 * The opacity of the wibox, between 0 and 1.
 * @see lib/naughty/layout/box.lua:485
 */
var opacity: Int;
/**
 * The window type (desktop, normal, dock, ...).
 * @see lib/naughty/layout/box.lua:493
 */
var type: String;
/**
 * The x coordinates.
 * @see lib/naughty/layout/box.lua:500
 */
var x: Int;
/**
 * The y coordinates.
 * @see lib/naughty/layout/box.lua:507
 */
var y: Int;
/**
 * The width of the wibox.
 * @see lib/naughty/layout/box.lua:514
 */
var width: Int;
/**
 * The height of the wibox.
 * @see lib/naughty/layout/box.lua:521
 */
var height: Int;
/**
 * The wibox screen.
 * @see lib/naughty/layout/box.lua:528
 */
var screen: Dynamic;
/**
 * The wibox's `drawable`.
 * @see lib/naughty/layout/box.lua:535
 */
var drawable: drawable;
/**
 * The widget that the `wibox` displays.
 * @see lib/naughty/layout/box.lua:541
 */
var widget: Dynamic;
/**
 * The X window id.
 * @see lib/naughty/layout/box.lua:549
 */
var window: String;
/**
 * The wibox's bounding shape as a (native) cairo surface.
 * @see lib/naughty/layout/box.lua:561
 */
var shape_bounding: Dynamic;
/**
 * The wibox's clip shape as a (native) cairo surface.
 * @see lib/naughty/layout/box.lua:572
 */
var shape_clip: Dynamic;
/**
 * The wibox's input shape as a (native) cairo surface.
 * @see lib/naughty/layout/box.lua:584
 */
var shape_input: Dynamic;
/**
 * The wibar's shape.
 * @see lib/naughty/layout/box.lua:592
 */
var shape: externs.gears.Shape;
/**
 * Forward the inputs to the client below the wibox.
 * @see lib/naughty/layout/box.lua:606
 */
var input_passthrough: Bool;
/**
 * Get or set mouse buttons bindings to a wibox.
 * @see lib/naughty/layout/box.lua:613
 */
var buttons: Dynamic;
/**
 * The background of the wibox.
 * @see lib/naughty/layout/box.lua:680
 */
var bg: Dynamic;
/**
 * The background image of the drawable.
 * @see lib/naughty/layout/box.lua:691
 */
var bgimage: haxe.extern.EitherType<gears.suface, String, Function>;
/**
 * The foreground (text) of the wibox.
 * @see lib/naughty/layout/box.lua:701
 */
var fg: externs.gears.Color;
/**
 * Create a notification popup box.
 * @see lib/naughty/layout/box.lua:361
 * @param args lua.Table<String, Dynamic> 
 */
@:selfCall function new(args: lua.Table<String, Dynamic>);
/**
 * Get or set wibox geometry.
 * @see lib/naughty/layout/box.lua:623
 * @param A Dynamic  table with coordinates to modify.
 */
function geometry(A: Dynamic);
/**
 * Get or set wibox struts.
 * @see lib/naughty/layout/box.lua:639
 * @param strut Dynamic  A table with new strut, or nothing
 */
function struts(strut: Dynamic);
/**
 * Set a declarative widget hierarchy description.
 * @see lib/naughty/layout/box.lua:664
 * @param args Dynamic  An array containing the widgets disposition
 */
function setup(args: Dynamic);
/**
 * Find a widget by a point.
 * @see lib/naughty/layout/box.lua:711
 * @param x Int  X coordinate of the point
 * @param y Int  Y coordinate of the point
 */
function find_widgets(x: Int, y: Int): lua.Table<String, Dynamic>;
}
