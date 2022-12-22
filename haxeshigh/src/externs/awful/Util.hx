package externs.awful;


@:luaRequire("awful.util")
extern class Util {
/** Utility module for awful.
 * lib/awful/util.lua:9
 */
/**
 * Eval Lua code.
 * @see lib/awful/util.lua:104
 */
static function eval();
/**
 * Check if a file is a Lua valid file.
 * @see lib/awful/util.lua:135
 * @param path Dynamic  The file path.
 */
static function checkfile(path: Dynamic);
/**
 * Try to restart awesome.
 * @see lib/awful/util.lua:147
 */
static function restart();
/**
 * Search for an icon and return the full path.
 * @see lib/awful/util.lua:233
 * @param iconname Dynamic  The name of the icon to search for.
 * @param exts Dynamic  Table of image extensions allowed, otherwise { 'png', gif' }
 * @param dirs Dynamic  Table of dirs to search, otherwise { '/usr/share/pixmaps/' }
 * @param size String  The size. If this is specified, subdirectories `x`
   of the dirs are searched first.
 */
static function geticonpath(iconname: Dynamic, exts: Dynamic, dirs: Dynamic, size: String);
}
