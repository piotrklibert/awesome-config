package awful;


import Utils;
import haxe.extern.Rest;



@:luaRequire("client")
extern class Client {
  static function next(i: Int, ?sel: Client, ?stacked: Bool = false): Client;
  static function cycle(clockwise, s, ?stacked: Bool = false): Client;
  static function getmarked(): Client;
  static function restore(s);
  static function iterate(filter, start, s);

  // static function swap.bydirection (dir[, c=focused, ?stacked: Bool = false);
  // static function swap.global_bydirection (dir[, sel]);
  // static function swap.byidx (i[, c]);
  // static function property.persist (prop, kind);
  // static function focus.history.disable_tracking ();
  // static function focus.history.enable_tracking ();
  // static function focus.history.is_enabled ();
}
