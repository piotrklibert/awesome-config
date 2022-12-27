package externs.awful.widget;


@:luaRequire("awful.widget.layoutlist")
extern class Layoutlist extends externs.wibox.widget.Base {
    /** Display the available client layouts for a screen.
     * @see lib/awful/widget/layoutlist.lua:179
     */

    /**
     * The layoutlist default widget layout.
     * @see lib/awful/widget/layoutlist.lua:340
     */
    var base_layout: externs.wibox.Widget;

    /**
     * The delegate widget template.
     * @see lib/awful/widget/layoutlist.lua:345
     */
    var widget_template: lua.Table<String, Dynamic>;

    /**
     * The layoutlist screen.
     * @see lib/awful/widget/layoutlist.lua:349
     */
    var screen: externs.Screen;

    /**
     * A function that returns the list of layout to display.
     * @see lib/awful/widget/layoutlist.lua:354
     */
    var source: haxe.Constraints.Function;

    /**
     * The layoutlist filter function.
     * @see lib/awful/widget/layoutlist.lua:358
     */
    var filter: haxe.Constraints.Function;

    /**
     * The currenly displayed layouts.
     * @see lib/awful/widget/layoutlist.lua:432
     */
    var layouts: lua.Table<String, Dynamic>;

    /**
     * The currently selected layout.
     * @see lib/awful/widget/layoutlist.lua:436
     */
    var current_layout: externs.awful.Layout;

    /** Create a layout list.
     *
     * @see lib/awful/widget/layoutlist.lua:545
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    @:selfCall function new(args: lua.Table<String, Dynamic>);
}
