package externs.awful;


@:luaRequire("awful.prompt")
extern class Prompt {
/** Prompt module for awful.
 * lib/awful/prompt.lua:276
 */
/**
 * Run a prompt in a box.
 * @see lib/awful/prompt.lua:645
 * @param args lua.Table<String, Dynamic>  A table with optional arguments
 * @param textbox Dynamic  The textbox to use for the prompt. [**DEPRECATED**]
 * @param exe_callback Dynamic  The callback function to call with command as argument
 when finished. [**DEPRECATED**]
 * @param completion_callback Dynamic  The callback function to call to get completion.
   [**DEPRECATED**]
 * @param history_path Dynamic  File path where the history should be
 saved, set nil to disable history [**DEPRECATED**]
 * @param history_max Dynamic  Set the maximum entries in history
 file, 50 by default [**DEPRECATED**]
 * @param done_callback Dynamic  The callback function to always call
 without arguments, regardless of whether the prompt was cancelled.
  [**DEPRECATED**]
 * @param changed_callback Dynamic  The callback function to call
 with command as argument when a command was changed. [**DEPRECATED**]
 * @param keypressed_callback Dynamic  The callback function to call
   with mod table, key and command as arguments when a key was pressed.
   [**DEPRECATED**]
 */
static function run(args: lua.Table<String, Dynamic>, textbox: Dynamic, exe_callback: Dynamic, completion_callback: Dynamic, history_path: Dynamic, history_max: Dynamic, done_callback: Dynamic, changed_callback: Dynamic, keypressed_callback: Dynamic);
}
