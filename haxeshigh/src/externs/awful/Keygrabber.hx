package externs.awful;


@:luaRequire("awful.keygrabber")
extern class Keygrabber {
    /** A keyboard grabbing and transaction object.
     * @see lib/awful/keygrabber.lua:134
     */

    /**
     * The keygrabber timeout.
     * @see lib/awful/keygrabber.lua:361
     */
    var timeout: Float;

    /**
     * The key on which the keygrabber listen to terminate itself.
     * @see lib/awful/keygrabber.lua:385
     */
    var stop_key: String;

    /**
     * The event on which the keygrabbing will be terminated.
     * @see lib/awful/keygrabber.lua:396
     */
    var stop_event: String;

    /**
     * Whether or not to execute the key press/release callbacks when keybindings are called.
     * @see lib/awful/keygrabber.lua:410
     */
    var mask_event_callback: Bool;

    /**
     * Do not call the callbacks on modifier keys (like `Control` or `Mod4`) events.
     * @see lib/awful/keygrabber.lua:415
     */
    var mask_modkeys: Bool;

    /**
     * Export all keygrabber keybindings as root (global) keybindings.
     * @see lib/awful/keygrabber.lua:428
     */
    var export_keybindings: Bool;

    /**
     * The root (global) keybinding to start this keygrabber.
     * @see lib/awful/keygrabber.lua:497
     */
    var root_keybindings: lua.Table<String, Dynamic>;

    /**
     * The keybindings associated with this keygrabber.
     * @see lib/awful/keygrabber.lua:507
     */
    var keybindings: lua.Table<String, Dynamic>;

    /**
     * If any key is pressed that is not in this list, the keygrabber is stopped.
     * @see lib/awful/keygrabber.lua:528
     */
    var allowed_keys: Null<lua.Table<String, Dynamic>>;

    /**
     * The sequence of keys recorded since the start of the keygrabber.
     * @see lib/awful/keygrabber.lua:552
     */
    var sequence: String;

    /** Start the keygrabber.
     *
     * @see lib/awful/keygrabber.lua:578
     */
    function start(): Bool;

    /** Stop the keygrabber.
     *
     * @see lib/awful/keygrabber.lua:634
     */
    function stop(): Void;

    /** Add a keybinding to this keygrabber.
     *
     * @see lib/awful/keygrabber.lua:662
     * @param key externs.awful.Key  The key.
     */
    function add_keybinding(key: externs.awful.Key): Void;

    /** A wrapper around the keygrabber to make it easier to add keybindings.
     *
     * @see lib/awful/keygrabber.lua:820
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;

    /** Connect to a signal for all keygrabbers at once.
     *
     * @see lib/awful/keygrabber.lua:972
     * @param name String  The signal name.
     * @param callback haxe.Constraints.Function  The callback.
     */
    static function connect_signal(name: String, callback: haxe.Constraints.Function): Void;

    /** Disconnect to a signal for all keygrabbers at once.
     *
     * @see lib/awful/keygrabber.lua:985
     * @param name String  The signal name.
     * @param callback haxe.Constraints.Function  The callback.
     */
    static function disconnect_signal(name: String, callback: haxe.Constraints.Function): Void;

    /** Emit a signal on the keygrabber module itself.
     *
     * @see lib/awful/keygrabber.lua:1005
     * @param name String  The signal name.
     * @param ...rest Dynamic  Other arguments for the callbacks.
     */
    static function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal weakly.
     *
     * @see lib/awful/keygrabber.lua:1052
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}

