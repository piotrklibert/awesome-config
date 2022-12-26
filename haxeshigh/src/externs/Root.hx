package externs;


@:luaRequire("root")
extern class Root {
    /** awesome root window API.
     * @see root.c:28
     */

    /**
     * Get or set global key bindings.
     * @see root.c:359
     */
    var keys: Dynamic;

    /**
     * Store the list of mouse buttons to be applied on the wallpaper (also known as root window).
     * @see root.c:408
     */
    var buttons: lua.Table<String, Dynamic>;

    /**
     * Get the content of the root window as a cairo surface.
     * @see root.c:603
     */
    var content: Dynamic;

    /** Send fake keyboard or mouse events.
     *
     * @see root.c:290
     * @param event_type Dynamic  The event type: key\_press, key\_release, button\_press, button\_release or motion\_notify.
     * @param detail Dynamic  The detail: in case of a key event, this is the keycode to send, in case of a button event this is the number of the button. In case of a motion event, this is a boolean value which if true makes the coordinates relatives.
     * @param x Dynamic  In case of a motion event, this is the X coordinate.
     * @param y Dynamic  In case of a motion event, this is the Y coordinate.
     */
    static function fake_input(event_type: Dynamic, detail: Dynamic, x: Dynamic, y: Dynamic): Void;

    /** Set the root cursor
     *
     * @see root.c:526
     * @param cursor_name Dynamic  A X cursor name.
     */
    static function cursor(cursor_name: Dynamic): Void;

    /** Get the drawins attached to a screen.
     *
     * @see root.c:552
     */
    static function drawins(): Void;

    /** Get the wallpaper as a cairo surface or set it as a cairo pattern.
     *
     * @see root.c:572
     * @param pattern Dynamic  A cairo pattern as light userdata
     */
    static function wallpaper(pattern: Dynamic): Void;

    /** Get the size of the root window.
     *
     * @see root.c:625
     */
    static function size(): Void;

    /** Get the physical size of the root window, in millimeter.
     *
     * @see root.c:639
     */
    static function size_mm(): Void;

    /** Get the attached tags.
     *
     * @see root.c:651
     */
    static function tags(): Void;
}

