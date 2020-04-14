package utils;

import lib.Inspect;
import awful.Naughty;


@:nullSafety(Strict)
class NaughtyLogger  {
  public static function raw(x: Any) {
    Naughty.notify({text: Std.string(x)});
  }
  public static function log(x: Any) {
    Naughty.notify({text: Inspect.inspect(x)});
  }
}
