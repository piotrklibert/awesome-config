package externs.gears;


@:luaRequire("gears.matcher")
extern class Matcher {
/** A module to build a set of properties based on a graph of rules.
 * lib/gears/matcher.lua:203
 */
/**
 * Create a new rule solver object.
 * @see lib/gears/matcher.lua:724
 */
@:selfCall function new();
/**
 * Does a given rule entry match an object?
 * @see lib/gears/matcher.lua:358
 * @param o Dynamic  The object.
 * @param entry lua.Table<String, Dynamic>  Rule entry (with keys `rule`, `rule_any`, `except` and/or
   `except_any`).
 */
function matches_rule(o: Dynamic, entry: lua.Table<String, Dynamic>): Bool;
/**
 * Get list of matching rules for an object.
 * @see lib/gears/matcher.lua:392
 * @param o Dynamic  The object.
 * @param rules lua.Table<String, Dynamic>  The rules to check. List with "rule", "rule_any",
  "except" and "except_any" keys. If no rules are provided, all rules
  registered with a source will be matched.
 */
function matching_rules(o: Dynamic, rules: lua.Table<String, Dynamic>);
/**
 * Check if an object matches a given set of rules.
 * @see lib/gears/matcher.lua:426
 * @param o Dynamic  The object.
 * @param rules lua.Table<String, Dynamic>  The rules to check. List of tables with `rule`,
  `rule_any`, `except` and `except_any` keys.
 */
function matches_rules(o: Dynamic, rules: lua.Table<String, Dynamic>): Bool;
/**
 * Assign a function to match an object property against a value.
 * @see lib/gears/matcher.lua:466
 * @param name String  The property name.
 * @param f Function  The matching function.
 */
function add_property_matcher(name: String, f: Function);
/**
 * Add a special setter for a property.
 * @see lib/gears/matcher.lua:482
 * @param name String  The property name.
 * @param f Function  The setter function.
 */
function add_property_setter(name: String, f: Function);
/**
 * Add a set of matching rules.
 * @see lib/gears/matcher.lua:524
 * @param name String  The provider name. It must be unique.
 * @param rules lua.Table<String, Dynamic>  A set of rules (see how they work at the top of this
  page).
 * @param depends_on lua.Table<String, Dynamic>  A list of names of sources this source
  depends on (sources that must be executed *before* `name`).
 * @param precede lua.Table<String, Dynamic>  A list of names of sources this source has a
  priority over.
 */
function add_matching_rules(name: String, rules: lua.Table<String, Dynamic>, depends_on: lua.Table<String, Dynamic>, precede: lua.Table<String, Dynamic>): Bool;
/**
 * Add a matching function.
 * @see lib/gears/matcher.lua:552
 * @param name String  The provider name. It must be unique.
 * @param callback Function  The callback that is called to produce properties.
 * @param depends_on lua.Table<String, Dynamic>  A list of names of sources this source depends on
  (sources that must be executed *before* `name`).
 * @param precede lua.Table<String, Dynamic>  A list of names of sources this source has a
  priority over.
 */
function add_matching_function(name: String, callback: Function, depends_on: lua.Table<String, Dynamic>, precede: lua.Table<String, Dynamic>): Bool;
/**
 * Remove a source.
 * @see lib/gears/matcher.lua:615
 * @param name String  The source name.
 */
function remove_matching_source(name: String): Bool;
/**
 * Apply ruled.client.rules to an object.
 * @see lib/gears/matcher.lua:639
 * @param o Dynamic  The object.
 */
function apply(o: Dynamic);
/**
 * Add a new rule to the default set.
 * @see lib/gears/matcher.lua:681
 * @param source String  The source name.
 * @param rule lua.Table<String, Dynamic>  A valid rule.
 */
function append_rule(source: String, rule: lua.Table<String, Dynamic>);
/**
 * Add a new rules to the default set.
 * @see lib/gears/matcher.lua:693
 * @param source String  The source name.
 * @param rules lua.Table<String, Dynamic>  A table with rules.
 */
function append_rules(source: String, rules: lua.Table<String, Dynamic>);
/**
 * Remove a new rule from the default set.
 * @see lib/gears/matcher.lua:704
 * @param source String  The source name.
 * @param rule haxe.extern.EitherType<String, lua.Table<String, Dynamic>>  An existing rule or its `id`.
 */
function remove_rule(source: String, rule: haxe.extern.EitherType<String, lua.Table<String, Dynamic>>): Bool;
/**
 * Emit a signal.
 * @see lib/gears/matcher.lua:845
 * @param name String  The name of the signal.
 * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected
   function receives the object as first argument and then any extra
   arguments that are given to emit_signal().
 */
function emit_signal(name: String, ...rest: Dynamic);
/**
 * Connect to a signal.
 * @see lib/gears/matcher.lua:851
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function connect_signal(name: String, func: Function);
/**
 * Connect to a signal weakly.
 * @see lib/gears/matcher.lua:864
 * @param name String  The name of the signal.
 * @param func Function  The callback to call when the signal is emitted.
 */
function weak_connect_signal(name: String, func: Function);
}
