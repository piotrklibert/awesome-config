package externs.menubar;


@:luaRequire("menubar.menu_gen")
extern class Menu_gen {
    /** Menu generation module for menubar
     * @see lib/menubar/menu_gen.lua:9
     */

    /** Find icons for category entries.
     *
     * @see lib/menubar/menu_gen.lua:62
     */
    static function lookup_category_icons(): Void;

    /** Generate an array of all visible menu entries.
     *
     * @see lib/menubar/menu_gen.lua:84
     * @param callback haxe.Constraints.Function  Will be fired when all menu entries were parsed with the resulting list of menu entries as argument.
     */
    static function generate(callback: haxe.Constraints.Function): Void;
}

