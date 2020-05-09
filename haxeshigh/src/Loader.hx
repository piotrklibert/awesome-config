using StringTools;

import lua.Package;
import lua.Lua;

import pkg.PackageBase;
import utils.Common;
import utils.lua.Globals;
import log.Log;



@:expose
class Loader {
  public static function main() {
    Common.check_path();
    final cmd = new PackageCommand();
    final pkg = cmd.getPackage();
    try {
      Log.log('Loader: loading package "${pkg}"...');
      cmd.PackageManager.load(pkg, true);
      Log.log('Loader: loading package "${pkg}" finished!');
    }

    catch(ex: String) {
      Log.log('Loader: error loading package "${pkg}"!');
      Log.log(ex);
    }
  }
}
