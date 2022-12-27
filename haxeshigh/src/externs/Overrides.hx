package externs;

typedef Geometry = {
    @:optional var y: Int;
    @:optional var x: Int;
    @:optional var height: Int;
    @:optional var width: Int;
}

typedef WiboxArgs = {
    @:optional var ?visible: Bool;              // Visibility.
    @:optional var ?opacity: Float;             // The opacity, between 0 and 1. (default 1)
    @:optional var ?ontop: Bool;
    @:optional var ?type: String;               // The window type (desktop, normal, dock).
    @:optional var ?x: Int;                     // The x coordinates.
    @:optional var ?y: Int;                     // The y coordinates.
    @:optional var ?width: Int;                 // The width.
    @:optional var ?height: Int;                // The height.
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

class Overrides {}
