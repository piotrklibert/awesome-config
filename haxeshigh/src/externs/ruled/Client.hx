package externs.ruled;


@:luaRequire("ruled.client")
extern class Client {
    /** Rules for clients.
     * @see lib/ruled/client.lua:293
     */

    /** Check if a client matches a rule.
     *
     * @see lib/ruled/client.lua:321
     * @param c externs.Client  The client.
     * @param rule lua.Table<String, Dynamic>  The rule to check.
     */
    static function match(c: externs.Client, rule: lua.Table<String, Dynamic>): Bool;

    /** Check if a client matches any part of a rule.
     *
     * @see lib/ruled/client.lua:330
     * @param c externs.Client  The client.
     * @param rule lua.Table<String, Dynamic>  The rule to check.
     */
    static function match_any(c: externs.Client, rule: lua.Table<String, Dynamic>): Bool;

    /** Does a given rule entry match a client?
     *
     * @see lib/ruled/client.lua:340
     * @param c externs.Client  The client.
     * @param entry lua.Table<String, Dynamic>  Rule entry (with keys `rule`, `rule_any`, `except` and/or `except_any`).
     */
    static function matches(c: externs.Client, entry: lua.Table<String, Dynamic>): Bool;

    /** Get list of matching rules for a client.
     *
     * @see lib/ruled/client.lua:350
     * @param c externs.Client  The client.
     * @param _rules lua.Table<String, Dynamic>  The rules to check. List with "rule", "rule_any", "except" and "except_any" keys.
     */
    static function matching_rules(c: externs.Client, _rules: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Check if a client matches a given set of rules.
     *
     * @see lib/ruled/client.lua:360
     * @param c externs.Client  The client.
     * @param _rules lua.Table<String, Dynamic>  The rules to check. List of tables with `rule`, `rule_any`, `except` and `except_any` keys.
     */
    static function matches_list(c: externs.Client, _rules: lua.Table<String, Dynamic>): Bool;

    /** Remove a source.
     *
     * @see lib/ruled/client.lua:368
     * @param name String  The source name.
     */
    static function remove_rule_source(name: String): Bool;

    /** Apply ruled.client.rules to a client.
     *
     * @see lib/ruled/client.lua:375
     * @param c externs.Client  The client.
     */
    static function apply(c: externs.Client): Void;

    /** Add a new rule to the default set.
     *
     * @see lib/ruled/client.lua:382
     * @param rule lua.Table<String, Dynamic>  A valid rule.
     */
    static function append_rule(rule: lua.Table<String, Dynamic>): Void;

    /** Add a new rules to the default set.
     *
     * @see lib/ruled/client.lua:388
     * @param rules lua.Table<String, Dynamic>  A table with rules.
     */
    static function append_rules(rules: lua.Table<String, Dynamic>): Void;

    /** Remove a new rule to the default set.
     *
     * @see lib/ruled/client.lua:395
     * @param rule extype.extern.Mixed.Mixed2<lua.Table<String, Dynamic>, String>  A valid rule or a name passed in the `id` value when calling `append_rule`.
     */
    static function remove_rule(rule: extype.extern.Mixed.Mixed2<lua.Table<String, Dynamic>, String>): Void;

    /** Add a new rule source.
     *
     * @see lib/ruled/client.lua:440
     * @param name String  The provider name. It must be unique.
     * @param callback haxe.Constraints.Function  The callback that is called to produce properties.
     * @param depends_on lua.Table<String, Dynamic>  A list of names of sources this source depends on (sources that must be executed *before* `name`.
     * @param precede lua.Table<String, Dynamic>  A list of names of sources this source have a priority over.
     */
    static function add_rule_source(name: String, callback: haxe.Constraints.Function, depends_on: lua.Table<String, Dynamic>, precede: lua.Table<String, Dynamic>): Bool;

    /** Apply properties and callbacks to a client.
     *
     * @see lib/ruled/client.lua:726
     * @param c externs.Client  The client.
     * @param props lua.Table<String, Dynamic>  Properties to apply.
     * @param callbacks lua.Table<String, Dynamic>  Callbacks to apply.
     */
    static function execute(c: externs.Client, props: lua.Table<String, Dynamic>, callbacks: lua.Table<String, Dynamic>): Void;
}

