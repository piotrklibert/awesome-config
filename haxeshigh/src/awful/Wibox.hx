package awful;
import haxe.Constraints;

import utils.Common;
import lua.Table.AnyTable;

// TODO: change the names, container widget from awesome is too close to
// built-in "Constraints" module
import awful.Constraint;


typedef PartialGeometry = {
  ?x: Int,
  ?y: Int,
  ?width: Int,
  ?height: Int,
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


// draw_to_cairo_context = <function 1>,
// draw_to_image_surface = <function 2>,
// draw_to_svg_file = <function 3>,

typedef Widgets = {
  background: Class<Widget> ,
  base: Class<Widget> ,
  calendar: Class<Widget> ,
  checkbox: Class<Widget> ,
  graph: Class<Widget> ,
  imagebox: Class<Widget> ,
  piechart: Class<Widget> ,
  progressbar: Class<Widget> ,
  separator: Class<Widget> ,
  slider: Class<Widget> ,
  systray: Class<Widget> ,
  textbox: Class<Widget> ,
  textclock: Class<Widget> ,
}

typedef Align = {
  horizontal: Class<Widget>,
  vertical: Class<Widget>,
}

typedef Layouts = {
  align: Align,
  fixed: Align,
  flex: Class<Widget>,
  grid: Class<Widget>,
  manual: Class<Widget>,
  ratio: Class<Widget>,
  stack: Class<Widget>,
}


typedef Containers = {
  background: Background,
  constraint: Constraint,
  arcchart: Class<Widget>,
  margin: Class<Widget>,
  mirror: Class<Widget>,
  place: Class<Widget>,
  radialprogressbar: Class<Widget>,
  rotate: Class<Widget>,
  scroll: Class<Widget>,
}


@:luaRequire("wibox")
extern class Wibox extends Widget {
    public var visible: Bool;              // Visibility.
    public var opacity: Float;             // The opacity, between 0 and 1. (default 1)
    public var type: String;               // The window type (desktop, normal, dock).
    public var x: Int;                     // The x coordinates.
    public var y: Int;                     // The y coordinates.
    public var width: Int;                 // The width.
    public var height: Int;                // The height.

    @:selfCall
    @:overload(function (o: AnyTable): Wibox {})
    public function new(o: WiboxArgs);


    public static var layout: Layouts;
    public static var container: Containers;
    public static var widget: Widgets;


    @:native("widget")
    public static function makeWidget(t: LuaTable): Widget;


    public function setup(table: LuaTable): Void;
    public function connect_signal(s: String, f: Function): Void;

    @:overload(function (): Geometry {})
    public function geometry(table: PartialGeometry): Void;

    public function buttons(buttons_table: LuaTable): LuaTable;          // Get or set mouse buttons bindings to a wibox.
    public function struts(?strut: Struts): Struts;                      // Get or set wibox struts.
    public function find_widgets(x: Int, y: Int): Widget;                // Find a widget by a point.
    public function to_widget(): Widget;                                 // Create a widget that reflects the current state of this wibox.
    public function save_to_svg(path: String, ?context: LuaTable): Void; // Save a screenshot of the wibox to path.
}
