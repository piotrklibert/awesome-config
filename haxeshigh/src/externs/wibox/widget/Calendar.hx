package externs.wibox.widget;


@:luaRequire("wibox.widget.calendar")
extern class Calendar {
    /** A calendar widget.
     * @see lib/wibox/widget/calendar.lua:33
     */

    /**
     * The calendar date.
     * @see lib/wibox/widget/calendar.lua:85
     */
    var date: lua.Table<String, Dynamic>;

    /**
     * The calendar font.
     * @see lib/wibox/widget/calendar.lua:98
     */
    var font: String;

    /**
     * The calendar spacing.
     * @see lib/wibox/widget/calendar.lua:105
     */
    var spacing: Float;

    /**
     * Display the calendar week numbers.
     * @see lib/wibox/widget/calendar.lua:121
     */
    var week_numbers: Bool;

    /**
     * Start the week on Sunday.
     * @see lib/wibox/widget/calendar.lua:137
     */
    var start_sunday: Bool;

    /**
     * Format the weekdays with three characters instead of two
     * @see lib/wibox/widget/calendar.lua:153
     */
    var long_weekdays: Bool;

    /**
     * The widget encapsulating function.
     * @see lib/wibox/widget/calendar.lua:234
     */
    var fn_embed: haxe.Constraints.Function;

    /**
     * Allow cells to have flexible height
     * @see lib/wibox/widget/calendar.lua:251
     */
    var flex_height: Bool;

    /** A month calendar widget.
     *
     * @see lib/wibox/widget/calendar.lua:513
     * @param date lua.Table<String, Dynamic>  Date of the calendar
     * @param font String  Font of the calendar
     */
    @:selfCall function new(date: lua.Table<String, Dynamic>, font: String): Void;

    /** A year calendar widget.
     *
     * @see lib/wibox/widget/calendar.lua:541
     * @param date lua.Table<String, Dynamic>  Date of the calendar
     * @param font String  Font of the calendar
     */
    static function year(date: lua.Table<String, Dynamic>, font: String): externs.wibox.Widget;
}

