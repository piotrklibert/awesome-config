package externs.awful.widget;


@:luaRequire("awful.widget.taglist")
extern class Taglist {
/** Taglist widget module for awful.
 * lib/awful/widget/taglist.lua:115
 */
/**
 * Get or set the children elements.
 * @see lib/awful/widget/taglist.lua:699
 */
var children: lua.Table<String, Dynamic>;
/**
 * Get all direct and indirect children widgets.
 * @see lib/awful/widget/taglist.lua:707
 */
var all_children: lua.Table<String, Dynamic>;
/**
 * Force a widget height.
 * @see lib/awful/widget/taglist.lua:718
 */
var forced_height: Int;
/**
 * Force a widget width.
 * @see lib/awful/widget/taglist.lua:723
 */
var forced_width: Int;
/**
 * The widget opacity (transparency).
 * @see lib/awful/widget/taglist.lua:728
 */
var opacity: Int;
/**
 * The widget visibility.
 * @see lib/awful/widget/taglist.lua:733
 */
var visible: Bool;
/**
 * The widget buttons.
 * @see lib/awful/widget/taglist.lua:742
 */
var buttons: Dynamic;
/**
 * Create a new taglist widget.
 * @see lib/awful/widget/taglist.lua:540
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
 * @see lib/awful/widget/taglist.lua:713
 * @param args Dynamic  An array containing the widgets disposition
 */
function setup(args: Dynamic);
/**
 * Add a new `awful.button` to this widget.
 * @see lib/awful/widget/taglist.lua:747
 * @param button awful.button  The button to add.
 */
function add_button(button: awful.button);
/**
 * Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
 * @see lib/awful/widget/taglist.lua:755
 * @param signal_name String 
 * @param ...rest Dynamic  Other arguments
 */
function emit_signal_recursive(signal_name: String, ...rest: Dynamic);
/**
 * Emit a signal.
 * @see lib/awful/widget/taglist.lua:899
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/awful/widget/taglist.lua:905
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/awful/widget/taglist.lua:918
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
}
