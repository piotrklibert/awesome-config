package awful.widget;

import haxe.extern.Rest;

@:multiReturn
extern class IndexResult {
  var index: Int;
  var parent: Widget;
  var path: Array<Widget>;
}

extern class WidgetBase {
  // public function buttons (_buttons) // Set/get a widgets buttons.
  public function set_visible(b: Bool): Void;                             // Set a widgets visibility.
  public function get_visible(): Bool;                              // Is the widget visible?
  public function set_opacity(o: Int): Void;                             // Set a widgets opacity.
  public function get_opacity(): Int;                              // Get the widgets opacity.
  public function set_forced_width(?width: Int): Void;                  // Set the widgets forced width.
  public function get_forced_width(): Int;                         // Get the widgets forced width.
  public function set_height(?height:Int): Void;                       // Set the widgets forced height.
  public function get_forced_height(): Int;                        // Get the widgets forced height.
  public function get_children(): Array<awful.Widget>;                             // Get the widgets direct children widgets.
  public function set_children(children: Array<awful.Widget>): Void;                     // Replace the layout children.
  public function get_all_children(): Array<awful.Widget>;                         // Get all direct and indirect children widgets.
  public function emit_signal_recursive(signal_name: String, Rest<Dynamic>)    // Emit a signal and ensure all parent widgets in the hierarchies also forward the signal.
  public function index(widget: awful.Widget, recursive: Bool = false): IndexResult          // Get the index of a widget.
  public function setup(args: Dynamic): Widget;                                // Set a declarative widget hierarchy description.
  // public function make_widget_from_value(wdg[, ...=nil])     //
}
