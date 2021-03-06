package init;

import log.Log;
import pkg.PackageBase;
import utils.lua.Macro as M;

using Safety;

import init.Transcript;


@:expose
@:nullSafety(Strict)
class Pkg extends PackageBase implements PackageDefinition {
  @:keep static function main() {}
  public final name = "init";
  public static final ver = M.timestamp();
  public static function instance() return new Pkg();

  static var widget: Null<awful.Wibox>;

  public function start() {
    if (widget == null) widget = init.Transcript.get_wibox();
    widget.visible = true;
  }

  public function stop() {
    if (widget != null) widget.visible = false;
  }

  public function unload() {
    this.stop();
    widget = null;
    Log.info('INIT($ver): unload!');
  }

  public function load() {
    Log.info('INIT($ver) loaded!!!');
  }
}
