package awful.widget;

import haxe.extern.Rest;

@:multiReturn
extern class IndexResult {
  var index: Int;
  var parent: Widget;
  var path: Array<Widget>;
}

extern class Base {
  // public function buttons(_buttons) // Set/get a widgets buttons.
  // Set a widgets visibility.
  public function set_visible(b: Bool): Void;

  // Is the widget visible?
  public function get_visible(): Bool;

  // Set a widgets opacity.
  public function set_opacity(o: Int): Void;

  // Get the widgets opacity.
  public function get_opacity(): Int;

  // Set the widgets forced width.
  public function set_forced_width(?width: Int): Void;

  // Get the widgets forced width.
  public function get_forced_width(): Int;

  // Set the widgets forced height.
  public function set_height(?height:Int): Void;

  // Get the widgets forced height.
  public function get_forced_height(): Int;

  // Get the widgets direct children widgets.
  public function get_children(): Array<awful.Widget>;

  // Replace the layout children.
  public function set_children(children: Array<awful.Widget>): Void;

  // Get all direct and indirect children widgets.
  public function get_all_children(): utils.lua.LuaTable;

  // Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
  public function emit_signal_recursive(signal_name: String, args: Rest<Dynamic>): Void;

  // Get the index of a widget.
  public function index(widget: awful.Widget, recursive: Bool = false): IndexResult;

  // Set a declarative widget hierarchy description.
  public function setup(args: Dynamic): Widget;
}
