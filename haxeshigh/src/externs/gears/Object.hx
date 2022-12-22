package externs.gears;


@:luaRequire("gears.object")
extern class Object {
/** The object oriented programming base class used by various Awesome
 widgets and components.
 * lib/gears/object.lua:12
 */
/**
 * Returns a new object.
 * @see lib/gears/object.lua:322
 * @param args lua.Table<String, Dynamic>  The arguments
 */
@:selfCall function new(args: lua.Table<String, Dynamic>);
/**
 * Connect to a signal.
 * @see lib/gears/object.lua:80
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/gears/object.lua:133
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
/**
 * Disonnect from a signal.
 * @see lib/gears/object.lua:144
 * @param name String  The name of the signal.
 * @param func Function  The callback that should be disconnected.
 */
function disconnect_signal(name: String, func: Function);
/**
 * Emit a signal.
 * @see lib/gears/object.lua:157
 * @param name String  The name of the signal
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal()
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Emit a notification signal.
 * @see lib/gears/object.lua:195
 * @param name String  The signal name.
 * @param ...rest Dynamic  The signal callback arguments
 */
static function emit_signal(name: String, ...rest: Dynamic);
/**
 * Disconnect a signal from a source.
 * @see lib/gears/object.lua:206
 * @param name String  The name of the signal
 * @param func Function  The attached function
 */
static function disconnect_signal(name: String, func: Function): Bool;
/**
 * Add the missing properties handler to a CAPI object such as client/tag/screen.
 * @see lib/gears/object.lua:34
 * @param class Dynamic  A standard luaobject derived object
 * @param args lua.Table<String, Dynamic>  A set of accessors configuration parameters
 */
static function capi_index_fallback(class: Dynamic, args: lua.Table<String, Dynamic>);
/**
 * Helper function to get the module name out of `debug.getinfo`.
 * @see lib/gears/object.lua:379
 * @param level Int  Level for `debug.getinfo(level, "S")`.
   Typically 2 or 3.
 */
static function modulename(level: Int): String;
}
