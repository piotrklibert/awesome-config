package ex;

import lua.Lua;
import lua.Table;
import lua.Io;
import lua.NativeIterator;

import ex.Naughty;
import ex.Inspect;
import ex.Spawn;

import ut.Utils as U;
import haxe.extern.Rest;
import tink.core.Callback;
// typedef Callback<V> = V -> Void;

typedef TimerArgs = {
  var ?timeout: Int;
  var ?autostart: Bool;
  var ?call_now: Bool;
  var ?callback: Callback<Void>;
  var ?single_shot: Bool;
}

@:luaRequire("gears.timer")
extern class Timer {
  static function start_new(timeout: Int, callback: Callback<Void>): Timer;
  static function weak_start_new(timeout: Int, callback: Callback<Void>): Timer;
  static function delayed_call(callback: Callback<Void>, args: Rest<Dynamic>): Void;

  function new(args: TimerArgs);

  function start(): Void;
  function stop(): Void;
  function again(): Void;

  inline static function callAfter(n: Int, c: Callback<Void>): Timer {
    return new Timer({
        timeout: n, callback: c,
        autostart: true,
        single_shot: true
      });
  }

  inline static function callInterval(n: Int, c: Callback<Void>): Timer {
    return new Timer({
        timeout: n, callback: c,
        autostart: true,
        single_shot: false
      });
  }
}
