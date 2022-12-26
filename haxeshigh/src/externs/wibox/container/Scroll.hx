package externs.wibox.container;


@:luaRequire("wibox.container.scroll")
extern class Scroll extends externs.wibox.widget.Base {
    /** This container scrolls its inner widget inside of the available space.
     * @see lib/wibox/container/scroll.lua:27
     */

    /**
     * The widget to be scrolled.
     * @see lib/wibox/container/scroll.lua:277
     */
    var widget: externs.wibox.Widget;

    /** Pause the scrolling animation.
     *
     * @see lib/wibox/container/scroll.lua:226
     */
    function pause(): Void;

    /** Continue the scrolling animation.
     *
     * @see lib/wibox/container/scroll.lua:237
     */
    function _continue(): Void;

    /** Reset the scrolling state to its initial condition.
     *
     * @see lib/wibox/container/scroll.lua:251
     */
    function reset_scrolling(): Void;

    /** Set the direction in which this widget scroll.
     *
     * @see lib/wibox/container/scroll.lua:261
     * @param dir Dynamic  Either "h" for horizontal scrolling or "v" for vertical scrolling
     */
    function set_direction(dir: Dynamic): Void;

    /** Specify the expand mode that is used for extra space.
     *
     * @see lib/wibox/container/scroll.lua:310
     * @param expand Bool  If true, the widget is expanded to include the extra space. If false, the extra space is simply left empty.
     */
    function set_expand(expand: Bool): Void;

    /** Set the number of frames per second that this widget should draw.
     *
     * @see lib/wibox/container/scroll.lua:321
     * @param fps Int  The number of frames per second
     */
    function set_fps(fps: Int): Void;

    /** Set the amount of extra space that should be included in the scrolling.
     *
     * @see lib/wibox/container/scroll.lua:335
     * @param extra_space Int  The amount of extra space
     */
    function set_extra_space(extra_space: Int): Void;

    /** Set the speed of the scrolling animation.
     *
     * @see lib/wibox/container/scroll.lua:348
     * @param speed Int  The speed for the animation
     */
    function set_speed(speed: Int): Void;

    /** Set the maximum size of this widget in the direction set by @{set_direction}.
     *
     * @see lib/wibox/container/scroll.lua:362
     * @param max_size Int  The maximum size of this widget or nil for unlimited.
     */
    function set_max_size(max_size: Int): Void;

    /** Set the step function that determines the exact behaviour of the scrolling animation.
     *
     * @see lib/wibox/container/scroll.lua:388
     * @param step_function haxe.Constraints.Function  A step function.
     */
    function set_step_function(step_function: haxe.Constraints.Function): Void;

    /** Set an upper limit for the space for scrolling.
     *
     * @see lib/wibox/container/scroll.lua:402
     * @param space_for_scrolling Int  The space for scrolling
     */
    function set_space_for_scrolling(space_for_scrolling: Int): Void;

    /** Get a new horizontal scrolling container.
     *
     * @see lib/wibox/container/scroll.lua:443
     * @param widget Dynamic  The widget that should be scrolled
     * @param fps Dynamic  The number of frames per second
     * @param speed Dynamic  The speed of the animation
     * @param extra_space Dynamic  The amount of extra space to include
     * @param expand Bool  Should the widget be expanded to include the extra space?
     * @param max_size Dynamic  The maximum size of the child widget
     * @param step_function Dynamic  The step function to be used
     * @param space_for_scrolling Dynamic  The space for scrolling
     */
    @:selfCall function new(widget: Dynamic, fps: Dynamic, speed: Dynamic, extra_space: Dynamic, expand: Bool, max_size: Dynamic, step_function: Dynamic, space_for_scrolling: Dynamic): Void;

    /** Get a new vertical scrolling container.
     *
     * @see lib/wibox/container/scroll.lua:458
     * @param widget Dynamic  The widget that should be scrolled
     * @param fps Dynamic  The number of frames per second
     * @param speed Dynamic  The speed of the animation
     * @param extra_space Dynamic  The amount of extra space to include
     * @param expand Bool  Should the widget be expanded to include the extra space?
     * @param max_size Dynamic  The maximum size of the child widget
     * @param step_function Dynamic  The step function to be used
     * @param space_for_scrolling Dynamic  The space for scrolling
     */
    static function vertical(widget: Dynamic, fps: Dynamic, speed: Dynamic, extra_space: Dynamic, expand: Bool, max_size: Dynamic, step_function: Dynamic, space_for_scrolling: Dynamic): Void;
}

