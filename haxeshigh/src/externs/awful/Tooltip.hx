package externs.awful;


@:luaRequire("awful.tooltip")
extern class Tooltip extends externs.Wibox {
/** Tooltip module for awesome objects.
 * lib/awful/tooltip.lua:82
 */
/**
 * The wibox containing the tooltip widgets.
 * @see lib/awful/tooltip.lua:247
 */
var wibox: Dynamic;
/**
 * Is the tooltip visible?
 * @see lib/awful/tooltip.lua:271
 */
var visible: Bool;
/**
 * The horizontal alignment.
 * @see lib/awful/tooltip.lua:320
 */
var align: String;
/**
 * The shape of the tooltip window.
 * @see lib/awful/tooltip.lua:353
 */
var shape: externs.gears.Shape;
/**
 * Set the tooltip positioning mode.
 * @see lib/awful/tooltip.lua:387
 */
var mode: String;
/**
 * The preferred positions when in `outside` mode.
 * @see lib/awful/tooltip.lua:426
 */
var preferred_positions: lua.Table<String, Dynamic>;
/**
 * The preferred alignment when using the `outside` mode.
 * @see lib/awful/tooltip.lua:480
 */
var preferred_alignments: String;
/**
 * Change displayed text.
 * @see lib/awful/tooltip.lua:501
 */
var text: String;
/**
 * Change displayed markup.
 * @see lib/awful/tooltip.lua:518
 */
var markup: String;
/**
 * Change the tooltip's update interval.
 * @see lib/awful/tooltip.lua:533
 */
var timeout: Int;
/**
 * Set all margins around the tooltip textbox.
 * @see lib/awful/tooltip.lua:551
 */
var margins: New;
/**
 * The border width.
 * @see lib/awful/tooltip.lua:568
 */
var border_width: Int;
/**
 * The border color.
 * @see lib/awful/tooltip.lua:584
 */
var border_color: Dynamic;
/**
 * Set the margins around the left and right of the tooltip textbox.
 * @see lib/awful/tooltip.lua:600
 */
var margins_leftright: New;
/**
 * Set the margins around the top and bottom of the tooltip textbox.
 * @see lib/awful/tooltip.lua:622
 */
var margins_topbottom: New;
/**
 * Set the margins between the tooltip and its parent.
 * @see lib/awful/tooltip.lua:644
 */
var gaps: New;
/**
 * Create a new tooltip and link it to a widget.
 * @see lib/awful/tooltip.lua:716
 * @param args lua.Table<String, Dynamic>  Arguments for tooltip creation.
 */
@:selfCall function new(args: lua.Table<String, Dynamic>);
/**
 * Add tooltip to an object.
 * @see lib/awful/tooltip.lua:658
 * @param self tooltip  The tooltip.
 * @param obj gears.object  An object with `mouse::enter` and
   `mouse::leave` signals.
 */
function add_to_object(self: tooltip, obj: gears.object);
/**
 * Remove tooltip from an object.
 * @see lib/awful/tooltip.lua:671
 * @param self tooltip  The tooltip.
 * @param obj gears.object  An object with `mouse::enter` and
   `mouse::leave` signals.
 */
function remove_from_object(self: tooltip, obj: gears.object);
/**
 * Emit a signal.
 * @see lib/awful/tooltip.lua:880
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/awful/tooltip.lua:886
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/awful/tooltip.lua:899
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
}
