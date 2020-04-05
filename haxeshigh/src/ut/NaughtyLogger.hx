package ut;

import ex.Inspect;
import ex.Naughty;


@:nullSafety(Strict)
class NaughtyLogger  {
  public static function log(x: Any): Void {
    Naughty.notify({text: Inspect.inspect(x)});
  }
}
