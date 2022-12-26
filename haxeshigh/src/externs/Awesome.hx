package externs;


@:luaRequire("awesome")
extern class Awesome {
    /** AwesomeWM lifecycle API.
     * @see luaa.c:40
     */

    /** Register a new xproperty.
     *
     * @see luaa.c:42
     * @param name String  The name of the X11 property.
     * @param type String  One of "string", "number" or "boolean".
     */
    static function register_xproperty(name: String, type: String): Void;

    /** Quit awesome.
     *
     * @see luaa.c:197
     * @param code Int  The exit code to use when exiting.
     */
    static function quit(code: Int): Void;

    /** Execute another application, probably a window manager, to replace awesome.
     *
     * @see luaa.c:214
     * @param cmd Dynamic  The command line to execute.
     */
    static function exec(cmd: Dynamic): Void;

    /** Restart awesome.
     *
     * @see luaa.c:228
     */
    static function restart(): Void;

    /** Send a signal to a process.
     *
     * @see luaa.c:243
     * @param pid Int  Process identifier. 0 and negative values have special meaning. See `man 3 kill`.
     * @param sig Int  Signal number. See `awesome.unix_signal` for a list of signals.
     */
    static function kill(pid: Int, sig: Int): Bool;

    /** Synchronize with the X11 server.
     *
     * @see luaa.c:258
     */
    static function sync(): Void;

    /** Translate a GdkPixbuf to a cairo image surface..
     *
     * @see luaa.c:272
     * @param pixbuf Dynamic  The pixbuf as a light user datum.
     * @param path Dynamic  The pixbuf origin path
     */
    static function pixbuf_to_surface(pixbuf: Dynamic, path: Dynamic): Void;

    /** Load an image from a given path.
     *
     * @see luaa.c:291
     * @param name Dynamic  The file name.
     */
    static function load_image(name: Dynamic): Void;

    /** Set the preferred size for client icons.
     *
     * @see luaa.c:321
     * @param size Dynamic  The size of the icons in pixels.
     */
    static function set_preferred_icon_size(size: Dynamic): Void;

    /** Add a global signal.
     *
     * @see luaa.c:776
     * @param name Dynamic  A string with the event name.
     * @param func Dynamic  The function to call.
     */
    static function connect_signal(name: Dynamic, func: Dynamic): Void;

    /** Remove a global signal.
     *
     * @see luaa.c:791
     * @param name Dynamic  A string with the event name.
     * @param func Dynamic  The function to call.
     */
    static function disconnect_signal(name: Dynamic, func: Dynamic): Void;

    /** Emit a global signal.
     *
     * @see luaa.c:808
     * @param name Dynamic  A string with the event name.
     * @param ...rest Dynamic  The signal arguments.
     */
    static function emit_signal(name: Dynamic, ...rest: Dynamic): Void;

    /** Spawn a program.
     *
     * @see luaa.c:425
     * @param cmd lua.Table<String, Dynamic>  The environment to use for the spawned program. Without this the spawned process inherits awesome's environment.
     * @param use_sn Bool  Use startup-notification?
     * @param stdin Bool  Return a fd for stdin?
     * @param stdout Bool  Return a fd for stdout?
     * @param stderr Bool  Return a fd for stderr?
     * @param exit_callback haxe.Constraints.Function  Function to call on process exit. The function arguments will be type of exit ("exit" or "signal") and the exit code / the signal number causing process termination.
     * @param cmd lua.Table<String, Dynamic>  The environment to use for the spawned program. Without this the spawned process inherits awesome's environment.
     */
    static function spawn(cmd: lua.Table<String, Dynamic>, use_sn: Bool, stdin: Bool, stdout: Bool, stderr: Bool, exit_callback: haxe.Constraints.Function, cmd: lua.Table<String, Dynamic>): Int;

    /** Switch keyboard layout.
     *
     * @see luaa.c:34
     * @param num Int  keyboard layout number, integer from 0 to 3
     */
    static function xkb_set_layout_group(num: Int): Void;

    /** Get current layout number.
     *
     * @see luaa.c:54
     */
    static function xkb_get_layout_group(): Int;

    /** Get layout short names.
     *
     * @see luaa.c:86
     */
    static function xkb_get_group_names(): String;
}

