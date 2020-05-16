package awful;

import utils.Common;
import haxe.Constraints;

typedef PartialGeometry = {
  ?x: Int, ?y: Int, ?width: Int, ?height: Int,
}

typedef Struts = {
  ?left: Int,
  ?right: Int,
  ?top: Int,
  ?bottom: Int,
  ?left_start_y: Int,
  ?left_end_y: Int,
  ?right_start_y: Int,
  ?right_end_y: Int,
  ?top_start_x: Int,
  ?top_end_x: Int,
  ?bottom_start_x: Int,
};

typedef WiboxArgs = {
  var ?visible: Bool;              // Visibility.
  var ?opacity: Float;             // The opacity, between 0 and 1. (default 1)
  var ?ontop: Bool;
  var ?type: String;               // The window type (desktop, normal, dock).
  var ?x: Int;                     // The x coordinates.
  var ?y: Int;                     // The y coordinates.
  var ?width: Int;                 // The width.
  var ?height: Int;                // The height.
}


@:luaRequire("wibox")
extern class Wibox {
  var visible: Bool;              // Visibility.
  var opacity: Float;             // The opacity, between 0 and 1. (default 1)
  var type: String;               // The window type (desktop, normal, dock).
  var x: Int;                     // The x coordinates.
  var y: Int;                     // The y coordinates.
  var width: Int;                 // The width.
  var height: Int;                // The height.

  @:selfCall
  @:overload(function (o: WiboxArgs): Wibox {})
  public function new(tbl: LuaTable);

  public static var layout: {fixed: Dynamic};
  public static var container: {margin: Int, background: Background};

  @:native("widget")
  public static function widget(table: LuaTable): Widget;



  public function setup(table: LuaTable): Void;
  public function connect_signal(s: String, f: Function): Void;

  @:overload(function (): Geometry {})
  public function geometry(table: PartialGeometry): Void;

  public function buttons(buttons_table: LuaTable): LuaTable;          // Get or set mouse buttons bindings to a wibox.
  public function struts(?strut: Struts): Struts;                   // Get or set wibox struts.
  public function find_widgets(x: Int, y: Int): Widget;              // Find a widget by a point.
  public function to_widget(): Widget;                     // Create a widget that reflects the current state of this wibox.
  public function save_to_svg(path: String, ?context: LuaTable): Void; // Save a screenshot of the wibox to path.
}
