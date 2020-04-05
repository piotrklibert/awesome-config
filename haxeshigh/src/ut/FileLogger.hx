package ut;

import ex.Inspect;


@:nullSafety(Strict)
class FileLogger  {
  static final path = "/home/cji/portless/lua/awesome-config/haxeshigh/finished";
  static final template = new haxe.Template("-- ::obj::\n---\n");

  public static function log(obj: Any): Void {
    final file = sys.io.File.append(path);
    file.writeString(template.execute({ obj: Inspect.inspect(obj) }));
    file.close();
  }
}
