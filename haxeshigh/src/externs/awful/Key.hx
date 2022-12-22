package externs.awful;


@:luaRequire("awful.key")
extern class Key {
/** Create easily new key objects ignoring certain modifiers.
 * lib/awful/key.lua:66
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
var on_press: Function;
/**
 * The callback when this key is released.
 * @see lib/awful/key.lua:139
 */
var on_release: Function;
/**
 * Create a new key binding (alternate constructor).
 * @see lib/awful/key.lua:309
 * @param mod lua.Table<String, Dynamic>  A list of modifier keys.  Valid modifiers are: `Any`,
  `Mod1`, `Mod2`, `Mod3`, `Mod4`, `Mod5`, `Shift`, `Lock` and `Control`.
 * @param _key String  The key to trigger an event. It can be the character
  itself of `#+keycode`.
 * @param press Function  Callback for when the key is pressed.
 * @param release Function  Callback for when the key is released.
 * @param data lua.Table<String, Dynamic>  User data for key,
 for example {description="select next tag", group="tag"}.
 */
@:selfCall function new(mod: lua.Table<String, Dynamic>, _key: String, press: Function, release: Function, data: lua.Table<String, Dynamic>);
/**
 * Execute this keybinding.
 * @see lib/awful/key.lua:199
 */
function trigger();
/**
 * Compare a key object with modifiers and key.
 * @see lib/awful/key.lua:474
 * @param _key Dynamic  The key object.
 * @param pressed_mod Dynamic  The modifiers to compare with.
 * @param pressed_key Dynamic  The key to compare with.
 */
static function match(_key: Dynamic, pressed_mod: Dynamic, pressed_key: Dynamic);
}
