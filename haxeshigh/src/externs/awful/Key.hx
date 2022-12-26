package externs.awful;


@:luaRequire("awful.key")
extern class Key {
    /** Create easily new key objects ignoring certain modifiers.
     * @see lib/awful/key.lua:66
     */

    /**
     * The keyboard key used to trigger this keybinding.
     * @see lib/awful/key.lua:83
     */
    var key: String;

    /**
     * The table of modifier keys.
     * @see lib/awful/key.lua:108
     */
    var modifiers: lua.Table<String, Dynamic>;

    /**
     * The description of the function run from a key binding.
     * @see lib/awful/key.lua:115
     */
    var description: String;

    /**
     * The key name.
     * @see lib/awful/key.lua:122
     */
    var name: String;

    /**
     * The key group bound to a function in a key binding.
     * @see lib/awful/key.lua:129
     */
    var group: String;

    /**
     * The callback when this key is pressed.
     * @see lib/awful/key.lua:134
     */
    var on_press: Dynamic;

    /**
     * The callback when this key is released.
     * @see lib/awful/key.lua:139
     */
    var on_release: Dynamic;

    /** Execute this keybinding.
     *
     * @see lib/awful/key.lua:199
     */
    function trigger(): Void;

    /** Compare a key object with modifiers and key.
     *
     * @see lib/awful/key.lua:474
     * @param _key Dynamic  The key object.
     * @param pressed_mod Dynamic  The modifiers to compare with.
     * @param pressed_key Dynamic  The key to compare with.
     */
    static function match(_key: Dynamic, pressed_mod: Dynamic, pressed_key: Dynamic): Void;
}

