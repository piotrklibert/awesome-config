package externs.awful.widget;


@:luaRequire("awful.widget.prompt")
extern class Prompt extends externs.wibox.container.Background {
/** The widget version of `awful.prompt`.
 * lib/awful/widget/prompt.lua:21
 */
/**
 * Always spawn using a shell.
 * @see lib/awful/widget/prompt.lua:86
 */
var with_shell: Bool;
/**
 * Create a prompt widget which will launch a command.
 * @see lib/awful/widget/prompt.lua:127
 * @param args lua.Table<String, Dynamic>  Prompt arguments.
 */
@:selfCall function new(args: lua.Table<String, Dynamic>);
}
