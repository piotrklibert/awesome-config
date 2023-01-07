package externs.wibox.widget;


@:luaRequire("wibox.widget.base")
extern class Base extends externs.gears.Object {
    /**
     * @see lib/wibox/widget/base.lua:8
     */

    var is_widget: Bool;
    var widget_name: String;

    var point: externs.Types.Point;
    /**
     * Get or set the children elements.
     * @see lib/wibox/widget/base.lua:28
     */
    var children: lua.Table<String, Dynamic>;

    /**
     * Get all direct and indirect children widgets.
     * @see lib/wibox/widget/base.lua:37
     */
    var all_children: lua.Table<String, Dynamic>;

    /**
     * Force a widget height.
     * @see lib/wibox/widget/base.lua:42
     */
    var forced_height: Int;

    /**
     * Force a widget width.
     * @see lib/wibox/widget/base.lua:47
     */
    var forced_width: Int;

    /**
     * The widget opacity (transparency).
     * @see lib/wibox/widget/base.lua:52
     */
    var opacity: Float;

    /**
     * The widget visibility.
     * @see lib/wibox/widget/base.lua:57
     */
    var visible: Bool;

    /**
     * The widget buttons.
     * @see lib/wibox/widget/base.lua:65
     */
    var buttons: lua.Table<String, Dynamic>;

    /** Set a widget's visibility.
     *
     * @see lib/wibox/widget/base.lua:214
     * @param b Bool  Whether the widget is visible.
     */
    function set_visible(b: Bool): Void;

    /** Add a new `awful.button` to this widget.
     *
     * @see lib/wibox/widget/base.lua:226
     * @param button externs.awful.Button  The button to add.
     */
    function add_button(button: externs.awful.Button): Void;

    /** Is the widget visible?
     *
     * @see lib/wibox/widget/base.lua:251
     */
    function get_visible(): Bool;

    /** Set a widget's opacity.
     *
     * @see lib/wibox/widget/base.lua:260
     * @param o Float  The opacity to use (a number from 0 (transparent) to 1 (opaque)).
     */
    function set_opacity(o: Float): Void;

    /** Get the widget's opacity.
     *
     * @see lib/wibox/widget/base.lua:271
     */
    function get_opacity(): Float;

    /** Set the widget's forced width.
     *
     * @see lib/wibox/widget/base.lua:281
     * @param width Float  With `nil` the default mechanism of calling the `:fit` method is used.
     */
    function set_forced_width(width: Float): Void;

    /** Get the widget's forced width.
     *
     * @see lib/wibox/widget/base.lua:298
     */
    function get_forced_width(): Float;

    /** Set the widget's forced height.
     *
     * @see lib/wibox/widget/base.lua:308
     * @param height Float  With `nil` the default mechanism of calling the `:fit` method is used.
     */
    function set_height(height: Float): Void;

    /** Get the widget's forced height.
     *
     * @see lib/wibox/widget/base.lua:324
     */
    function get_forced_height(): Float;

    /** Get the widget's direct children widgets.
     *
     * @see lib/wibox/widget/base.lua:334
     */
    function get_children<T : Base>(): lua.Table<String, T>;

    /** Replace the layout children.
     *
     * @see lib/wibox/widget/base.lua:345
     * @param children lua.Table<String, Dynamic>  A table composed of valid widgets.
     */
    function set_children(children: lua.Table<String, Dynamic>): Void;

    /** Get all direct and indirect children widgets.
     *
     * @see lib/wibox/widget/base.lua:366
     */
    function get_all_children<T: Base>(): lua.Table<String, T>;

    /** Common implementation of the `:set_widget()` method exposed by many other widgets.
     *
     * @see lib/wibox/widget/base.lua:379
     * @param self Dynamic  <no desc>
     * @param widget Dynamic  <no desc>
     */
    static function set_widget_common(self: Dynamic, widget: Dynamic): Void;

    /** Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
     *
     * @see lib/wibox/widget/base.lua:413
     * @param signal_name String  <no desc>
     * @param ...rest Dynamic  Other arguments
     */
    function emit_signal_recursive(signal_name: String, ...rest: Dynamic): Void;

    /** Get the index of a widget.
     *
     * @see lib/wibox/widget/base.lua:430
     * @param widget externs.wibox.Widget  The widget to look for.
     * @param recursive Bool  Recursively check accross the sub-widgets hierarchy.
     * @param ...rest externs.wibox.Widget  Additional widgets to add at the end of the sub-widgets hierarchy "path".
     */
    function index(widget: externs.wibox.Widget, recursive: Bool, ...rest: externs.wibox.Widget): Float;

    /** Figure out the geometry in the device coordinate space.
     *
     * @see lib/wibox/widget/base.lua:501
     */
    static function rect_to_device_geometry(): Void;

    /** Fit a widget for the given available width and height.
     *
     * @see lib/wibox/widget/base.lua:518
     * @param parent externs.wibox.Widget  The parent widget which requests this information.
     * @param context lua.Table<String, Dynamic>  The context in which we are fit.
     * @param widget externs.wibox.Widget  The widget to fit (this uses `widget:fit(context, width, height)`).
     * @param width Float  The available width for the widget.
     * @param height Float  The available height for the widget.
     */
    static function fit_widget(parent: externs.wibox.Widget, context: lua.Table<String, Dynamic>, widget: externs.wibox.Widget, width: Float, height: Float): Float;

    /** Lay out a widget for the given available width and height.
     *
     * @see lib/wibox/widget/base.lua:566
     * @param parent externs.wibox.Widget  The parent widget which requests this information.
     * @param context lua.Table<String, Dynamic>  The context in which we are laid out.
     * @param widget externs.wibox.Widget  The widget to layout (this uses `widget:layout(context, width, height)`).
     * @param width Float  The available width for the widget.
     * @param height Float  The available height for the widget.
     */
    static function layout_widget(parent: externs.wibox.Widget, context: lua.Table<String, Dynamic>, widget: externs.wibox.Widget, width: Float, height: Float): lua.Table<String, Dynamic>;

    /** Handle a button event on a widget.
     *
     * @see lib/wibox/widget/base.lua:586
     */
    static function handle_button(): Void;

    /** Create widget placement information.
     *
     * @see lib/wibox/widget/base.lua:635
     * @param widget externs.wibox.Widget  The widget that should be placed.
     * @param mat Dynamic  A matrix transforming from the parent widget's coordinate system. For example, use matrix.create_translate(1, 2) to draw a widget at position (1, 2) relative to the parent widget.
     * @param width Float  The width of the widget in its own coordinate system. That is, after applying the transformation matrix.
     * @param height Float  The height of the widget in its own coordinate system. That is, after applying the transformation matrix.
     */
    static function place_widget_via_matrix(widget: externs.wibox.Widget, mat: Dynamic, width: Float, height: Float): lua.Table<String, Dynamic>;

    /** Create widget placement information.
     *
     * @see lib/wibox/widget/base.lua:657
     * @param widget externs.wibox.Widget  The widget that should be placed.
     * @param x Float  The x coordinate for the widget.
     * @param y Float  The y coordinate for the widget.
     * @param width Float  The width of the widget in its own coordinate system. That is, after applying the transformation matrix.
     * @param height Float  The height of the widget in its own coordinate system. That is, after applying the transformation matrix.
     */
    static function place_widget_at(widget: externs.wibox.Widget, x: Float, y: Float, width: Float, height: Float): lua.Table<String, Dynamic>;

    /** Set a declarative widget hierarchy description.
     *
     * @see lib/wibox/widget/base.lua:780
     * @param args lua.Table<String, Dynamic>  A table containing the widget's disposition.
     */
    function setup(args: lua.Table<String, Dynamic>): Void;

    /** Create a widget from a declarative description.
     *
     * @see lib/wibox/widget/base.lua:807
     * @param args lua.Table<String, Dynamic>  A table containing the widgets disposition.
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>);

    static function make_widget_declarative(args: lua.Table<String, Dynamic>): Base;

    /** Create a widget from an undetermined value.
     *
     * @see lib/wibox/widget/base.lua:853
     * @param wdg Dynamic  The value.
     * @param ...rest Dynamic  Arguments passed to the contructor (if any).
     */
    static function make_widget_from_value(wdg: Dynamic, ...rest: Dynamic): Null<externs.wibox.Widget>;

    /** Create an empty widget skeleton.
     *
     * @see lib/wibox/widget/base.lua:886
     * @param proxy externs.wibox.Widget  If this is set, the returned widget will be a proxy for this widget. It will be equivalent to this widget. This means it looks the same on the screen.
     * @param widget_name String  Name of the widget. If not set, it will be set automatically via @{gears.object.modulename}.
     * @param args lua.Table<String, Dynamic>  Widget settings
     */
    static function make_widget(proxy: externs.wibox.Widget, widget_name: String, args: lua.Table<String, Dynamic>): Void;

    /** Generate an empty widget which takes no space and displays nothing.
     *
     * @see lib/wibox/widget/base.lua:990
     */
    static function empty_widget(): Void;

    /** Do some sanity checking on a widget.
     *
     * @see lib/wibox/widget/base.lua:998
     */
    static function check_widget(): Void;
}
