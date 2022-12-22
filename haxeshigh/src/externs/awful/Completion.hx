package externs.awful;


@:luaRequire("awful.completion")
extern class Completion {
/** Completion module.
 * lib/awful/completion.lua:12
 */
/**
 * Enable programmable bash completion in awful.completion.bash at the price of a slight overhead.
 * @see lib/awful/completion.lua:36
 * @param src Dynamic  The bash completion source file, /etc/bash_completion by default.
 */
static function bashcomp_load(src: Dynamic);
/**
 * Use shell completion system to complete commands and filenames.
 * @see lib/awful/completion.lua:75
 * @param command String  The command line.
 * @param cur_pos Int  The cursor position.
 * @param ncomp Int  The element number to complete.
 * @param shell String  The shell to use for completion.
   Supports "bash" and "zsh".
 */
static function shell(command: String, cur_pos: Int, ncomp: Int, shell: String): String;
/**
 * Run a generic completion.
 * @see lib/awful/completion.lua:198
 * @param text Dynamic  The current text the user had typed yet.
 * @param cur_pos Dynamic  The current cursor position.
 * @param ncomp Dynamic  The number of yet requested completion using current text.
 * @param keywords Dynamic  The keywords table uised for completion.
 */
static function generic(text: Dynamic, cur_pos: Dynamic, ncomp: Dynamic, keywords: Dynamic);
}
