package externs.awful;


@:luaRequire("awful.button")
extern class Button {
/** Create easily new buttons objects ignoring certain modifiers.
 * lib/awful/button.lua:11
 */
/**
 * The table of modifier keys.
 * @see lib/awful/button.lua:74
 */
var modifiers: Dynamic;
/**
 * The mouse button identifier.
 * @see lib/awful/button.lua:81
 */
var button: Int;
/**
 * The button description.
 * @see lib/awful/button.lua:86
 */
var description: String;
/**
 * The button name.
 * @see lib/awful/button.lua:91
 */
var name: String;
/**
 * The button group.
 * @see lib/awful/button.lua:96
 */
var group: String;
/**
 * The callback when this button is pressed.
 * @see lib/awful/button.lua:101
 */
var on_press: Function;
/**
 * The callback when this button is released.
 * @see lib/awful/button.lua:106
 */
var on_release: Function;
/**
 * Create a new button to use as binding.
 * @see lib/awful/button.lua:248
 * @param mod lua.Table<String, Dynamic>  A list of modifier keys.  Valid modifiers are:
  `Any`, `Mod1`, Mod2`, `Mod3`, `Mod4`, `Mod5`, `Shift`, `Lock` and `Control`.
  This argument is (**mandatory**).
 * @param button Int  The mouse button (it is recommended to use the
  `awful.button.names` constants.
 * @param press Function  Callback for when the button is pressed.
 * @param release Function  Callback for when the button is released.
 */
@:selfCall function new(mod: lua.Table<String, Dynamic>, button: Int, press: Function, release: Function);
/**
 * Execute this mousebinding.
 * @see lib/awful/button.lua:109
 */
function trigger();
}
