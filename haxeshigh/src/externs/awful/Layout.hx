package externs.awful;


@:luaRequire("awful.layout")
extern class Layout {
    /** Layout module for awful.
     * @see lib/awful/layout/init.lua:9
     */

    /** Return the tag layout index (from `awful.layout.layouts`).
     *
     * @see lib/awful/layout/init.lua:77
     * @param t externs.Tag  The tag.
     */
    static function get_tag_layout_index(t: externs.Tag): Null<Float>;

    /** Get the current layout.
     *
     * @see lib/awful/layout/init.lua:91
     * @param screen Dynamic  The screen.
     */
    static function get(screen: Dynamic): Void;

    /** Change the layout of the current tag.
     *
     * @see lib/awful/layout/init.lua:105
     * @param i Dynamic  Relative index.
     * @param s Dynamic  The screen.
     * @param layouts Dynamic  A table of layouts.
     */
    static function inc(i: Dynamic, s: Dynamic, layouts: Dynamic): Void;

    /** Set the layout function of the current tag.
     *
     * @see lib/awful/layout/init.lua:151
     * @param _layout Dynamic  Layout name.
     * @param t externs.Tag  The tag to modify.
     */
    static function set(_layout: Dynamic, t: externs.Tag): Void;

    /** Get the layout parameters used for the screen This should give the same result as "arrange", but without the "geometries" parameter, as this is computed during arranging.
     *
     * @see lib/awful/layout/init.lua:170
     * @param t externs.Tag  The tag to query
     * @param screen Dynamic  The screen
     */
    static function parameters(t: externs.Tag, screen: Dynamic): lua.Table<String, Dynamic>;

    /** Arrange a screen using its current layout.
     *
     * @see lib/awful/layout/init.lua:213
     * @param screen Dynamic  The screen to arrange.
     */
    static function arrange(screen: Dynamic): Void;

    /** Append a layout to the list of default tag layouts.
     *
     * @see lib/awful/layout/init.lua:255
     * @param to_add externs.awful.Layout  A valid tag layout.
     */
    static function append_default_layout(to_add: externs.awful.Layout): Void;

    /** Remove a layout from the list of default layouts.
     *
     * @see lib/awful/layout/init.lua:294
     * @param to_remove externs.awful.Layout  A valid tag layout.
     */
    static function remove_default_layout(to_remove: externs.awful.Layout): Bool;

    /** Append many layouts to the list of default tag layouts.
     *
     * @see lib/awful/layout/init.lua:317
     * @param layouts lua.Table<String, Dynamic>  A table of valid tag layout.
     */
    static function append_default_layouts(layouts: lua.Table<String, Dynamic>): Void;

    /** Get the current layout name.
     *
     * @see lib/awful/layout/init.lua:327
     * @param _layout Dynamic  The layout.
     */
    static function getname(_layout: Dynamic): Void;
}

