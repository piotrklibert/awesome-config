package externs.awful;


@:luaRequire("awful.hotkeys_popup")
extern class Hotkeys_popup {
    /** Popup widget which shows current hotkeys and their descriptions.
     * @see lib/awful/hotkeys_popup/init.lua:9
     */

    /** This is the same as awful.hotkeys_popup.widget.show_help.
     *
     * @see lib/awful/hotkeys_popup/init.lua:30
     * @param c externs.Client  The hostkeys for the client "c".
     * @param s externs.Screen  The screen.
     */
    static function show_help(c: externs.Client, s: externs.Screen): Void;

    /** Add rules to match tmux session.
     *
     * @see lib/awful/hotkeys_popup/init.lua:24
     * @param rule lua.Table<String, Dynamic>  Rules to match a window containing a tmux session.
     */
    static function add_rules_for_terminal(rule: lua.Table<String, Dynamic>): Void;
}

