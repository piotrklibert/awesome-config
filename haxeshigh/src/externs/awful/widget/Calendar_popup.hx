package externs.awful.widget;


@:luaRequire("awful.widget.calendar_popup")
extern class Calendar_popup {
    /** A calendar popup wibox.
     * @see lib/awful/widget/calendar_popup.lua:35
     */

    /** Call the calendar with offset
     *
     * @see lib/awful/widget/calendar_popup.lua:230
     * @param offset Float  Offset with respect to current month or year
     * @param position String  Two-character position of the calendar in the screen
     * @param screen externs.Screen  Screen where to display the calendar
     */
    function call_calendar(offset: Float, position: String, screen: externs.Screen): wibox;

    /** Toggle calendar visibility.
     *
     * @see lib/awful/widget/calendar_popup.lua:259
     */
    function toggle(): Void;

    /** Attach the calendar to a widget to display at a specific position.
     *
     * @see lib/awful/widget/calendar_popup.lua:276
     * @param widget Dynamic  Widget to attach the calendar
     * @param position String  Two characters string defining the position on the screen
     * @param args lua.Table<String, Dynamic>  Additional options
     */
    function attach(widget: Dynamic, position: String, args: lua.Table<String, Dynamic>): wibox;

    /** A month calendar wibox.
     *
     * @see lib/awful/widget/calendar_popup.lua:404
     * @param args lua.Table<String, Dynamic>  Properties of the widget
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>);

    /** A year calendar wibox.
     *
     * @see lib/awful/widget/calendar_popup.lua:440
     * @param args lua.Table<String, Dynamic>  Properties of the widget
     */
    static function year(args: lua.Table<String, Dynamic>): wibox;
}
