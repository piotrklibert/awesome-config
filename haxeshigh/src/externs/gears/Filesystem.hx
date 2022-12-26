package externs.gears;


@:luaRequire("gears.filesystem")
extern class Filesystem {
    /** Filesystem module for gears.
     * @see lib/gears/filesystem.lua:7
     */

    /** Create a directory, including all missing parent directories.
     *
     * @see lib/gears/filesystem.lua:30
     * @param dir String  The directory.
     */
    static function make_directories(dir: String): Void;

    /** Create all parent directories for a given path.
     *
     * @see lib/gears/filesystem.lua:43
     * @param path String  The path whose parents should be created.
     */
    static function make_parent_directories(path: String): Void;

    /** Check if a file exists, is readable and not a directory.
     *
     * @see lib/gears/filesystem.lua:51
     * @param filename String  The file path.
     */
    static function file_readable(filename: String): Bool;

    /** Check if a file exists, is executable and not a directory.
     *
     * @see lib/gears/filesystem.lua:63
     * @param filename String  The file path.
     */
    static function file_executable(filename: String): Bool;

    /** Check if a path exists, is readable and a directory.
     *
     * @see lib/gears/filesystem.lua:75
     * @param path String  The directory path.
     */
    static function dir_readable(path: String): Bool;

    /** Check if a path is a directory.
     *
     * @see lib/gears/filesystem.lua:87
     * @param path String  The directory path
     */
    static function is_dir(path: String): Bool;

    /** Get the config home according to the XDG basedir specification.
     *
     * @see lib/gears/filesystem.lua:94
     */
    static function get_xdg_config_home(): Void;

    /** Get the cache home according to the XDG basedir specification.
     *
     * @see lib/gears/filesystem.lua:101
     */
    static function get_xdg_cache_home(): Void;

    /** Get the data home according to the XDG basedir specification.
     *
     * @see lib/gears/filesystem.lua:108
     */
    static function get_xdg_data_home(): String;

    /** Get the data dirs according to the XDG basedir specification.
     *
     * @see lib/gears/filesystem.lua:115
     */
    static function get_xdg_data_dirs(): lua.Table<String, Dynamic>;

    /** Get the path to the user's config dir.
     *
     * @see lib/gears/filesystem.lua:126
     */
    static function get_configuration_dir(): Void;

    /** Get the path to a directory that should be used for caching data.
     *
     * @see lib/gears/filesystem.lua:133
     */
    static function get_cache_dir(): Void;

    /** Get the path to the directory where themes are installed.
     *
     * @see lib/gears/filesystem.lua:142
     */
    static function get_themes_dir(): Void;

    /** Get the path to the directory where our icons are installed.
     *
     * @see lib/gears/filesystem.lua:149
     */
    static function get_awesome_icon_dir(): Void;

    /** Get the user's config or cache dir.
     *
     * @see lib/gears/filesystem.lua:159
     * @param d Dynamic  The directory to get (either "config" or "cache").
     */
    static function get_dir(d: Dynamic): Void;

    /** Get the name of a random file from a given directory.
     *
     * @see lib/gears/filesystem.lua:180
     * @param path String  The directory to search.
     * @param exts lua.Table<String, Dynamic>  Specific extensions to limit the search to. eg:`{ "jpg", "png" }` If ommited, all files are considered.
     * @param absolute_path Bool  Return the absolute path instead of the filename.
     */
    static function get_random_file_from_dir(path: String, exts: lua.Table<String, Dynamic>, absolute_path: Bool): Null<String>;
}

