package externs.awful;


@:luaRequire("awful.keyboard")
extern class Keyboard {
    /** Utilities related to the keyboard and keybindings.
     * @see lib/awful/keyboard.lua:9
     */

    /** Execute a key combination.
     *
     * @see lib/awful/keyboard.lua:50
     * @param modifiers lua.Table<String, Dynamic>  A modified table. Valid modifiers are: `Any`, `Mod1`, `Mod2`, `Mod3`, `Mod4`, `Mod5`, `Shift`, `Lock` and `Control`.
     * @param key String  The key.
     */
    static function emulate_key_combination(modifiers: lua.Table<String, Dynamic>, key: String): Void;

    /** Add an `awful.key` based keybinding to the global set.
     *
     * @see lib/awful/keyboard.lua:97
     * @param key externs.awful.Key  The key object.
     */
    static function append_global_keybinding(key: externs.awful.Key): Void;

    /** Add multiple `awful.key` based keybindings to the global set.
     *
     * @see lib/awful/keyboard.lua:114
     * @param keys lua.Table<String, Dynamic>  A table of `awful.key` objects. Optionally, it can have a `group` entry. If set, the `group` property will be set on all `awful.keys` objects.
     */
    static function append_global_keybindings(keys: lua.Table<String, Dynamic>): Void;

    /** Remove a keybinding from the global set.
     *
     * @see lib/awful/keyboard.lua:137
     * @param key externs.awful.Key  The key object.
     */
    static function remove_global_keybinding(key: externs.awful.Key): Void;

    /** Add an `awful.key` to the default client keys.
     *
     * @see lib/awful/keyboard.lua:153
     * @param key externs.awful.Key  The key.
     */
    static function append_client_keybinding(key: externs.awful.Key): Void;

    /** Add a `awful.key`s to the default client keys.
     *
     * @see lib/awful/keyboard.lua:171
     * @param keys lua.Table<String, Dynamic>  A table containing `awful.key` objects.
     */
    static function append_client_keybindings(keys: lua.Table<String, Dynamic>): Void;

    /** Remove a key from the default client keys.
     *
     * @see lib/awful/keyboard.lua:184
     * @param key externs.awful.Key  The key.
     */
    static function remove_client_keybinding(key: externs.awful.Key): Bool;

    /** Get X11 keysym and a one-character representation from an Awesome keycode.
     *
     * @see lib/awful/keyboard.lua:218
     */
    static function get_key_name(): String;
}

