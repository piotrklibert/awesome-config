package lib;
import lua.Table;


typedef InspectOpts = {
  ?depth: Int,
  ?newline: String,
  ?indent: String
}

@:luaRequire("inspect")
extern class Inspect {
  @:overload(function (x: Any, ?opts: InspectOpts): String {})
  static function inspect(x: Any, ?opts: Table<String, Any>): String;
}
