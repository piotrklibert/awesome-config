package externs.wibox.widget;


@:luaRequire("wibox.widget.textclock")
extern class Textclock extends externs.wibox.widget.Textbox {
    /** Text clock widget.
     * @see lib/wibox/widget/textclock.lua:85
     */

    /**
     * Set the clock's format.
     * @see lib/wibox/widget/textclock.lua:114
     */
    var format: String;

    /**
     * Set the clock's timezone.
     * @see lib/wibox/widget/textclock.lua:130
     */
    var timezone: String;

    /**
     * Set the clock's refresh rate.
     * @see lib/wibox/widget/textclock.lua:145
     */
    var refresh: Float;

    /** Force a textclock to update now.
     *
     * @see lib/wibox/widget/textclock.lua:157
     */
    function force_update(): Void;

    /** Create a textclock widget.
     *
     * @see lib/wibox/widget/textclock.lua:174
     * @param format String  The time [format](#format).
     * @param refresh Float  How often to update the time (in seconds).
     * @param timezone String  The [timezone](#timezone) to use.
     */
    @:selfCall function new(format: String, refresh: Float, timezone: String = null);
}
