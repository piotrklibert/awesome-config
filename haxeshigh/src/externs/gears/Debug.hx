package externs.gears;


@:luaRequire("gears.debug")
extern class Debug {
    /** 
     * @see lib/gears/debug.lua:7
     */

    /** Inspect the value in data.
     *
     * @see lib/gears/debug.lua:53
     * @param data Dynamic  Value to inspect.
     * @param tag Dynamic  The name of the value.
     * @param depth Int  Depth of recursion.
     */
    static function dump_return(data: Dynamic, tag: Dynamic, depth: Int): Void;

    /** Print the table (or any other value) to the console.
     *
     * @see lib/gears/debug.lua:62
     * @param data Dynamic  Table to print.
     * @param tag Dynamic  The name of the table.
     * @param depth Int  Depth of recursion.
     */
    static function dump(data: Dynamic, tag: Dynamic, depth: Int): Void;

    /** Print an warning message
     *
     * @see lib/gears/debug.lua:69
     * @param message String  The warning message to print.
     */
    static function print_warning(message: String): Void;

    /** Print an error message
     *
     * @see lib/gears/debug.lua:76
     * @param message String  The error message to print.
     */
    static function print_error(message: String): Void;

    /** Display a deprecation notice, but only once per traceback.
     *
     * @see lib/gears/debug.lua:102
     * @param see Dynamic  The message to a new method / function to use.
     * @param args lua.Table<String, Dynamic>  Extra arguments
     */
    static function deprecate(see: Dynamic, args: lua.Table<String, Dynamic>): Void;

    /** Create a class proxy with deprecation messages.
     *
     * @see lib/gears/debug.lua:149
     * @param fallback lua.Table<String, Dynamic>  The new class.
     * @param old_name String  The old class name.
     * @param new_name String  The new class name.
     * @param The args  name.
     */
    static function deprecate_class(fallback: lua.Table<String, Dynamic>, old_name: String, new_name: String, The: args): lua.Table<String, Dynamic>;
}

