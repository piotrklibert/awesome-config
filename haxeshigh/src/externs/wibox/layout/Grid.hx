package externs.wibox.layout;


@:luaRequire("wibox.layout.grid")
extern class Grid extends externs.wibox.widget.Base {
    /** A grid layout.
     * @see lib/wibox/layout/grid.lua:53
     */

    /**
     * Set the preferred orientation of the grid layout.
     * @see lib/wibox/layout/grid.lua:98
     */
    var orientation: String;

    /**
     * Allow to superpose widgets in the same cell.
     * @see lib/wibox/layout/grid.lua:109
     */
    var superpose: Bool;

    /**
     * Force the number of rows of the layout.
     * @see lib/wibox/layout/grid.lua:113
     */
    var forced_num_rows: Int;

    /**
     * Force the number of columns of the layout.
     * @see lib/wibox/layout/grid.lua:117
     */
    var forced_num_cols: Int;

    /**
     * Set the minimum size for the columns.
     * @see lib/wibox/layout/grid.lua:126
     */
    var min_cols_size: Int;

    /**
     * Set the minimum size for the rows.
     * @see lib/wibox/layout/grid.lua:130
     */
    var min_rows_size: Int;

    /**
     * The spacing between columns.
     * @see lib/wibox/layout/grid.lua:137
     */
    var horizontal_spacing: Int;

    /**
     * The spacing between rows.
     * @see lib/wibox/layout/grid.lua:144
     */
    var vertical_spacing: Int;

    /**
     * The spacing between rows and columns.
     * @see lib/wibox/layout/grid.lua:156
     */
    var spacing: Int;

    /**
     * Controls if the columns are expanded to use all the available width.
     * @see lib/wibox/layout/grid.lua:163
     */
    var horizontal_expand: Bool;

    /**
     * Controls if the rows are expanded to use all the available height.
     * @see lib/wibox/layout/grid.lua:170
     */
    var vertical_expand: Bool;

    /**
     * Controls if the columns/rows are expanded to use all the available space.
     * @see lib/wibox/layout/grid.lua:182
     */
    var expand: Bool;

    /**
     * Controls if the columns all have the same width or if the width of each column depends on the content.
     * @see lib/wibox/layout/grid.lua:190
     */
    var horizontal_homogeneous: Bool;

    /**
     * Controls if the rows all have the same height or if the height of each row depends on the content.
     * @see lib/wibox/layout/grid.lua:198
     */
    var vertical_homogeneous: Bool;

    /**
     * Controls if the columns/rows all have the same size or if the size depends on the content.
     * @see lib/wibox/layout/grid.lua:211
     */
    var homogeneous: Bool;

    /** Get the number of rows and columns occupied by the widgets in the grid.
     *
     * @see lib/wibox/layout/grid.lua:283
     */
    function get_dimension(): number,number;

    /** Find the next available cell to insert a widget.
     *
     * @see lib/wibox/layout/grid.lua:312
     * @param hint_row Int  The row coordinate of the last occupied cell.
     * @param hint_column Int  The column coordinate of the last occupied cell.
     */
    function get_next_empty(hint_row: Int, hint_column: Int): Void;

    /** Add some widgets to the given grid layout.
     *
     * @see lib/wibox/layout/grid.lua:347
     * @param ...rest Dynamic  Widgets that should be added (must at least be one)
     */
    function add(...rest: Dynamic): Void;

    /** Add a widget to the grid layout at specific coordinate.
     *
     * @see lib/wibox/layout/grid.lua:376
     * @param child Dynamic  Widget that should be added
     * @param row Int  Row number for the top left corner of the widget
     * @param col Int  Column number for the top left corner of the widget
     * @param row_span Int  The number of rows the widget spans.
     * @param col_span Int  The number of columns the widget spans.
     */
    function add_widget_at(child: Dynamic, row: Int, col: Int, row_span: Int, col_span: Int): Bool;

    /** Remove one or more widgets from the layout.
     *
     * @see lib/wibox/layout/grid.lua:417
     * @param ...rest Dynamic  Widgets that should be removed (must at least be one)
     */
    function remove(...rest: Dynamic): Bool;

    /** Remove widgets at the coordinates.
     *
     * @see lib/wibox/layout/grid.lua:454
     * @param row Int  The row coordinate of the widget to remove
     * @param col Int  The column coordinate of the widget to remove
     * @param row_span Int  The number of rows the area to remove spans.
     * @param col_span Int  The number of columns the area to remove spans.
     */
    function remove_widgets_at(row: Int, col: Int, row_span: Int, col_span: Int): Bool;

    /** Return the coordinates of the widget.
     *
     * @see lib/wibox/layout/grid.lua:475
     * @param widget Dynamic  The widget
     */
    function get_widget_position(widget: Dynamic): lua.Table<String, Dynamic>;

    /** Return the widgets at the coordinates.
     *
     * @see lib/wibox/layout/grid.lua:495
     * @param row Int  The row coordinate of the widget
     * @param col Int  The column coordinate of the widget
     * @param row_span Int  The number of rows to span.
     * @param col_span Int  The number of columns to span.
     */
    function get_widgets_at(row: Int, col: Int, row_span: Int, col_span: Int): lua.Table<String, Dynamic>;

    /** Replace old widget by new widget, spanning the same columns and rows.
     *
     * @see lib/wibox/layout/grid.lua:516
     * @param old Dynamic  The widget to remove
     * @param _new Dynamic  The widget to add
     */
    function replace_widget(old: Dynamic, _new: Dynamic): Bool;

    /** Insert column at index.
     *
     * @see lib/wibox/layout/grid.lua:591
     * @param index Null<Int>  Insert the new column at index. If `nil`, the column is added at the end.
     */
    function insert_column(index: Null<Int>): Int;

    /** Extend column at index.
     *
     * @see lib/wibox/layout/grid.lua:615
     * @param index Null<Int>  Extend the column at index. If `nil`, the last column is extended.
     */
    function extend_column(index: Null<Int>): Int;

    /** Remove column at index.
     *
     * @see lib/wibox/layout/grid.lua:640
     * @param index Null<Int>  Remove column at index. If `nil`, the last column is removed.
     */
    function remove_column(index: Null<Int>): Int;

    /** Insert row at index.
     *
     * @see lib/wibox/layout/grid.lua:658
     * @param index Null<Int>  Insert the new row at index. If `nil`, the row is added at the end.
     */
    function insert_row(index: Null<Int>): Int;

    /** Extend row at index.
     *
     * @see lib/wibox/layout/grid.lua:676
     * @param index Null<Int>  Extend the row at index. If `nil`, the last row is extended.
     */
    function extend_row(index: Null<Int>): Int;

    /** Remove row at index.
     *
     * @see lib/wibox/layout/grid.lua:694
     * @param index Null<Int>  Remove row at index. If `nil`, the last row is removed.
     */
    function remove_row(index: Null<Int>): Int;

    /** Reset the grid layout.
     *
     * @see lib/wibox/layout/grid.lua:956
     */
    function reset(): Void;

    /** Return a new grid layout.
     *
     * @see lib/wibox/layout/grid.lua:980
     * @param orientation String  The preferred grid extension direction.
     */
    @:selfCall function new(orientation: String): Void;

    /** Return a new horizontal grid layout.
     *
     * @see lib/wibox/layout/grid.lua:1019
     * @param forced_num_rows Null<Int>  Forced number of rows (`nil` for automatic).
     * @param ...rest externs.wibox.Widget  Widgets that should be added to the layout.
     */
    static function horizontal(forced_num_rows: Null<Int>, ...rest: externs.wibox.Widget): Void;

    /** Return a new vertical grid layout.
     *
     * @see lib/wibox/layout/grid.lua:1037
     * @param forced_num_cols Null<Int>  Forced number of columns (`nil` for automatic).
     * @param ...rest externs.wibox.Widget  Widgets that should be added to the layout.
     */
    static function vertical(forced_num_cols: Null<Int>, ...rest: externs.wibox.Widget): Void;

    /** Set a widget at a specific index, replacing the current one.
     *
     * @see lib/wibox/layout/grid.lua:1067
     * @param index Int  A widget or a widget index
     * @param widget2 externs.wibox.Widget  The widget to replace the previous one with
     */
    function set(index: Int, widget2: externs.wibox.Widget): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/grid.lua:1098
     * @param index1 Int  The first widget index
     * @param index2 Int  The second widget index
     */
    function swap(index1: Int, index2: Int): Bool;

    /** Swap 2 widgets in a layout.
     *
     * @see lib/wibox/layout/grid.lua:1121
     * @param widget1 externs.wibox.Widget  The first widget
     * @param widget2 externs.wibox.Widget  The second widget
     * @param recursive Bool  Recurse into all compatible layouts to find the widget.
     */
    function swap_widgets(widget1: externs.wibox.Widget, widget2: externs.wibox.Widget, recursive: Bool): Bool;
}

