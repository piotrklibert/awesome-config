package ex;
import lua.Table;


@:luaRequire("inspect")
extern class Inspect {
  static function inspect(x: Any): String;
}
