package externs.menubar;


@:luaRequire("menubar.utils")
extern class Utils {
/** Utility module for menubar
 * lib/menubar/utils.lua:9
 */
/**
 * Remove CR newline from the end of the string.
 * @see lib/menubar/utils.lua:204
 * @param s Dynamic  string to trim
 */
static function rtrim(s: Dynamic);
/**
 * Lookup an icon in different folders of the filesystem.
 * @see lib/menubar/utils.lua:216
 * @param icon_file String  Short or full name of the icon.
 */
static function lookup_icon_uncached(icon_file: String): string|boolean;
/**
 * Lookup an icon in different folders of the filesystem (cached).
 * @see lib/menubar/utils.lua:252
 * @param icon Dynamic  Short or full name of the icon.
 */
static function lookup_icon(icon: Dynamic);
/**
 * Parse a .desktop file.
 * @see lib/menubar/utils.lua:263
 * @param file Dynamic  The .desktop file.
 */
static function parse_desktop_file(file: Dynamic);
/**
 * Parse a directory with .desktop files recursively.
 * @see lib/menubar/utils.lua:360
 * @param dir_path String  The directory path.
 * @param callback Function  Will be fired when all the files were parsed
 with the resulting list of menu entries as argument.
 */
static function parse_dir(dir_path: String, callback: Function);
}
