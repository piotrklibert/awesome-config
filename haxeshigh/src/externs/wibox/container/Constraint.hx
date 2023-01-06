package externs.wibox.container;


@:luaRequire("wibox.container.constraint")
extern class Constraint extends externs.wibox.widget.Base {
    /** Restrict a widget size using one of multiple available strategies.
     * @see lib/wibox/container/constraint.lua:14
     */

    /**
     * The widget to be constrained.
     * @see lib/wibox/container/constraint.lua:52
     */
    var widget: externs.wibox.Widget;

    /**
     * Set the strategy to use for the constraining.
     * @see lib/wibox/container/constraint.lua:77
     */
    var strategy: String;

    /**
     * Set the maximum width to val.
     * @see lib/wibox/container/constraint.lua:109
     */
    var width: Int;

    /**
     * Set the maximum height to val.
     * @see lib/wibox/container/constraint.lua:125
     */
    var height: Int;

    /** Reset this layout.
     *
     * @see lib/wibox/container/constraint.lua:142
     */
    function reset(): Void;

    /** Returns a new constraint container.
     *
     * @see lib/wibox/container/constraint.lua:163
     * @param widget Dynamic  A widget to use.
     * @param strategy Dynamic  How to constraint the size. 'max' (default), 'min' or 'exact'.
     * @param width Dynamic  The maximum width of the widget. nil for no limit.
     * @param height Dynamic  The maximum height of the widget. nil for no limit.
     */
    @:selfCall function new(widget: externs.wibox.Widget, strategy: ConstraintStrategy = CMax, width: Null<Int> = null, height: Null<Int> = null);
}

enum abstract ConstraintStrategy(String) from String {
    var CMin = "min";
    var CMax = "max";
    var CExact = "exact";
}
