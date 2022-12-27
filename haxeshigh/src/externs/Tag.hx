package externs;


@:luaRequire("tag")
extern class Tag {
    /** awesome tag API.
     * @see objects/tag.c:203
     */

    /**
     * Tag name.
     * @see objects/tag.c:326
     */
    var name: String;

    /**
     * True if the tag is selected to be viewed.
     * @see objects/tag.c:334
     */
    var selected: Bool;

    /**
     * True if the tag is active and can be used.
     * @see objects/tag.c:340
     */
    var activated: Bool;

    /**
     * The tag index.
     * @see objects/tag.c:166
     */
    var index: Int;

    /**
     * The tag screen.
     * @see objects/tag.c:672
     */
    var screen: externs.Screen;

    /**
     * The tag master width factor.
     * @see objects/tag.c:803
     */
    var master_width_factor: Float;

    /**
     * The tag client layout.
     * @see objects/tag.c:920
     */
    var layout: externs.awful.Layout;

    /**
     * The (proposed) list of available layouts for this tag.
     * @see objects/tag.c:938
     */
    var layouts: lua.Table<String, Dynamic>;

    /**
     * Define if the tag must be deleted when the last client is untagged.
     * @see objects/tag.c:1158
     */
    var volatile: Bool;

    /**
     * The gap (spacing, also called `useless_gap`) between clients.
     * @see objects/tag.c:1214
     */
    var gap: Float;

    /**
     * Enable gaps for a single client.
     * @see objects/tag.c:1280
     */
    var gap_single_client: Bool;

    /**
     * Set size fill policy for the master client(s).
     * @see objects/tag.c:1358
     */
    var master_fill_policy: String;

    /**
     * Set the number of master windows.
     * @see objects/tag.c:1448
     */
    var master_count: Int;

    /**
     * Set the tag icon.
     * @see objects/tag.c:1534
     */
    var icon: extype.extern.Mixed.Mixed2<Dynamic, externs.gears.Surface>;

    /**
     * Set the number of columns.
     * @see objects/tag.c:1604
     */
    var column_count: Int;

    /** Get the number of instances.
     *
     * @see objects/tag.c:345
     */
    static function instances(): Void;

    /** Get or set the clients attached to this tag.
     *
     * @see objects/tag.c:512
     * @param clients_table lua.Table<String, Dynamic>  None or a table of clients to set as being tagged with this tag.
     */
    function clients(clients_table: lua.Table<String, Dynamic>): Void;

    /** Disconnect from a signal.
     *
     * @see objects/tag.c:696
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback that should be disconnected.
     */
    static function disconnect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Emit a signal.
     *
     * @see objects/tag.c:702
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    static function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see objects/tag.c:704
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    static function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Swap 2 tags.
     *
     * @see objects/tag.c:249
     * @param tag2 externs.Tag  The second tag
     */
    function swap(tag2: externs.Tag): Void;

    /** Add a tag.
     *
     * @see objects/tag.c:291
     * @param name String  The tag name, a string
     * @param props Null<lua.Table<String, Dynamic>>  The tags initial properties, a table
     */
    @:selfCall function new(name: String, props: Null<lua.Table<String, Dynamic>>);

    /** Create a set of tags and attach it to a screen.
     *
     * @see objects/tag.c:364
     * @param names lua.Table<String, Dynamic>  The tag name, in a table
     * @param screen extype.extern.Mixed.Mixed2<externs.Screen, Float>  The tag screen (defaults to screen 1).
     * @param layout lua.Table<String, Dynamic>  The layout or layout table to set for this tags by default.
     */
    static function _new(names: lua.Table<String, Dynamic>, screen: extype.extern.Mixed.Mixed2<externs.Screen, Float>, layout: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Find a suitable fallback tag.
     *
     * @see objects/tag.c:389
     * @param screen externs.Screen  The screen to look for a tag on. [awful.screen.focused()]
     * @param invalids Null<lua.Table<String, Dynamic>>  A table of tags considered unacceptable. [selectedlist(scr)]
     */
    static function find_fallback(screen: externs.Screen, invalids: Null<lua.Table<String, Dynamic>>): Void;

    /** Remove all tagged clients.
     *
     * @see objects/tag.c:423
     * @param args lua.Table<String, Dynamic>  The arguments.
     */
    function clear(args: lua.Table<String, Dynamic>): Void;

    /** Delete a tag.
     *
     * @see objects/tag.c:476
     * @param fallback_tag externs.Tag  Tag to assign stickied tags to.
     * @param force Bool  Move even non-sticky clients to the fallback tag.
     */
    function delete(fallback_tag: externs.Tag, force: Bool): Void;

    /** Update the tag history.
     *
     * @see objects/tag.c:555
     * @param obj externs.Screen  Screen object.
     */
    static function update(obj: externs.Screen): Void;

    /** Revert tag history.
     *
     * @see objects/tag.c:599
     * @param screen externs.Screen  The screen.
     * @param idx Float  Index in history. Defaults to "previous" which is a special index toggling between last two selected sets of tags. Number (eg 1) will go back to the given index in history.
     */
    static function restore(screen: externs.Screen, idx: Float): Void;

    /** Find a tag by name.
     *
     * @see objects/tag.c:655
     * @param s externs.Screen  The screen of the tag
     * @param name String  The name of the tag
     */
    static function find_by_name(s: externs.Screen, name: String): Void;

    /** Increase master width factor.
     *
     * @see objects/tag.c:833
     * @param add Float  Value to add to master width factor.
     * @param t externs.Tag  The tag to modify, if null tag.selected() is used.
     */
    static function incmwfact(add: Float, t: externs.Tag): Void;

    /** Increase the spacing between clients
     *
     * @see objects/tag.c:1242
     * @param add Float  Value to add to the spacing between clients
     * @param t externs.Tag  The tag to modify, if null tag.selected() is used.
     */
    static function incgap(add: Float, t: externs.Tag): Void;

    /** Toggle size fill policy for the master client(s) between "expand" and "master_width_factor".
     *
     * @see objects/tag.c:1383
     * @param t externs.Tag  The tag to modify, if null tag.selected() is used.
     */
    static function togglemfpol(t: externs.Tag): Void;

    /** Increase the number of master windows.
     *
     * @see objects/tag.c:1490
     * @param add Float  Value to add to number of master windows.
     * @param t externs.Tag  The tag to modify, if null tag.selected() is used.
     * @param sensible Bool  Limit nmaster based on the number of visible tiled windows?
     */
    static function incnmaster(add: Float, t: externs.Tag, sensible: Bool): Void;

    /** Increase number of column windows.
     *
     * @see objects/tag.c:1649
     * @param add Float  Value to add to number of column windows.
     * @param t externs.Tag  The tag to modify, if null tag.selected() is used.
     * @param sensible Bool  Limit column_count based on the number of visible tiled windows?
     */
    static function incncol(add: Float, t: externs.Tag, sensible: Bool): Void;

    /** View no tag.
     *
     * @see objects/tag.c:1693
     * @param screen extype.extern.Mixed.Mixed2<Int, externs.Screen>  The screen.
     */
    static function viewnone(screen: extype.extern.Mixed.Mixed2<Int, externs.Screen>): Void;

    /** Select a tag relative to the currently selected one.
     *
     * @see objects/tag.c:1728
     * @param i Float  The **relative** index to see.
     * @param screen externs.Screen  The screen.
     */
    static function viewidx(i: Float, screen: externs.Screen): Void;

    /** View next tag.
     *
     * @see objects/tag.c:1783
     * @param screen externs.Screen  The screen.
     */
    static function viewnext(screen: externs.Screen): Void;

    /** View previous tag.
     *
     * @see objects/tag.c:1811
     * @param screen externs.Screen  The screen.
     */
    static function viewprev(screen: externs.Screen): Void;

    /** View only a tag.
     *
     * @see objects/tag.c:1834
     */
    function view_only(): Void;

    /** View only a set of tags.
     *
     * @see objects/tag.c:1869
     * @param tags lua.Table<String, Dynamic>  A table with tags to view only.
     * @param screen externs.Screen  The screen of the tags.
     * @param maximum Float  The maximum number of tags to select.
     */
    static function viewmore(tags: lua.Table<String, Dynamic>, screen: externs.Screen, maximum: Float): Void;

    /** Toggle selection of a tag
     *
     * @see objects/tag.c:1901
     * @param t externs.Tag  Tag to be toggled
     */
    static function viewtoggle(t: externs.Tag): Void;

    /** Add a signal to all attached tags and all tags that will be attached in the future.
     *
     * @see objects/tag.c:1996
     * @param screen externs.Screen  The screen concerned, or all if nil.
     * @param signal String  The signal name.
     * @param Callback haxe.Constraints.Function  <no desc>
     */
    static function attached_connect_signal(screen: externs.Screen, signal: String, Callback: haxe.Constraints.Function): Void;

    /** Connect to a signal weakly.
     *
     * @see objects/tag.c:2191
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;
}
