package externs;


@:luaRequire("mousegrabber")
extern class Mousegrabber {
    /** awesome mousegrabber API.
     * @see mousegrabber.c:28
     */

    /** Grab the mouse pointer and list motions, calling callback function at each motion.
     *
     * @see mousegrabber.c:167
     * @param func Dynamic  A callback function as described above.
     * @param cursor Dynamic  The name of a X cursor to use while grabbing.
     */
    static function run(func: Dynamic, cursor: Dynamic): Void;

    /** Stop grabbing the mouse pointer.
     *
     * @see mousegrabber.c:197
     */
    static function stop(): Void;

    /** Check if mousegrabber is running.
     *
     * @see mousegrabber.c:210
     */
    static function isrunning(): Bool;
}

