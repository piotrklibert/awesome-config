package externs.awful.widget;


@:luaRequire("awful.widget.tasklist")
extern class Tasklist {
/** Tasklist widget module for awful.
 * lib/awful/widget/tasklist.lua:213
 */
/**
 * Get or set the children elements.
 * @see lib/awful/widget/tasklist.lua:940
 */
var children: lua.Table<String, Dynamic>;
/**
 * Get all direct and indirect children widgets.
 * @see lib/awful/widget/tasklist.lua:948
 */
var all_children: lua.Table<String, Dynamic>;
/**
 * Force a widget height.
 * @see lib/awful/widget/tasklist.lua:959
 */
var forced_height: Int;
/**
 * Force a widget width.
 * @see lib/awful/widget/tasklist.lua:964
 */
var forced_width: Int;
/**
 * The widget opacity (transparency).
 * @see lib/awful/widget/tasklist.lua:969
 */
var opacity: Int;
/**
 * The widget visibility.
 * @see lib/awful/widget/tasklist.lua:974
 */
var visible: Bool;
/**
 * The widget buttons.
 * @see lib/awful/widget/tasklist.lua:983
 */
var buttons: Dynamic;
/**
 * Create a new tasklist widget.
 * @see lib/awful/widget/tasklist.lua:705
 * @param args lua.Table<String, Dynamic> 
 * @param filter Dynamic  **DEPRECATED** use args.filter
 * @param buttons Dynamic  **DEPRECATED** use args.buttons
 * @param style Dynamic  **DEPRECATED** use args.style
 * @param update_function Dynamic  **DEPRECATED** use args.update_function
 * @param base_widget Dynamic  **DEPRECATED** use args.base_widget
 */
@:selfCall function new(args: lua.Table<String, Dynamic>, filter: Dynamic, buttons: Dynamic, style: Dynamic, update_function: Dynamic, base_widget: Dynamic);
/**
 * Set a declarative widget hierarchy description.
 * @see lib/awful/widget/tasklist.lua:954
 * @param args Dynamic  An array containing the widgets disposition
 */
function setup(args: Dynamic);
/**
 * Add a new `awful.button` to this widget.
 * @see lib/awful/widget/tasklist.lua:988
 * @param button awful.button  The button to add.
 */
function add_button(button: awful.button);
/**
 * Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
 * @see lib/awful/widget/tasklist.lua:996
 * @param signal_name String 
 * @param ...rest Dynamic  Other arguments
 */
function emit_signal_recursive(signal_name: String, ...rest: Dynamic);
/**
 * Emit a signal.
 * @see lib/awful/widget/tasklist.lua:1140
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/awful/widget/tasklist.lua:1146
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/awful/widget/tasklist.lua:1159
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
}
