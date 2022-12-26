package externs.awful.hotkeys_popup;


@:luaRequire("awful.hotkeys_popup.widget")
extern class Widget {
    /** Popup widget which shows current hotkeys and their descriptions.
     * @see lib/awful/hotkeys_popup/widget.lua:68
     */

    /** Create an instance of widget with hotkeys help.
     *
     * @see lib/awful/hotkeys_popup/widget.lua:251
     * @param args lua.Table<String, Dynamic>  Configuration options for the widget.
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>): Void;

    /** Show popup with hotkeys help.
     *
     * @see lib/awful/hotkeys_popup/widget.lua:678
     * @param c externs.Client  Client.
     * @param s externs.Screen  Screen.
     * @param show_args lua.Table<String, Dynamic>  Additional arguments.
     */
    function show_help(c: externs.Client, s: externs.Screen, show_args: lua.Table<String, Dynamic>): Void;

    /** Add hotkey descriptions for third-party applications.
     *
     * @see lib/awful/hotkeys_popup/widget.lua:738
     * @param hotkeys lua.Table<String, Dynamic>  Table with bindings, see `awful.hotkeys_popup.key.vim` as an example.
     */
    function add_hotkeys(hotkeys: lua.Table<String, Dynamic>): Void;

    /** Add hotkey group rules for third-party applications.
     *
     * @see lib/awful/hotkeys_popup/widget.lua:761
     * @param group String  hotkeys group name,
     * @param data lua.Table<String, Dynamic>  rule data for the group see `awful.hotkeys_popup.key.vim` as an example.
     */
    function add_group_rules(group: String, data: lua.Table<String, Dynamic>): Void;
}

