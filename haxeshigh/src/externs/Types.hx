package externs;

typedef Struts = {
  @:optional var left: Int;
  @:optional var right: Int;
  @:optional var top: Int;
  @:optional var bottom: Int;
  @:optional var left_start_y: Int;
  @:optional var left_end_y: Int;
  @:optional var right_start_y: Int;
  @:optional var right_end_y: Int;
  @:optional var top_start_x: Int;
  @:optional var top_end_x: Int;
  @:optional var bottom_start_x: Int;
};

typedef Point = {
    @:optional var y: Int;
    @:optional var x: Int;
}

typedef Geometry = {
    @:optional var y: Int;
    @:optional var x: Int;
    @:optional var height: Int;
    @:optional var width: Int;
}



typedef WiboxArgs = {
    @:optional var border_width: Int;
    @:optional var border_color: String;
    @:optional var ontop: Bool;
    @:optional var cursor: String;
    @:optional var visible: Bool;
    @:optional var opacity: Float;
    @:optional var type: String;
    @:optional var x: Int;
    @:optional var y: Int;
    @:optional var width: Int;
    @:optional var height: Int;
    @:optional var screen: externs.Screen;
    @:optional var widget: externs.wibox.Widget;
    @:optional var shape: externs.gears.Shape;
    @:optional var shape_bounding: Dynamic;
    @:optional var shape_clip: Dynamic;
    @:optional var shape_input: Dynamic;
    @:optional var bg: externs.gears.Color;
    @:optional var bgimage: externs.gears.Surface;
    @:optional var fg: externs.gears.Color;
    @:optional var input_passthrough: Bool;
}

typedef Padding = {
    @:optional var top: Int;
    @:optional var bottom: Int;
    @:optional var left: Int;
    @:optional var right: Int;
}

typedef Output = {
    name: String,
    dpi: Int,
    mm_size: Float,
    mm_width: Float,
    mm_height: Float,
    viewport_id: Int,
    inch_size: Float,
}

typedef FocusedOptions = {
    @:optional var client: Bool;
    @:optional var mouse: Bool;
}

class Types {}
