package externs.awful.widget;


@:luaRequire("awful.widget.clienticon")
extern class Clienticon extends externs.wibox.widget.Base {
    /** Container showing the icon of a client.
     * @see lib/awful/widget/clienticon.lua:9
     */

    /**
     * The widget's @{client}.
     * @see lib/awful/widget/clienticon.lua:92
     */
    var client: Dynamic;

    /** Returns a new clienticon.
     *
     * @see lib/awful/widget/clienticon.lua:108
     * @param c externs.Client  The client whose icon should be displayed.
     */
    @:selfCall function new(c: externs.Client): Void;
}

