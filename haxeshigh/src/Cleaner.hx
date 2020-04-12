using StringTools;

import lua.Package;
import utils.lua.Globals;

typedef Log = utils.NaughtyLogger;


@:expose
class Cleaner {
  public static function main() {
    Log.log("Taglist cleanup...");

    try {
      Log.log(Globals.Mgr);
      // untyped Globals.Mgr["disable"]();
      Globals.Mgr.disable();
      Globals.App = null;
      Globals.Mgr = null;
    }
    catch (ex: Any) {
      Log.raw(ex);
    }


    Package.loaded.app = null;
    Package.loaded.loader = null;

    Log.log("Taglist cleanup OK!");
  }
}
