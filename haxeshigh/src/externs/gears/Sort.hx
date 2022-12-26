package externs.gears;


@:luaRequire("gears.sort")
extern class Sort {
    /** Extra sorting algorithms.
     * @see lib/gears/sort/init.lua:7
     */

    /** Ensure that `node` appears after all `dependencies`.
     *
     * @see lib/gears/sort/init.lua:22
     * @param node Dynamic  The node that edges are added to.
     * @param dependencies lua.Table<String, Dynamic>  List of nodes that have to appear before `node`.
     */
    function append(node: Dynamic, dependencies: lua.Table<String, Dynamic>): Void;

    /** Ensure that `node` appears before all `subordinates`.
     *
     * @see lib/gears/sort/init.lua:34
     * @param node Dynamic  The node that edges are added to.
     * @param subordinates lua.Table<String, Dynamic>  List of nodes that have to appear after `node`.
     */
    function prepend(node: Dynamic, subordinates: lua.Table<String, Dynamic>): Void;

    /** Create a copy of this topological sort.
     *
     * @see lib/gears/sort/init.lua:69
     */
    function clone(): Void;

    /** Remove a node from the topological map.
     *
     * @see lib/gears/sort/init.lua:82
     * @param node Dynamic  The node
     */
    function remove(node: Dynamic): Void;

    /** Try to sort the nodes.
     *
     * @see lib/gears/sort/init.lua:94
     */
    function sort(): lua.Table<String, Dynamic>;

    /** A topological sorting class.
     *
     * @see lib/gears/sort/init.lua:137
     */
    @:selfCall function new(): Void;
}

