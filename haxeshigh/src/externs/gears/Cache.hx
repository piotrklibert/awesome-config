package externs.gears;


@:luaRequire("gears.cache")
extern class Cache {
    /** Cache object with data that can be garbage-collected.
     * @see lib/gears/cache.lua:76
     */

    /** Get an entry from the cache, creating it if it's missing.
     *
     * @see lib/gears/cache.lua:86
     * @param ...rest Dynamic  Arguments for the creation callback. These are checked against the cache contents for equality.
     */
    static function get(...rest: Dynamic): Void;

    /** Create a new cache object.
     *
     * @see lib/gears/cache.lua:110
     * @param creation_cb Dynamic  Callback that is used for creating missing cache entries.
     */
    @:selfCall function new(creation_cb: Dynamic);
}
