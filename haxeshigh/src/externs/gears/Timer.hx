package externs.gears;


@:luaRequire("gears.timer")
extern class Timer {
/** Timer objects and functions.
 * lib/gears/timer.lua:52
 */
/**
 * The timer is started.
 * @see lib/gears/timer.lua:140
 */
var started: Bool;
/**
 * The timer timeout value.
 * @see lib/gears/timer.lua:146
 */
var timeout: Int;
/**
 * Create a new timer object.
 * @see lib/gears/timer.lua:182
 * @param args lua.Table<String, Dynamic>  Arguments.
 */
@:selfCall function new(args: lua.Table<String, Dynamic>);
/**
 * Start the timer.
 * @see lib/gears/timer.lua:95
 */
function start();
/**
 * Stop the timer.
 * @see lib/gears/timer.lua:114
 */
function stop();
/**
 * Restart the timer.
 * @see lib/gears/timer.lua:129
 */
function again();
/**
 * Emit a signal.
 * @see lib/gears/timer.lua:305
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/gears/timer.lua:311
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/gears/timer.lua:324
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
/**
 * Create a simple timer for calling the `callback` function continuously.
 * @see lib/gears/timer.lua:224
 * @param timeout Int  Timeout in seconds (e.g. 1.5).
 * @param callback Function  Function to run.
 */
static function start_new(timeout: Int, callback: Function): timer;
/**
 * Create a simple timer for calling the `callback` function continuously.
 * @see lib/gears/timer.lua:250
 * @param timeout Int  Timeout in seconds (e.g. 1.5).
 * @param callback Function  Function to start.
 */
static function weak_start_new(timeout: Int, callback: Function): timer;
/**
 * Run all pending delayed calls now.
 * @see lib/gears/timer.lua:267
 */
static function run_delayed_calls_now();
/**
 * Call the given function at the end of the current GLib event loop iteration.
 * @see lib/gears/timer.lua:278
 * @param callback Function  The function that should be called
 * @param ...rest Dynamic  Arguments to the callback function
 */
static function delayed_call(callback: Function, ...rest: Dynamic);
}
