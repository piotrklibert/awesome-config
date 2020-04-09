package utils;

import lib.Inspect;
import awful.Naughty;


@:nullSafety(Strict)
class NaughtyLogger  {
  public static function log(x: Any): Void {
    Naughty.notify({text: Inspect.inspect(x)});
  }
}
