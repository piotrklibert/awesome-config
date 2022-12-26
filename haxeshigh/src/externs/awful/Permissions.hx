package externs.awful;


@:luaRequire("awful.permissions")
extern class Permissions {
    /** Implements EWMH requests handling.
     * @see lib/awful/permissions/init.lua:9
     */

    /** Add an activate (focus stealing) filter function.
     *
     * @see lib/awful/permissions/init.lua:233
     * @param f haxe.Constraints.Function  The callback
     * @param context String  The `request::activate` context
     */
    static function add_activate_filter(f: haxe.Constraints.Function, context: String): Void;

    /** Remove an activate (focus stealing) filter function.
     *
     * @see lib/awful/permissions/init.lua:253
     * @param f haxe.Constraints.Function  The callback
     * @param context String  The `request::activate` context
     */
    static function remove_activate_filter(f: haxe.Constraints.Function, context: String): Bool;
}

