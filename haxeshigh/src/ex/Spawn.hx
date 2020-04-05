package ex;
import lua.Lua;
import lua.Table;
import haxe.ds.Either;
import haxe.Constraints;


typedef SpawnResult = Either<Int, String>;

@:luaDotMethod
typedef SpawnLineCallbacks = {
  var ?stdout: (String) -> Void;
  var ?stderr: (String) -> Void;
  var ?output_done: () -> Void;
  var ?exit: (Int) -> Void;
}

@:luaRequire("awful.spawn")
extern class Spawn {
  // Spawn a program, and optionally apply properties and/or run a callback.
  static function spawn(cmd: String, ?sn_rules: Bool = true, callback: Function): SpawnResult;

  // Spawn a program using the shell.
  static function with_shell(cmd: String): Void;

  // Spawn a program and asynchronously capture its output line by line.
  static function with_line_callback(cmd: String, callbacks: AnyTable): SpawnResult;

  // Asynchronously spawn a program and capture its output.
  static function easy_async(cmd: String, callback: (Dynamic) -> Void): SpawnResult;

  // Call spawn.easy_async with a shell.
  static function easy_async_with_shell(cmd: String, callback: (Dynamic) -> Void): SpawnResult;

  // Read lines from a Gio input stream
  static function read_lines(input_stream: Dynamic, line_callback: Function, done_callback: Function, ?close: Bool = false): Void;

  // Spawn a command if it has not been spawned before.
  static function once(cmd: String, rules: AnyTable, ?matcher: Function, ?unique_id: String, ?callback: Function): Void;

  // Spawn a command if an instance is not already running.
  static function single_instance(cmd: String, rules: AnyTable, ?matcher: Function, ?unique_id: String, ?callback: Function): Void;

  // Raise a client if it exists or spawn a new one then raise it.
  static function raise_or_spawn(cmd: String, rules: AnyTable, ?matcher: Function, ?unique_id: String, ?callback: Function): AnyTable;
}
