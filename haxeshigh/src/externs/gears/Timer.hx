package externs.gears;

typedef TimerDef = {
    var timeout: Float;                     // Timeout in seconds (e.g. 1.5).                        -- Not applicable
    @:optional var autostart: Bool;         // Automatically start the timer.                        -- false
    @:optional var call_now: Bool;          // Call the callback at timer creation.                  -- false
    @:optional var callback: () -> Dynamic; // Callback function to connect to the "timeout" signal. -- Undefined
    @:optional var single_shot: Bool;       // Run only once then stop.                              -- false
}

@:luaRequire("gears.timer")
extern class Timer {
    /** Timer objects and functions.
     * @see lib/gears/timer.lua:52
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

    /** Start the timer.
     *
     * @see lib/gears/timer.lua:95
     */
    function start(): Void;

    /** Stop the timer.
     *
     * @see lib/gears/timer.lua:114
     */
    function stop(): Void;

    /** Restart the timer.
     *
     * @see lib/gears/timer.lua:129
     */
    function again(): Void;

    /** Create a new timer object.
     *
     * @see lib/gears/timer.lua:182
     * @param args lua.Table<String, Dynamic>  Arguments.
     */
    @:selfCall function new(args: TimerDef): Void;

    /** Create a simple timer for calling the `callback` function continuously.
     *
     * @see lib/gears/timer.lua:224
     * @param timeout Int  Timeout in seconds (e.g. 1.5).
     * @param callback haxe.Constraints.Function  Function to run.
     */
    static function start_new(timeout: Int, callback: haxe.Constraints.Function): externs.gears.Timer;

    /** Create a simple timer for calling the `callback` function continuously.
     *
     * @see lib/gears/timer.lua:250
     * @param timeout Int  Timeout in seconds (e.g. 1.5).
     * @param callback haxe.Constraints.Function  Function to start.
     */
    static function weak_start_new(timeout: Int, callback: haxe.Constraints.Function): externs.gears.Timer;

    /** Run all pending delayed calls now.
     *
     * @see lib/gears/timer.lua:267
     */
    static function run_delayed_calls_now(): Void;

    /** Call the given function at the end of the current GLib event loop iteration.
     *
     * @see lib/gears/timer.lua:278
     * @param callback haxe.Constraints.Function  The function that should be called
     * @param ...rest Dynamic  Arguments to the callback function
     */
    static function delayed_call(callback: haxe.Constraints.Function, ...rest: Dynamic): Void;

    /** Emit a signal.
     *
     * @see lib/gears/timer.lua:305
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see lib/gears/timer.lua:311
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/gears/timer.lua:324
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}
