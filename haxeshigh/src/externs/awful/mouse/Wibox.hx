package externs.awful.mouse;


@:native("awful.mouse.wibox")
extern class Wibox {
    @:native("move")
    public static function move<T: externs.wibox.Widget>(w: externs.Wibox<T>): Void;
}
