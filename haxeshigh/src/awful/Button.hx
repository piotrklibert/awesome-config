package awful;

import haxe.Constraints;
import awful.Screen;
import awful.Wibox;

using utils.lua.LuaTools;

// awful.button({}, 1, function() {})

@:selfCall
@:luaRequire("awful.button")
extern class Button {
  inline static function make(mods: LuaTable, n: Int, callback: Function): Button {
    return untyped __lua__('awful.button({0}, {1}, {2})', mods, n, callback);
  }
  function connect_signal(n: String, f: Function): Void;
}
