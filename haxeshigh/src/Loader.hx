using StringTools;

import lua.Package;
import lua.Lua;

import utils.lua.Globals;
import utils.Common as Utils;


typedef Log = utils.NaughtyLogger;
// typedef Log = utils.FileLogger;


@:expose
class Loader {
  public static function main() {
    Log.log("Loading Taglist...");

    Utils.check_path();

    final mod = Lua.require("app").app;
    Globals.Mgr = mod.TaglistManager;
    Globals.App = Globals.Mgr.enable();

    Log.log("Loaded!");
  }
}
