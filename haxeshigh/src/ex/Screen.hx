package ex;
import haxe.Constraints;
import haxe.extern.Rest;

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
  @:overload(function (): Screen {})
  static function focused(args: Dynamic): Screen;

  // 	Call a function for each existing and created-in-the-future screen.
  static function connect_for_each_screen(func: Function): Void;

  // 	Undo the effect of connect_for_each_screen.
  static function disconnect_for_each_screen(func: Function): Void;

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
}
