package externs.gears;


@:luaRequire("gears.math")
extern class Math {
    /** Math module for gears.
     * @see lib/gears/math.lua:7
     */

    /** Return all subsets of a specific set.
     *
     * @see lib/gears/math.lua:43
     * @param set Dynamic  A set.
     */
    static function subsets(set: Dynamic): Void;

    /** Make i cycle.
     *
     * @see lib/gears/math.lua:62
     * @param t Dynamic  A length. Must be greater than zero.
     * @param i Dynamic  An absolute index to fit into #t.
     */
    static function cycle(t: Dynamic, i: Dynamic): Void;

    /** Round a number to an integer.
     *
     * @see lib/gears/math.lua:75
     * @param x Int  <no desc>
     */
    static function round(x: Int): Int;

    /** Return the sign of the number x return 1 if x is positive, -1 if negative and 0 if x is 0
     *
     * @see lib/gears/math.lua:84
     * @param x Int  <no desc>
     */
    static function sign(x: Int): Int;
}

