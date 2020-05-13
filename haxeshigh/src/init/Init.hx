package init;
import lua.Table;

class Init {
  static function __init__(){
    untyped __lua__("__init_Init = {fuck = 9}");
  }
  public static function main() {
    // haxe.Log.trace = log.Log.log;
    // final x = {x: 4, f: 44, g: "ggg"};
    // trace(untyped __lua_table__([x, x, x]));
    // trace(untyped __lua_length__(__lua_table__([1, 2, 3])));
    // trace(untyped __call__(""));
    // final z: Dynamic = untyped x.__fields__;
    // for (a in Reflect.fields(z)) { trace(a); }
    // $type(z);
    trace("Init!");
  }
}
