package externs.awful;


@:luaRequire("awful.button")
extern class Button {
    /** Create easily new buttons objects ignoring certain modifiers.
     * @see lib/awful/button.lua:11
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
    var on_press: haxe.Constraints.Function;

    /**
     * The callback when this button is released.
     * @see lib/awful/button.lua:106
     */
    var on_release: haxe.Constraints.Function;

    /** Execute this mousebinding.
     *
     * @see lib/awful/button.lua:109
     */
    function trigger(): Void;
}

