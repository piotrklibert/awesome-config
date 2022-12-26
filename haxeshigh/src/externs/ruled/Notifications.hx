package externs.ruled;


@:luaRequire("ruled.notifications")
extern class Notifications {
    /** Rules for notifications.
     * @see lib/ruled/notification.lua:200
     */

    /** Remove a source.
     *
     * @see lib/ruled/notification.lua:351
     * @param name String  The source name.
     */
    static function remove_rule_source(name: String): Bool;

    /** Apply the tag rules to a client.
     *
     * @see lib/ruled/notification.lua:363
     * @param n naughty.notification  The notification.
     */
    static function apply(n: naughty.notification): Void;

    /** Add a new rule to the default set.
     *
     * @see lib/ruled/notification.lua:384
     * @param rule lua.Table<String, Dynamic>  A valid rule.
     */
    static function append_rule(rule: lua.Table<String, Dynamic>): Void;

    /** Add a new rules to the default set.
     *
     * @see lib/ruled/notification.lua:391
     * @param rule lua.Table<String, Dynamic>  A table with rules.
     */
    static function append_rules(rule: lua.Table<String, Dynamic>): Void;

    /** Remove a new rule to the default set.
     *
     * @see lib/ruled/notification.lua:398
     * @param rule lua.Table<String, Dynamic>  A valid rule.
     */
    static function remove_rule(rule: lua.Table<String, Dynamic>): Void;

    /** Add a new rule source.
     *
     * @see lib/ruled/notification.lua:423
     * @param name String  The provider name. It must be unique.
     * @param callback haxe.Constraints.Function  The callback that is called to produce properties.
     * @param depends_on lua.Table<String, Dynamic>  A list of names of sources this source depends on (sources that must be executed *before* `name`.
     * @param precede lua.Table<String, Dynamic>  A list of names of sources this source have a priority over.
     */
    static function add_rule_source(name: String, callback: haxe.Constraints.Function, depends_on: lua.Table<String, Dynamic>, precede: lua.Table<String, Dynamic>): Bool;
}

