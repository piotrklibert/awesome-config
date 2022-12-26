package externs;


@:luaRequire("menubar")
extern class Menubar {
    /** Menubar module, which aims to provide a freedesktop menu alternative.
     * @see lib/menubar/init.lua:28
     */

    /** Refresh menubar's cache by reloading .desktop files.
     *
     * @see lib/menubar/init.lua:400
     * @param scr externs.Screen  Screen.
     */
    static function refresh(scr: externs.Screen): Void;

    /** Show the menubar on the given screen.
     *
     * @see lib/menubar/init.lua:457
     * @param scr Dynamic  Screen.
     */
    static function show(scr: Dynamic): Void;

    /** Hide the menubar.
     *
     * @see lib/menubar/init.lua:536
     */
    static function hide(): Void;
}

