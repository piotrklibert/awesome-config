package externs.awful.widget;


@:luaRequire("awful.widget.launcher")
extern class Launcher extends externs.awful.widget.Button {
    /** A button widget which hosts a menu or starts a command.
     * @see lib/awful/widget/launcher.lua:51
     */

    /** Create a button widget which will launch a command.
     *
     * @see lib/awful/widget/launcher.lua:70
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;
}

