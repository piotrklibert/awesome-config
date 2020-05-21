package awful;

import haxe.Constraints;
import awful.Screen;
import awful.Wibox;

using utils.lua.LuaTools;

// awful.button({}, 1, function() {})

@:selfCall
@:luaRequire("awful.button")
extern class Button {
  public function new(args: LuaTable, _button: Int, press: Void -> Void, release: Void -> Void);
  public function get_button(): Dynamic;
  public function get_description(): Dynamic;
  public function get_group(): Dynamic;
  public function get_has_root_bin(): Dynamic;
  public function get_name(): Dynamic;
  public function get_on_press(): Dynamic;
  public function get_on_release(): Dynamic;
  public function trigger(): Dynamic;
  public function set_button(val: Dynamic): Void;
  public function set_description(val: Dynamic): Void;
  public function set_group(val: Dynamic): Void;
  public function set_modifiers(val: Dynamic): Void;
  public function set_name(val: Dynamic): Void;
  public function set_on_press(val: Dynamic): Void;
  public function set_on_release(val: Dynamic): Void;

  inline static function make(mods: LuaTable, n: Int, callback: Function): Button {
    return untyped __lua__('awful.button({0}, {1}, {2})', mods, n, callback);
  }

  function connect_signal(n: String, f: Function): Void;
}
