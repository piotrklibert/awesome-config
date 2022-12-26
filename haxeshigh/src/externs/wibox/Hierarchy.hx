package externs.wibox;


@:luaRequire("wibox.hierarchy")
extern class Hierarchy {
    /** Management of widget hierarchies.
     * @see lib/wibox/hierarchy.lua:11
     */

    /** Add a widget to the list of widgets for which hierarchies should count their occurrences.
     *
     * @see lib/wibox/hierarchy.lua:26
     * @param widget Dynamic  The widget that should be counted.
     */
    static function count_widget(widget: Dynamic): Void;

    /** Create a new widget hierarchy that has no parent.
     *
     * @see lib/wibox/hierarchy.lua:212
     * @param context Dynamic  The context in which we are laid out.
     * @param widget Dynamic  The widget that is at the base of the hierarchy.
     * @param width Dynamic  The available width for this hierarchy.
     * @param height Dynamic  The available height for this hierarchy.
     * @param redraw_callback Dynamic  Callback that is called with the corresponding widget hierarchy on widget::redraw_needed on some widget.
     * @param layout_callback Dynamic  Callback that is called with the corresponding widget hierarchy on widget::layout_changed on some widget.
     * @param callback_arg Dynamic  A second argument that is given to the above callbacks.
     */
    @:selfCall function new(context: Dynamic, widget: Dynamic, width: Dynamic, height: Dynamic, redraw_callback: Dynamic, layout_callback: Dynamic, callback_arg: Dynamic): Void;

    /** Update a widget hierarchy with some new state.
     *
     * @see lib/wibox/hierarchy.lua:227
     * @param context Dynamic  The context in which we are laid out.
     * @param widget Dynamic  The widget that is at the base of the hierarchy.
     * @param width Dynamic  The available width for this hierarchy.
     * @param height Dynamic  The available height for this hierarchy.
     * @param region Dynamic  A region to use for accumulating changed parts
     */
    function update(context: Dynamic, widget: Dynamic, width: Dynamic, height: Dynamic, region: Dynamic): Void;

    /** Get the widget that this hierarchy manages.
     *
     * @see lib/wibox/hierarchy.lua:235
     */
    function get_widget(): Void;

    /** Get a matrix that transforms to the parent's coordinate space from this hierarchy's coordinate system.
     *
     * @see lib/wibox/hierarchy.lua:243
     */
    function get_matrix_to_parent(): Void;

    /** Get a matrix that transforms to the base of this hierarchy's coordinate system (aka the coordinate system of the device that this hierarchy is applied upon) from this hierarchy's coordinate system.
     *
     * @see lib/wibox/hierarchy.lua:252
     */
    function get_matrix_to_device(): Void;

    /** Get a matrix that transforms from the parent's coordinate space into this hierarchy's coordinate system.
     *
     * @see lib/wibox/hierarchy.lua:260
     */
    function get_matrix_from_parent(): Void;

    /** Get a matrix that transforms from the base of this hierarchy's coordinate system (aka the coordinate system of the device that this hierarchy is applied upon) into this hierarchy's coordinate system.
     *
     * @see lib/wibox/hierarchy.lua:270
     */
    function get_matrix_from_device(): Void;

    /** Get the extents that this hierarchy possibly draws to (in the current coordinate space).
     *
     * @see lib/wibox/hierarchy.lua:280
     */
    function get_draw_extents(): Void;

    /** Get the size that this hierarchy logically covers (in the current coordinate space).
     *
     * @see lib/wibox/hierarchy.lua:288
     */
    function get_size(): Void;

    /** Get a list of all children.
     *
     * @see lib/wibox/hierarchy.lua:296
     */
    function get_children(): Void;

    /** Count how often this widget is visible inside this hierarchy.
     *
     * @see lib/wibox/hierarchy.lua:305
     * @param widget Dynamic  The widget that should be counted
     */
    function get_count(widget: Dynamic): Void;

    /** Draw a hierarchy to some cairo context.
     *
     * @see lib/wibox/hierarchy.lua:321
     * @param context Dynamic  The context in which widgets are drawn.
     * @param cr Dynamic  The cairo context that is used for drawing.
     */
    function draw(context: Dynamic, cr: Dynamic): Void;
}

