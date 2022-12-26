package externs.gears;


@:luaRequire("gears.table")
extern class Table {
    /** Table module for gears.
     * @see lib/gears/table.lua:33
     */

    /** Join all tables given as arguments.
     *
     * @see lib/gears/table.lua:43
     * @param ...rest lua.Table<String, Dynamic>  Tables to join.
     */
    static function join(...rest: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Override elements in the target table with values from the source table.
     *
     * @see lib/gears/table.lua:73
     * @param target lua.Table<String, Dynamic>  The target table. Values from `source` will be copied into this table.
     * @param source lua.Table<String, Dynamic>  The source table. Its values will be copied into `target`.
     * @param raw Bool  If `true`, values will be assigned with `rawset`. This will bypass metamethods on `target`.
     */
    static function crush(target: lua.Table<String, Dynamic>, source: lua.Table<String, Dynamic>, raw: Bool): lua.Table<String, Dynamic>;

    /** Pack all elements with an integer key into a new table.
     *
     * @see lib/gears/table.lua:97
     * @param t lua.Table<String, Dynamic>  A potentially sparse table.
     */
    static function from_sparse(t: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Check if a table has an item and return its key.
     *
     * @see lib/gears/table.lua:122
     * @param t lua.Table<String, Dynamic>  The table.
     * @param item Dynamic  The item to look for in values of the table.
     */
    static function hasitem(t: lua.Table<String, Dynamic>, item: Dynamic): haxe.extern.EitherType<String, Int>;

    /** Get all matching table keys for a `matcher` function.
     *
     * @see lib/gears/table.lua:141
     * @param t lua.Table<String, Dynamic>  The table.
     * @param matcher haxe.Constraints.Function  A function taking the key and value as arguments and returning a boolean.
     * @param ordered Bool  If true, only look for continuous numeric keys.
     * @param max Int  The maximum number of entries to find.
     */
    static function find_keys(t: lua.Table<String, Dynamic>, matcher: haxe.Constraints.Function, ordered: Bool, max: Int): Null<lua.Table<String, Dynamic>>;

    /** Find the first key that matches a function.
     *
     * @see lib/gears/table.lua:167
     * @param t lua.Table<String, Dynamic>  The table.
     * @param matcher haxe.Constraints.Function  A function taking the key and value as arguments and returning a boolean.
     * @param ordered Bool  If true, only look for continuous numeric keys.
     */
    static function find_first_key(t: lua.Table<String, Dynamic>, matcher: haxe.Constraints.Function, ordered: Bool): Void;

    /** Get a sorted table with all keys from a table.
     *
     * @see lib/gears/table.lua:179
     * @param t lua.Table<String, Dynamic>  The table for which the keys to get.
     */
    static function keys(t: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Get the number of keys in a table, both integer and string indicies.
     *
     * @see lib/gears/table.lua:210
     * @param t lua.Table<String, Dynamic>  The table for which to count the keys.
     */
    static function count_keys(t: lua.Table<String, Dynamic>): Int;

    /** Filter a table's keys for certain content type.
     *
     * @see lib/gears/table.lua:224
     * @param t lua.Table<String, Dynamic>  The table to retrieve the keys for.
     * @param ...rest String  The types to look for.
     */
    static function keys_filter(t: lua.Table<String, Dynamic>, ...rest: String): lua.Table<String, Dynamic>;

    /** Reverse a table.
     *
     * @see lib/gears/table.lua:243
     * @param t lua.Table<String, Dynamic>  The table to reverse.
     */
    static function reverse(t: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Clone a table.
     *
     * @see lib/gears/table.lua:265
     * @param t lua.Table<String, Dynamic>  The table to clone.
     * @param deep Bool  If `true`, recurse into nested tables to create a deep clone.
     */
    static function clone(t: lua.Table<String, Dynamic>, deep: Bool): lua.Table<String, Dynamic>;

    /** Get the next (or previous) value from a table and cycle if necessary.
     *
     * @see lib/gears/table.lua:295
     * @param t lua.Table<String, Dynamic>  The input table.
     * @param value Dynamic  The start value. Must be an element of the input table `t`.
     * @param step_size Int  The amount to increment the index by. When this is negative, the function will cycle through the table backwards.
     * @param filter haxe.Constraints.Function  An optional filter function. It receives a value from the table as parameter and should return a boolean. If it returns `false`, the value is skipped and `cycle_value` tries the next one.
     * @param start_at Int  Where to start the lookup from.
     */
    static function cycle_value(t: lua.Table<String, Dynamic>, value: Dynamic, step_size: Int, filter: haxe.Constraints.Function, start_at: Int): Void;

    /** Iterate over a table.
     *
     * @see lib/gears/table.lua:328
     * @param t lua.Table<String, Dynamic>  The table to iterate.
     * @param filter func  A function that returns true to indicate a positive match.
     * @param start Int  Index to start iterating from. Default is 1 (=> start of the table).
     */
    static function iterate(t: lua.Table<String, Dynamic>, filter: func, start: Int): func;

    /** Merge items from the source table into the target table.
     *
     * @see lib/gears/table.lua:355
     * @param target lua.Table<String, Dynamic>  The target table. Values from `source` will be copied into this table.
     * @param source lua.Table<String, Dynamic>  The source table. Its values will be copied into `target`.
     */
    static function merge(target: lua.Table<String, Dynamic>, source: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Update the `target` table with entries from the `new` table.
     *
     * @see lib/gears/table.lua:390
     * @param target lua.Table<String, Dynamic>  The table to modify.
     * @param _new lua.Table<String, Dynamic>  The table which contains the new content.
     * @param identifier haxe.Constraints.Function  A function which take the table entry (either from the `target` or `new` table) and return an unique identifier. The identifier type isn't important as long as `==` works to compare them.
     * @param merger haxe.Constraints.Function  A function takes the entry to modify as first parameter and the new entry as second. The function must return the merged value. If none is provided, there is no attempt to merge the content.
     */
    static function diff_merge(target: lua.Table<String, Dynamic>, _new: lua.Table<String, Dynamic>, identifier: haxe.Constraints.Function, merger: haxe.Constraints.Function): lua.Table<String, Dynamic>;

    /** Map a function to a table.
     *
     * @see lib/gears/table.lua:453
     * @param f haxe.Constraints.Function  The function to be applied to each value in the table.
     * @param tbl lua.Table<String, Dynamic>  The container table whose values will be operated on.
     */
    static function map(f: haxe.Constraints.Function, tbl: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;
}

