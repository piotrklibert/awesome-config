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

  public static var battery: Null<battery.Battery>;

  public function start() {
    if (battery == null) battery = new battery.Battery();
    // battery.visible = true;
  }

  public function stop() {
    if (battery != null) {
      battery.destroy();
      battery = null;
    }
  }

  public function unload() {
    this.stop();
    Log.info('Battery($ver): unload!');
  }


  public function load() {
    Log.info('Battery($ver) loaded');
  }


  @:keep public static function main() {}
}
