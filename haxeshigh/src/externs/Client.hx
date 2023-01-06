package externs;


@:luaRequire("client")
extern class Client {
    /** A process window.
     * @see objects/client.c:96
     */

    /**
     * The X window id.
     * @see objects/client.c:454
     */
    var window: Int;

    /**
     * The client title.
     * @see objects/client.c:482
     */
    var name: String;

    /**
     * True if the client does not want to be in taskbar.
     * @see objects/client.c:523
     */
    var skip_taskbar: Bool;

    /**
     * The window type.
     * @see objects/client.c:553
     */
    var type: String;

    /**
     * The client class.
     * @see objects/client.c:580
     */
    @:native("class") var _class: String;

    /**
     * The client instance.
     * @see objects/client.c:591
     */
    var instance: String;

    /**
     * The client PID, if available.
     * @see objects/client.c:602
     */
    var pid: Int;

    /**
     * The window role, if available.
     * @see objects/client.c:621
     */
    var role: String;

    /**
     * The machine the client is running on.
     * @see objects/client.c:630
     */
    var machine: String;

    /**
     * The client name when iconified.
     * @see objects/client.c:663
     */
    var icon_name: String;

    /**
     * The client icon as a surface.
     * @see objects/client.c:683
     */
    var icon: externs.gears.Surface;

    /**
     * The available sizes of client icons.
     * @see objects/client.c:714
     */
    var icon_sizes: lua.Table<String, Dynamic>;

    /**
     * Client screen.
     * @see objects/client.c:725
     */
    var screen: externs.Screen;

    /**
     * Define if the client must be hidden (Never mapped, invisible in taskbar).
     * @see objects/client.c:759
     */
    var hidden: Bool;

    /**
     * Define if the client must be iconified (Only visible in taskbar).
     * @see objects/client.c:774
     */
    var minimized: Bool;

    /**
     * Honor size hints, e.g.
     * @see objects/client.c:822
     */
    var size_hints_honor: Bool;

    /**
     * The client border width.
     * @see objects/client.c:880
     */
    var border_width: Int;

    /**
     * The client border color.
     * @see objects/client.c:953
     */
    var border_color: externs.gears.Color;

    /**
     * Set to `true` when the client ask for attention.
     * @see objects/client.c:983
     */
    var urgent: Bool;

    /**
     * A cairo surface for the client window content.
     * @see objects/client.c:1006
     */
    var content: externs.gears.Surface;

    /**
     * The client opacity.
     * @see objects/client.c:1016
     */
    var opacity: Float;

    /**
     * The client is on top of every other windows.
     * @see objects/client.c:1026
     */
    var ontop: Bool;

    /**
     * The client is above normal windows.
     * @see objects/client.c:1036
     */
    var above: Bool;

    /**
     * The client is below normal windows.
     * @see objects/client.c:1062
     */
    var below: Bool;

    /**
     * The client is fullscreen or not.
     * @see objects/client.c:1088
     */
    var fullscreen: Bool;

    /**
     * The client is maximized (horizontally and vertically) or not.
     * @see objects/client.c:1113
     */
    var maximized: Bool;

    /**
     * The client is maximized horizontally or not.
     * @see objects/client.c:1138
     */
    var maximized_horizontal: Bool;

    /**
     * The client is maximized vertically or not.
     * @see objects/client.c:1162
     */
    var maximized_vertical: Bool;

    /**
     * The client the window is transient for.
     * @see objects/client.c:1176
     */
    var transient_for: externs.Client;

    /**
     * Window identification unique to a group of windows.
     * @see objects/client.c:1190
     */
    var group_window: Int;

    /**
     * Identification unique to windows spawned by the same command.
     * @see objects/client.c:1242
     */
    var leader_window: Int;

    /**
     * A table with size hints of the client.
     * @see objects/client.c:1276
     */
    var size_hints: Null<lua.Table<String, Dynamic>>;

    /**
     * The motif WM hints of the client.
     * @see objects/client.c:1300
     */
    var motif_wm_hints: lua.Table<String, Dynamic>;

    /**
     * Set the client sticky (Available on all tags).
     * @see objects/client.c:1321
     */
    var sticky: Bool;

    /**
     * Indicate if the client is modal.
     * @see objects/client.c:1336
     */
    var modal: Bool;

    /**
     * True if the client can receive the input focus.
     * @see objects/client.c:1360
     */
    var focusable: Bool;

    /**
     * The client's bounding shape as set by awesome as a (native) cairo surface.
     * @see objects/client.c:1379
     */
    var shape_bounding: externs.gears.Surface;

    /**
     * The client's clip shape as set by awesome as a (native) cairo surface.
     * @see objects/client.c:1398
     */
    var shape_clip: externs.gears.Surface;

    /**
     * The client's input shape as set by awesome as a (native) cairo surface.
     * @see objects/client.c:1415
     */
    var shape_input: externs.gears.Surface;

    /**
     * The client's bounding shape as set by the program as a (native) cairo surface.
     * @see objects/client.c:1432
     */
    var client_shape_bounding: externs.gears.Surface;

    /**
     * The client's clip shape as set by the program as a (native) cairo surface.
     * @see objects/client.c:1492
     */
    var client_shape_clip: externs.gears.Surface;

    /**
     * The FreeDesktop StartId.
     * @see objects/client.c:1506
     */
    var startup_id: String;

    /**
     * If the client that this object refers to is still managed by awesome.
     * @see objects/client.c:1520
     */
    var valid: Bool;

    /**
     * The first tag of the client.
     * @see objects/client.c:1567
     */
    var first_tag: externs.Tag;

    /**
     * Get or set mouse buttons bindings for a client.
     * @see objects/client.c:1584
     */
    var buttons: lua.Table<String, Dynamic>;

    /**
     * Get or set keys bindings for a client.
     * @see objects/client.c:4444
     */
    var keys: lua.Table<String, Dynamic>;

    /**
     * If a client is marked or not.
     * @see objects/client.c:991
     */
    var marked: Bool;

    /**
     * Return if a client has a fixed size or not.
     * @see objects/client.c:1134
     */
    var is_fixed: Bool;

    /**
     * Is the client immobilized horizontally?
     * @see objects/client.c:1160
     */
    var immobilized_horizontal: Bool;

    /**
     * Is the client immobilized vertically?
     * @see objects/client.c:1176
     */
    var immobilized_vertical: Bool;

    /**
     * The client floating state.
     * @see objects/client.c:1222
     */
    var floating: Bool;

    /**
     * The x coordinates.
     * @see objects/client.c:1316
     */
    var x: Int;

    /**
     * The y coordinates.
     * @see objects/client.c:1340
     */
    var y: Int;

    /**
     * The width of the client.
     * @see objects/client.c:1360
     */
    var width: Int;

    /**
     * The height of the client.
     * @see objects/client.c:1380
     */
    var height: Int;

    /**
     * If the client is dockable.
     * @see objects/client.c:1675
     */
    var dockable: Bool;

    /**
     * If the client requests not to be decorated with a titlebar.
     * @see objects/client.c:1714
     */
    var requests_no_titlebar: Bool;

    /**
     * Set the client shape.
     * @see objects/client.c:1961
     */
    var shape: Dynamic;

    /**
     * Return true if the client is active (has focus).
     * @see objects/client.c:2146
     */
    var active: Bool;

    /** Return client struts (reserved space at the edge of the screen).
     *
     * @see objects/client.c:1578
     * @param struts lua.Table<String, Dynamic>  A table with new strut values, or none.
     */
    function struts(struts: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Get the number of instances.
     *
     * @see objects/client.c:1589
     */
    static function instances(): Int;

    /** Get all clients into a table.
     *
     * @see objects/client.c:3129
     * @param screen extype.extern.Mixed.Mixed2<Int, externs.Screen>  A screen number to filter clients on.
     * @param stacked Bool  Return clients in stacking order? (ordered from top to bottom).
     */
    static function get(screen: extype.extern.Mixed.Mixed2<Int, externs.Screen>, stacked: Bool): lua.Table<String, Dynamic>;

    /** Check if a client is visible on its screen.
     *
     * @see objects/client.c:3170
     */
    function isvisible(): Bool;

    /** Kill a client.
     *
     * @see objects/client.c:3303
     */
    function kill(): Void;

    /** Swap a client with another one in global client list.
     *
     * @see objects/client.c:3342
     * @param c externs.Client  A client to swap with.
     */
    function swap(c: externs.Client): Void;

    /** Access or set the client tags.
     *
     * @see objects/client.c:3417
     * @param tags_table lua.Table<String, Dynamic>  A table with tags to set, or `nil` to get the current tags.
     */
    function tags(tags_table: lua.Table<String, Dynamic>): lua.Table<String, Dynamic>;

    /** Raise a client on top of others which are on the same layer.
     *
     * @see objects/client.c:3491
     */
    function raise(): Void;

    /** Lower a client on bottom of others which are on the same layer.
     *
     * @see objects/client.c:3517
     */
    function lower(): Void;

    /** Stop managing a client.
     *
     * @see objects/client.c:3544
     */
    function unmanage(): Void;

    /** Return or set client geometry.
     *
     * @see objects/client.c:3783
     * @param geo Null<lua.Table<String, Dynamic>>  A table with new coordinates, or nil.
     */

    function geometry(geo: externs.Types.Geometry = null): lua.Table<String, Dynamic>;

    /** Apply size hints to a size.
     *
     * @see objects/client.c:3828
     * @param width Int  Desired width of client
     * @param height Int  Desired height of client
     */
    function apply_size_hints(width: Int, height: Int): Int;

    /** Get the client's n-th icon.
     *
     * @see objects/client.c:4505
     * @param index Int  The index in the list of icons to get.
     */
    function get_icon(index: Int): externs.gears.Surface;

    /** Disconnect from a signal.
     *
     * @see objects/client.c:4785
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback that should be disconnected.
     */
    static function disconnect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Emit a signal.
     *
     * @see objects/client.c:4791
     * @param name String  The name of the signal.
     * @param ...rest Dynamic  Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
     */
    static function emit_signal(name: String, ...rest: Dynamic): Void;

    /** Connect to a signal.
     *
     * @see objects/client.c:4793
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    static function connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Jump to the given client.
     *
     * @see objects/client.c:295
     * @param merge extype.extern.Mixed.Mixed2<Bool, haxe.Constraints.Function>  If true then merge tags (select the client's first tag additionally) when the client is not visible. If it is a function, it will be called with the client and its first tag as arguments.
     */
    function jump_to(merge: extype.extern.Mixed.Mixed2<Bool, haxe.Constraints.Function>): Void;

    /** Get a client by its relative index to another client.
     *
     * @see objects/client.c:376
     * @param i Int  The index. Use 1 to get the next, -1 to get the previous.
     * @param sel externs.Client  The client.
     * @param stacked Bool  Use stacking order? (top to bottom)
     */
    static function next(i: Int, sel: externs.Client, stacked: Bool): Null<externs.Client>;

    /** Swap a client with another client in the given direction.
     *
     * @see objects/client.c:429
     * @param dir String  The direction, can be either "up", "down", "left" or "right".
     * @param c externs.Client  The client.
     * @param stacked Bool  Use stacking order? (top to bottom)
     */
    static function bydirection(dir: String, c: externs.Client, stacked: Bool): Void;

    /** Swap a client with another client in the given direction.
     *
     * @see objects/client.c:475
     * @param dir String  The direction, can be either "up", "down", "left" or "right".
     * @param sel externs.Client  The client.
     */
    static function global_bydirection(dir: String, sel: externs.Client): Void;

    /** Swap a client by its relative index.
     *
     * @see objects/client.c:545
     * @param i Int  The index.
     * @param c externs.Client  The client, otherwise focused one is used.
     */
    static function byidx(i: Int, c: externs.Client): Void;

    /** Cycle through the clients to change the focus.
     *
     * @see objects/client.c:576
     * @param clockwise Bool  True to cycle clients clockwise.
     * @param s externs.Screen  The screen where to cycle clients.
     * @param stacked Bool  Use stacking order? (top to bottom)
     */
    static function cycle(clockwise: Bool, s: externs.Screen, stacked: Bool): Void;

    /** Append a keybinding.
     *
     * @see objects/client.c:602
     * @param key externs.awful.Key  The key.
     */
    function append_keybinding(key: externs.awful.Key): Void;

    /** Remove a keybinding.
     *
     * @see objects/client.c:607
     * @param key externs.awful.Key  The key.
     */
    function remove_keybinding(key: externs.awful.Key): Void;

    /** Append a mousebinding.
     *
     * @see objects/client.c:612
     * @param button externs.awful.Button  The button.
     */
    function append_mousebinding(button: externs.awful.Button): Void;

    /** Remove a mousebinding.
     *
     * @see objects/client.c:617
     * @param button externs.awful.Button  The button.
     */
    function remove_mousebinding(button: externs.awful.Button): Void;

    /** Move the client to the most significant layout position.
     *
     * @see objects/client.c:665
     */
    function to_primary_section(): Void;

    /** Move the client to the least significant layout position.
     *
     * @see objects/client.c:697
     */
    function to_secondary_section(): Void;

    /** Move/resize a client relative to current coordinates.
     *
     * @see objects/client.c:753
     * @param x Int  The relative x coordinate.
     * @param y Int  The relative y coordinate.
     * @param w Int  The relative width.
     * @param h Int  The relative height.
     */
    function relative_move(x: Int, y: Int, w: Int, h: Int): Void;

    /** Move a client to a tag.
     *
     * @see objects/client.c:792
     * @param target externs.Tag  The tag to move the client to.
     */
    function move_to_tag(target: externs.Tag): Void;

    /** Toggle a tag on a client.
     *
     * @see objects/client.c:834
     * @param target externs.Tag  The tag to move the client to.
     */
    function toggle_tag(target: externs.Tag): Void;

    /** Move a client to a screen.
     *
     * @see objects/client.c:892
     * @param s externs.Screen  The screen, default to current + 1.
     */
    function move_to_screen(s: externs.Screen): Void;

    /** Find suitable tags for newly created clients.
     *
     * @see objects/client.c:954
     */
    function to_selected_tags(): Void;

    /** Restore (=unminimize) a random client.
     *
     * @see objects/client.c:1413
     * @param s externs.Screen  The screen to use.
     */
    static function restore(s: externs.Screen): externs.Client;

    /** Set a client property to be persistent across restarts (via X properties).
     *
     * @see objects/client.c:1784
     * @param prop String  The property name.
     * @param kind String  The type (used for register_xproperty). One of "string", "number" or "boolean".
     */
    static function persist(prop: String, kind: String): Void;

    /** Returns an iterator to cycle through clients.
     *
     * @see objects/client.c:1816
     * @param filter haxe.Constraints.Function  a function that returns true to indicate a positive match.
     * @param start Int  what index to start iterating from. Defaults to using the index of the currently focused client.
     * @param s externs.Screen  which screen to use. nil means all screens.
     */
    static function iterate(filter: haxe.Constraints.Function, start: Int, s: externs.Screen): Void;

    /** Get a matching transient_for client (if any).
     *
     * @see objects/client.c:1884
     * @param matcher haxe.Constraints.Function  A function that should return true, if a matching parent client is found.
     */
    function get_transient_for_matching(matcher: haxe.Constraints.Function): Null<externs.Client>;

    /** Is a client transient for another one?
     *
     * @see objects/client.c:1923
     * @param c2 externs.Client  The parent client to check.
     */
    function is_transient_for(c2: externs.Client): Null<externs.Client>;

    /** Activate (focus) a client.
     *
     * @see objects/client.c:2036
     * @param args lua.Table<String, Dynamic>  <no desc>
     */
    function activate(args: lua.Table<String, Dynamic>): Void;

    /** Grant a permission for a client.
     *
     * @see objects/client.c:2078
     * @param permission String  The permission name (just the name, no `request::`).
     * @param context String  The reason why this permission is requested.
     */
    function grant(permission: String, context: String): Void;

    /** Deny a permission for a client.
     *
     * @see objects/client.c:2085
     * @param permission String  The permission name (just the name, no `request::`).
     * @param context String  The reason why this permission is requested.
     */
    function deny(permission: String, context: String): Void;

    /** Jump to the client that received the urgent hint first.
     *
     * @see objects/client.c:2217
     * @param merge extype.extern.Mixed.Mixed2<Bool, haxe.Constraints.Function>  If true then merge tags (select the client's first tag additionally) when the client is not visible. If it is a function, it will be called with the client as argument.
     */
    static function jumpto(merge: extype.extern.Mixed.Mixed2<Bool, haxe.Constraints.Function>): Void;

    /** Connect to a signal weakly.
     *
     * @see objects/client.c:2335
     * @param name String  The name of the signal.
     * @param func haxe.Constraints.Function  The callback to call when the signal is emitted.
     */
    function weak_connect_signal(name: String, func: haxe.Constraints.Function): Void;

    /** Remove a client from the focus history
     *
     * @see objects/client.c:49
     * @param c externs.Client  The client that must be removed.
     */
    static function delete(c: externs.Client): Void;

    /** Filter out window that we do not want handled by focus.
     *
     * @see objects/client.c:112
     * @param c externs.Client  A client.
     */
    static function filter(c: externs.Client): Void;

    /** Update client focus history.
     *
     * @see objects/client.c:126
     * @param c externs.Client  The client that has been focused.
     */
    static function add(c: externs.Client): Void;

    /** Focus the previous client in history.
     *
     * @see objects/client.c:180
     */
    static function previous(): Void;

    /** Is history tracking enabled?
     *
     * @see objects/client.c:288
     */
    static function is_enabled(): Bool;

    /** Enable history tracking.
     *
     * @see objects/client.c:295
     */
    static function enable_tracking(): Bool;

    /** Disable history tracking.
     *
     * @see objects/client.c:303
     */
    static function disable_tracking(): Int;
}
