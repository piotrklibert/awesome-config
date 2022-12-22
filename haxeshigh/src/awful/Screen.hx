package awful;

import haxe.Constraints;
import haxe.extern.Rest;


typedef OutputInfo = {
    dpi: Float,
    inch_size: Float,
    mm_height: Float,
    mm_size: Float,
    mm_width: Float,
    name: String,
    viewport_id: Int
}



@:luaRequire("awful.screen")
extern class Screen {
    // 	Return the screen index corresponding to the given (pixel) coordinates.
    static function getbycoord(x: Int, y: Int): Int;

    // 	Move the focus to a screen.
    static function focus(_screen: Screen): Void;

    // 	Move the focus to a screen in a specific direction.
    static function focus_bydirection(dir: String, _screen: Screen): Dynamic;

    // 	Move the focus to a screen relative to the current one,
    static function focus_relative(offset: Int): Void;

    // 	Get the focused screen.
    @:overload(function (): Null<Screen> {})
    @:overload(function (args: {client: Bool}): Null<Screen> {})
    @:overload(function (args: {mouse: Bool}): Null<Screen> {})
    static function focused(args: {mouse: Bool, client: Bool}): Null<Screen>;

    // 	Call a function for each existing and created-in-the-future screen.
    static function connect_for_each_screen(func: Screen->Void): Void;

    // 	Undo the effect of connect_for_each_screen.
    static function disconnect_for_each_screen(func: Screen->Void): Void;

    static var primary: Screen;

    // Get the number of instances.
    function instances(): Int;

    // Iterate over screens.
    function screen(): Screen;

    // Get the number of screens.
    function count(): Int;

    // Add a fake screen.
    function fake_add(x: Int, y: Int, width: Int, height: Int): Void;

    // Remove a screen.
    function fake_remove(): Void;

    // Fake-resize a screen
    function fake_resize(x: Int, y: Int, width: Int, height: Int): Void;

    // Swap a screen with another one in global screen list.
    function swap(s: Screen): Void;

    // Disconnect from a signal.
    function disconnect_signal(name: String, func: Function): Void;

    // Emit a signal.
    function emit_signal(name: String, rest: Rest<Dynamic>): Void;

    // Connect to a signal.
    function connect_signal(name: String, func: Function): Void;

    // Get the square distance between a screen and a point.
    function get_square_distance(x: Int, y: Int): Void;

    // Get the next screen in a specific direction.
    function get_next_in_direction(self: Screen, dir: Dynamic): Void;

    // Get the preferred screen in the context of a client.
    function preferred(c: Dynamic): Void;

    // Get a placement bounding geometry.
    function get_bounding_geometry(?args: Dynamic): Void;

    // Get the list of visible clients for the screen.
    function get_clients(stacked: Bool = true): Void;

    // Get all clients assigned to the screen.
    function get_all_clients(stacked: Bool = true): Void;

    // Get tiled clients for the screen.
    function get_tiled_clients(stacked: Bool = true): Void;

    function set_auto_dpi_enabled(enabled: Bool): Void;


    public final geometry: utils.Common.Geometry;   // The screen coordinates.
    public final index: Int;                        // The internal screen number.
    public final outputs: Map<String, OutputInfo>;  // If RANDR information is available, a list of outputs for this screen and their size in mm.
    public final workarea: utils.Common.Geometry;   // The screen workarea.
    public final padding: utils.Common.Padding;     // The screen padding.
    public final clients: Array<Client>;            // The list of visible clients for the screen.
    public final hidden_clients: Array<Client>;     // Get the list of clients assigned to the screen but not currently visible.
    public final all_clients: Array<Client>;        // All clients assigned to the screen.
    public final tiled_clients: Array<Client>;      // Tiled clients for the screen.
    public final tags: Array<Tag>;                  // A list of all tags on the screen.
    public final selected_tags: Array<Tag>;         // A list of all selected tags on the screen.
    public final selected_tag: Tag;                 // The first selected tag.
    public final dpi: Int;                          // The number of pixels per inch of the screen.
}
