package externs.awful.widget;


@:luaRequire("awful.widget.button")
extern class Button extends externs.wibox.widget.Imagebox {
    /** A simple button widget.
     * @see lib/awful/widget/button.lua:25
     */

    /** Create a button widget.
     *
     * @see lib/awful/widget/button.lua:43
     * @param args lua.Table<String, Dynamic>  Widget arguments.
     */
    @:selfCall function new(?args: lua.Table<String, Dynamic>);
}
