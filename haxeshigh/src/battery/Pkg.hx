package battery;

import log.Log;
import pkg.PackageBase;
import utils.lua.Macro as M;
import battery.Battery;

using Safety;


@:expose
@:keep
@:nullSafety(Strict)
class Pkg extends PackageBase implements PackageDefinition {
  public final name = "battery";
  public static final ver = M.timestamp();
  public static function instance() return new Pkg();

  static var widget: Null<battery.Battery>;

  public function start() {
    if (widget == null) widget = new battery.Battery();
    // widget.visible = true;
  }

  public function stop() {
    // if (widget != null) widget.visible = false;
  }

  public function unload() {
    // this.stop();
    // widget = null;
    Log.info('Battery($ver): unload!');
  }


  public function load() {
    Log.info('Battery($ver) loaded');
  }


  public static function main() {

  }
}
