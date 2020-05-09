using StringTools;

import lua.Package;
import lua.Lua;

import pkg.PackageBase;
import utils.Common;
import utils.lua.Globals;
import log.Log;


@:expose
class Cleaner {
  public static function main() {
    final cmd = new PackageCommand();
    final pkg = cmd.getPackage();
    Log.log('Cleaner: removing package "${pkg}"...');
    try {
      final success = cmd.PackageManager.unload(pkg, true);
      if (!success)
        handleError(pkg);
      else
        Log.log('Cleaner: package "${pkg}" removed!');
    }
    catch (ex: String) {
      handleError(pkg, ex);
    }
  }

  private static function handleError(pkg: String, ex: String = "") {
    Log.log('Cleaner: removing package "${pkg}" failed!');
    if (ex.length > 0)
      Log.log("Exception data:\n" + Common.formatSimpleEx(ex));
  }
}
