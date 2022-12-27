package externs.awful;


@:luaRequire("awful.spawn")
extern class Spawn {
    /** Spawning of programs.
     * @see lib/awful/spawn.lua:294
     */

    /** Spawn a program, and optionally apply properties and/or run a callback.
     *
     * @see lib/awful/spawn.lua:422
     * @param cmd extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>  The command.
     * @param sn_rules extype.extern.Mixed.Mixed2<lua.Table<String, Dynamic>, Bool>  A table of properties to be applied after startup; `false` to disable startup notifications.
     * @param callback haxe.Constraints.Function  A callback function to be run after startup.
     */
    static function spawn(cmd: extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>, sn_rules: extype.extern.Mixed.Mixed2<lua.Table<String, Dynamic>, Bool>, callback: haxe.Constraints.Function): Int;

    /** Spawn a program using the shell.
     *
     * @see lib/awful/spawn.lua:442
     * @param cmd String  The command.
     */
    static function with_shell(cmd: String): Void;

    /** Spawn a program and asynchronously capture its output line by line.
     *
     * @see lib/awful/spawn.lua:469
     * @param cmd extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>  The command.
     * @param callbacks lua.Table<String, Dynamic>  Table containing callbacks that should be invoked on various conditions.
     */
    static function with_line_callback(cmd: extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>, callbacks: lua.Table<String, Dynamic>): Int;

    /** Asynchronously spawn a program and capture its output.
     *
     * @see lib/awful/spawn.lua:515
     * @param cmd extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>  The command.
     * @param callback lua.Table<String, Dynamic>  Function with the following arguments
     */
    static function easy_async(cmd: extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>, callback: lua.Table<String, Dynamic>): Int;

    /** Call `spawn.easy_async` with a shell.
     *
     * @see lib/awful/spawn.lua:566
     * @param cmd String  The command.
     * @param callback lua.Table<String, Dynamic>  Function with the following arguments
     */
    static function easy_async_with_shell(cmd: String, callback: lua.Table<String, Dynamic>): Int;

    /** Read lines from a Gio input stream
     *
     * @see lib/awful/spawn.lua:578
     * @param input_stream Dynamic  The input stream to read from.
     * @param line_callback haxe.Constraints.Function  Function that is called with each line read, e.g. `line_callback(line_from_stream)`.
     * @param done_callback haxe.Constraints.Function  Function that is called when the operation finishes (e.g. due to end of file).
     * @param close Bool  Should the stream be closed after end-of-file?
     */
    static function read_lines(input_stream: Dynamic, line_callback: haxe.Constraints.Function, done_callback: haxe.Constraints.Function, close: Bool): Void;

    /** Spawn a command if it has not been spawned before.
     *
     * @see lib/awful/spawn.lua:728
     * @param cmd extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>  The command.
     * @param rules lua.Table<String, Dynamic>  The properties that need to be applied to the client.
     * @param matcher haxe.Constraints.Function  A matching function to find the instance among running clients.
     * @param unique_id String  A string to identify the client so it isn't executed multiple time.
     * @param callback haxe.Constraints.Function  A callback function when the client is created.
     */
    static function once(cmd: extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>, rules: lua.Table<String, Dynamic>, matcher: haxe.Constraints.Function, unique_id: String, callback: haxe.Constraints.Function): Void;

    /** Spawn a command if an instance is not already running.
     *
     * @see lib/awful/spawn.lua:761
     * @param cmd extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>  The command.
     * @param rules lua.Table<String, Dynamic>  The properties that need to be applied to the client.
     * @param matcher haxe.Constraints.Function  A matching function to find the instance among running clients.
     * @param unique_id String  A string to identify the client so it isn't executed multiple time.
     * @param callback haxe.Constraints.Function  A callback function when the client is created.
     */
    static function single_instance(cmd: extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>, rules: lua.Table<String, Dynamic>, matcher: haxe.Constraints.Function, unique_id: String, callback: haxe.Constraints.Function): Void;

    /** Raise a client if it exists or spawn a new one then raise it.
     *
     * @see lib/awful/spawn.lua:791
     * @param cmd extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>  The command.
     * @param rules lua.Table<String, Dynamic>  The properties that need to be applied to the client.
     * @param matcher haxe.Constraints.Function  A matching function to find the instance among running clients.
     * @param unique_id String  A string to identify the client so it isn't executed multiple time.
     * @param callback haxe.Constraints.Function  A callback function when the client is created.
     */
    static function raise_or_spawn(cmd: extype.extern.Mixed.Mixed2<String, lua.Table<String, Dynamic>>, rules: lua.Table<String, Dynamic>, matcher: haxe.Constraints.Function, unique_id: String, callback: haxe.Constraints.Function): externs.Client;
}

