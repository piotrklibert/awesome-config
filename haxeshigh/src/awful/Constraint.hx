package awful;

import haxe.Constraints.Function;

@:luaRequire("wibox.container.constraint")
extern class Constraint {
  static final fit: Function;              // : 25   : function constraint:fit(context, width, height)
  static final get_children: Function;     // : 54   : function constraint:get_children()
  static final get_height: Function;       // : 127  : function constraint:get_height()
  static final get_strategy: Function;     // : 95   : function constraint:get_strategy()
  static final get_widget: Function;       // : 50   : function constraint:get_widget()
  static final get_width: Function;        // : 111  : function constraint:get_width()
  static final layout: Function;           // : 18   : function constraint:layout(_, width, height)
  static final reset: Function;            // : 138  : function constraint:reset()
  static final set_children: Function;     // : 58   : function constraint:set_children(children)
  static final set_height: Function;       // : 121  : function constraint:set_height(val)
  static final set_strategy: Function;     // : 73   : function constraint:set_strategy(val)
  static final set_widget: Function;       // : 188  : function base.set_widget_common(self, widget)
  static final set_width: Function;        // : 105  : function constraint:set_width(val)
}
