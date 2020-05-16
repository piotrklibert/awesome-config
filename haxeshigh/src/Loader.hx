using StringTools;

import lua.Package;
import lua.Lua;

import pkg.PackageBase;
import utils.Common;
import lib.Globals;
import log.Log;



@:expose
class Loader {
  public static function main() {
    Common.check_path();
    final cmd = new PackageCommand();
    final pkg = cmd.getPackage();
    try {
      Log.debug('Loader: loading package "${pkg}"...');
      cmd.PackageManager.load(pkg, true);
      Log.info('Loader: loading package "${pkg}" finished!');
    }

    catch(ex: String) {
      Log.error('Loader: error loading package "${pkg}"!');
      Log.debug(ex);
    }
  }
}
