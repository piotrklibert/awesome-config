package brightness;

import pkg.PackageBase;
import utils.Common;
import utils.lua.Globals;

typedef Log = utils.NaughtyLogger;



@:expose
class Pkg extends PackageBase implements PackageDefinition {
  public final name = "brightness";
  public static function instance() return new Pkg();

  public function start() {}
  public function stop() {}

  public function unload() {
    Log.log("brightness unload!");
  }

  public function load() {
    Log.log("brightness started!");
    // mod = new brightness.BrightnessWidget.Brightness();
    Log.log("afasadsf");
  }
}
