package utils;

import lib.Inspect;


@:nullSafety(Strict)
class FileLogger  {
  static final path = "/home/cji/portless/lua/awesome-config/haxeshigh/logs/std.log";

  public static function log(obj: Any): Void {
    final file = sys.io.File.append(path);
    file.writeString(Inspect.inspect(obj) + "\n\n");
    file.close();
  }
}
