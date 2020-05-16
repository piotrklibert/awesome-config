package awful;

import haxe.Constraints;
import awful.Screen;
import awful.Wibox;
import utils.Common.Point;
import lua.Table;
using utils.lua.LuaTools;


@:native("mouse")
extern class Mouse {
  @:overload(function (): StringTable<Int> {})
  static function coords(p: Point, silent: Bool): StringTable<Int>;

  static inline function get(): Point
    return cast Table.toObject(Mouse.coords());
}
