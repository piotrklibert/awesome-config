package awful;

import utils.Common;
import haxe.Constraints;

typedef Geometry = {
  ?x: Int, ?y: Int, ?width: Int, ?height: Int,
}

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


  public static function widget(table: LuaTable): Widget;


  public function setup(table: LuaTable): Void;
  public function connect_signal(s: String, f: Function): Void;

  @:overload(function (): Geometry {})
  public function geometry(table: Geometry): Void;
}
