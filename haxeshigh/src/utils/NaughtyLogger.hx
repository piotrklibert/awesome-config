package utils;

import lib.Inspect;
import awful.Naughty;


@:nullSafety(Strict)
class NaughtyLogger  {
  public static function raw(x: Any): Void {
    Naughty.notify({text: Std.string(x)});
  }
  public static function log(x: Any): Void {
    Naughty.notify({text: Inspect.inspect(x)});
  }
}
