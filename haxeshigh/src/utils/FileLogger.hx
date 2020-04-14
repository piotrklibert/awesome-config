package utils;

import sys.io.File;
import sys.io.FileOutput;

import lib.Inspect;

using utils.NullTools;
using DateTools;


@:nullSafety(Strict)
class FileLogger {
  static final path: String = "/home/cji/portless/lua/awesome-config/haxeshigh/logs/std.log";
  static var outFile: Null<FileOutput> = null;

  public static function raw(obj: Any) {
    log(obj);
  }

  public static function log(obj: Any) {
    if (outFile == null)
      outFile = File.write(path);

    final timestamp = Date.now().format("%F[%T] ");
    final file = outFile.sure();

    file.writeString(timestamp + Inspect.inspect(obj) + "\n");
    file.close();
    outFile = File.append(path);
  }
}
