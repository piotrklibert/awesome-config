package awful.widget;

import haxe.extern.Rest;


@:multiReturn
extern class IndexResult {
  var index: Int;
  var parent: Widget;
  var path: Array<Widget>;
}


@:native("wibox.widget.base")
extern class Base {
  public var is_widget: Bool;

  public function add_button(button: Dynamic): Void;
  public function emit_signal_recursive(signal_name: String, args: Rest<Dynamic>): Void;     // Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
  public function get_all_children(): utils.lua.LuaTable;     // Get all direct and indirect children widgets.
  public function get_children(): Array<awful.Widget>;     // Get the widgets direct children widgets.
  public function get_forced_height(): Int;     // Get the widgets forced height.
  public function get_forced_width(): Int;     // Get the widgets forced width.
  public function get_opacity(): Int;     // Get the widgets opacity.
  public function get_visible(): Bool;     // Is the widget visible?
  public function index(widget: awful.Widget, recursive: Bool = false): IndexResult;     // Get the index of a widget.
  public function set_children(children: Array<awful.Widget>): Void;     // Replace the layout children.
  public function set_forced_width(?width: Int): Void;     // Set the widgets forced width.
  public function set_height(?height:Int): Void;     // Set the widgets forced height.
  public function set_opacity(o: Int): Void;     // Set a widgets opacity.
  public function set_visible(b: Bool): Void;     // Set a widgets visibility.
  public function setup(args: Dynamic): Widget;     // Set a declarative widget hierarchy description.
  public function set_widget_common(widget: Widget): Dynamic;

  public static function check_widget(widget: LuaTable): Dynamic;
  public static function empty_widget(): Dynamic;
  public static function fit_widget(parent: Dynamic, context: Dynamic, widget: Dynamic, width: Int, height: Int): Dynamic;
  public static function handle_button(event: Dynamic, widget: Dynamic, x: Int, y: Int, button: Dynamic, modifiers: Dynamic, geometry: LuaTable): Dynamic;
  public static function layout_widget(parent: Dynamic, context: Dynamic, widget: Dynamic, width: Int, height: Int): Dynamic;
  public static function make_widget(proxy: Dynamic, widget_name: Dynamic, args: Rest<Dynamic>): Dynamic;
  public static function make_widget_declarative(args: Rest<Dynamic>): Dynamic;
  public static function make_widget_from_value(wdg: Dynamic, wdgs: Rest<Dynamic>): Dynamic;
  public static function place_widget_at(widget: Dynamic, x: Int, y: Int, width: Int, height: Int): Dynamic;
  public static function place_widget_via_matrix(widget: Dynamic, mat: Dynamic, width: Int, height: Int): Dynamic;
  public static function rect_to_device_geometry(cr: Dynamic, x: Int, y: Int, width: Int, height: Int): Dynamic;
}
