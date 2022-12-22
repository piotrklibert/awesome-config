package externs.awful;


@:luaRequire("awful.permissions")
extern class Permissions {
/** Implements EWMH requests handling.
 * lib/awful/permissions/init.lua:9
 */
/**
 * Add an activate (focus stealing) filter function.
 * @see lib/awful/permissions/init.lua:233
 * @param f Function  The callback
 * @param context String  The `request::activate` context
 */
static function add_activate_filter(f: Function, context: String);
/**
 * Remove an activate (focus stealing) filter function.
 * @see lib/awful/permissions/init.lua:253
 * @param f Function  The callback
 * @param context String  The `request::activate` context
 */
static function remove_activate_filter(f: Function, context: String): Bool;
}
