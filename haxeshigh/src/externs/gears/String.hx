package externs.gears;


@:luaRequire("gears.string")
extern class String {
    /** String module for gears.
     * @see lib/gears/string.lua:7
     */

    /** Escape a string from XML char.
     *
     * @see lib/gears/string.lua:16
     * @param text Dynamic  Text to escape.
     */
    static function xml_escape(text: Dynamic): String;

    /** Unescape a string from entities.
     *
     * @see lib/gears/string.lua:27
     * @param text Dynamic  Text to unescape.
     */
    static function xml_unescape(text: Dynamic): String;

    /** Count number of lines in a string.
     *
     * @see lib/gears/string.lua:51
     * @param text String  Input string.
     */
    static function linecount(text: String): Int;

    /** Split a string into multiple lines.
     *
     * @see lib/gears/string.lua:74
     * @param text String  String to wrap.
     * @param width Float  Maximum length of each line. Default: 72.
     * @param indent Float  Number of spaces added before each wrapped line. Default: 0.
     */
    static function linewrap(text: String, width: Float, indent: Float): String;

    /** Escape all special pattern-matching characters so that lua interprets them literally instead of as a character class.
     *
     * @see lib/gears/string.lua:107
     * @param s String  String to generate pattern for
     */
    static function quote_pattern(s: String): String;

    /** Generate a pattern matching expression that ignores case.
     *
     * @see lib/gears/string.lua:116
     * @param q String  Original pattern matching expression.
     */
    static function query_to_pattern(q: String): Void;

    /** Split separates a string containing a delimiter into the list of substrings between that delimiter.
     *
     * @see lib/gears/string.lua:133
     * @param str String  String to be splitted
     * @param delimiter String  Character where the string will be splitted
     */
    static function split(str: String, delimiter: String): lua.Table<String, Dynamic>;

    /** Check if a string starts with another string.
     *
     * @see lib/gears/string.lua:173
     * @param str String  String to search
     * @param sub String  String to check for.
     */
    static function startswith(str: String, sub: String): Bool;

    /** Check if a string ends with another string.
     *
     * @see lib/gears/string.lua:200
     * @param str String  String to search
     * @param sub String  String to check for.
     */
    static function endswith(str: String, sub: String): Bool;
}

