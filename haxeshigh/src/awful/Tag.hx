package awful;

#if !macro
import lua.Lua;
import lua.Table;
#else
typedef AnyTable = Dynamic;
#end

@:luaRequire("awful.tag")
extern class Tag {
  final name: String;

  // Create a set of tags and attach it to a screen.
  @:native("new")
  static function new_(names: Array<String>, screen: Dynamic, layout: AnyTable): Void;

  // Add a tag.
  static function add(name: String, props: AnyTable): Void;

  // Increase master width factor.
  static function incmwfact(add: Int, t: Tag): Void;

  // Find a suitable fallback tag.
  static function find_fallback(screen: Dynamic, invalids: AnyTable): Void;

  // Increase the spacing between clients
  static function incgap(add: Int, t: Tag): Void;

  // Toggle size fill policy for the master clien(s) between “expand” and “master_width_factor”.
  static function togglemfpol(t: Tag): Void;

  // Increase the number of master windows.
  static function incnmaster(add: Int, t: Tag, ?sensible: Bool = false): Void;

  // Increase number of column windows.
  static function incncol(add: Int, t: Tag, ?sensible: Bool = false): Void;

  // View no tag.
  static function viewnone(screen: Dynamic): Void;

  // View a tag by its taglist index.
  static function viewidx(i: Int, ?screen: Dynamic): Void;

  // View next tag.
  static function viewnext(?screen: Dynamic): Void;

  // View previous tag.
  static function viewprev(?screen: Dynamic): Void;

  // View only a set of tags.
  static function viewmore(tags: Array<Tag>, screen: Dynamic, ?maximum: Int): Void;

  // Toggle selection of a tag
  static function viewtoggle(t: Tag): Void;

  // Add a signal to all attached tags and all tags that will be attached in the future.
  static function attached_connect_signal(screen: Dynamic, signal: String, ?callback: Dynamic): Void;

}
