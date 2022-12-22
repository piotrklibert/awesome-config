package ext;

@:luaRequire("pl/stringx")
extern class StringX {
    /** does s only contain alphabetic characters?
     * @param s String a string
     */
    static function isalpha(s: String) : Bool;

    /** does s only contain digits?
     * @param s String a string
     */
    static function isdigit(s: String) : Bool;

    /** does s only contain alphanumeric characters?
     * @param s String a string
     */
    static function isalnum(s: String) : Bool;

    /** does s only contain whitespace?
     * @param s String a string
     */
    static function isspace(s: String) : Bool;

    /** does s only contain lower case characters?
     * @param s String a string
     */
    static function islower(s: String) : Bool;

    /** does s only contain upper case characters?
     * @param s String a string
     */
    static function isupper(s: String) : Bool;

    /** does s start with prefix or one of prefixes?
     * @param s String a string
     * @param prefix Dynamic a string or an array of strings
     */
    static function startswith(s: String, prefix: Dynamic) : Bool;

    /** does s end with suffix or one of suffixes?
     * @param s String a string
     * @param suffix Dynamic a string or an array of strings
     */
    static function endswith(s: String, suffix: Dynamic) : Bool;

    /** concatenate the strings using this string as a delimiter.
     * @param s String the string
     * @param seq Dynamic a table of strings or numbers
     */
    static function join(s: String, seq: Dynamic) : String;

    /** Split a string into a list of lines.
     * @param s String the string.
     * @param keep_ends Bool include line ends.
     */
    static function splitlines(s: String, keep_ends: Bool) : Array<String>; //List of lines;

    /** split a string into a list of strings using a delimiter.
     * @param s String the string
     * @param re String a delimiter (defaults to whitespace)
     * @param n Int maximum number of results
     */
    static function split(s: String, re: String, n: Int) : Array<String>; //List;

    /** replace all tabs in s with tabsize spaces.
     * @param s String the string
     * @param tabsize Int[opt=8] number of spaces to expand each tab
     */
    static function expandtabs(s: String, tabsize: Int) : String; //  expanded string;

    /** find index of first instance of sub in s from the left.
     * @param s String the string
     * @param sub String substring
     * @param first Int first index
     * @param last Int last index
     */
    static function lfind(s: String, sub: String, first: Int, last: Int) : Int; // start index, or nil if not found;

    /** find index of first instance of sub in s from the right.
     * @param s String the string
     * @param sub String substring
     * @param first Int first index
     * @param last Int last index
     */
    static function rfind(s: String, sub: String, first: Int, last: Int) : Int; // start index, or nil if not found;

    /** replace up to n instances of old by new in the string s.
     * @param s String the string
     * @param old String the target substring
     * @param new String the substitution
     * @param n Int optional maximum number of substitutions
     */
    static function replace(s: String, old: String, _new: String, n: Int) : String; // result string;

    /** count all instances of substring in string.
     * @param s String the string
     * @param sub String substring
     * @param allow_overlap Bool allow matches to overlap
     */
    static function count(s: String, sub: String, allow_overlap: Bool) : Int;

    /** left-justify s with width w.
     * @param s String the string
     * @param w Int width of justification
     * @param ch String padding character
     */
    static function ljust(s: String, w: Int, ch: String) : String;

    /** right-justify s with width w.
     * @param s String the string
     * @param w Int width of justification
     * @param ch String padding character
     */
    static function rjust(s: String, w: Int, ch: String) : String;

    /** center-justify s with width w.
     * @param s String the string
     * @param w Int width of justification
     * @param ch String padding character
     */
    static function center(s: String, w: Int, ch: String) : String;

    /** trim any characters on the left of s.
     * @param s String the string
     * @param chrs String default any whitespace character, but can be a string of characters to be trimmed
     */
    static function lstrip(s: String, chrs: String) : String;

    /** trim any characters on the right of s.
     * @param s String the string
     * @param chrs String default any whitespace character, but can be a string of characters to be trimmed
     */
    static function rstrip(s: String, chrs: String) : String;

    /** trim any characters on both left and right of s.
     * @param s String the string
     * @param chrs String default any whitespace character, but can be a string of characters to be trimmed
     */
    static function strip(s: String, chrs: String) : String;

    /** split a string using a pattern.
     * @param s String the string
     * @param re String a Lua string pattern (defaults to whitespace)
     */
    static function splitv(s: String, re: String) : Array<String>; //the parts of the string;

    /** partition the string using first occurance of a delimiter
     * @param s String the string
     * @param ch String delimiter (match as plain string, no patterns)
     */
    static function partition(s: String, ch: String) : String; //part before ch;

    /** partition the string p using last occurance of a delimiter
     * @param s String the string
     * @param ch String delimiter (match as plain string, no patterns)
     */
    static function rpartition(s: String, ch: String) : String; //part before ch;

    /** return the 'character' at the index.
     * @param s String the string
     * @param idx Int an index (can be negative)
     */
    static function at(s: String, idx: Int) : String; //a substring of length 1 if successful, empty string otherwise.;

    /** indent a multiline string.
     * @param s String the (multiline) string
     * @param n Int the size of the indent
     * @param ch String the character to use when indenting
     */
    static function indent(s: String, n: Int, ch: String) : String; //indented string;

    /** dedent a multiline string by removing any initial indent.
     * @param s String the (multiline) string
     */
    static function dedent(s: String) : String; // a string with initial indent zero.;

    /** format a paragraph into lines so that they fit into a line width.
     * @param s String the string to format
     * @param width Int the margin width
     * @param breaklong Bool if truthy, words longer than the width given will be forced split.
     */
    static function wrap(s: String, width: Int, breaklong: Bool) : Array<String>; //a list of lines (List object), use `fill` to return a string instead of a `List`.;

    /** format a paragraph so that it fits into a line width.
     * @param s String the string to format
     * @param width Int the margin width
     * @param breaklong Bool if truthy, words longer than the width given will be forced split.
     */
    static function fill(s: String, width: Int, breaklong: Bool) : String; // a string, use `wrap` to return a list of lines instead of a string.;

    /** Creates a new Template class.
     * @param tmpl String the template string
     */
    // static function lines(s: String) : an iterator;

    /** inital word letters uppercase ('title case').
     * @param s String the string
     */
    static function title(s: String) : String; // a string with each word's first letter uppercase;

    /** Return a shortened version of a string.
     * @param s String the string
     * @param w Int the maxinum size allowed
     * @param tail Bool true if we want to show the end of the string (head otherwise)
     */
    static function shorten(s: String, w: Int, tail: Bool) : Dynamic;

    /** Quote the given string and preserve any control or escape characters, such that reloading the string in Lua returns the same result.
     * @param s Dynamic The string to be quoted.
     */
    static function quote_string(s: Dynamic) : String; // The quoted string.;
}
