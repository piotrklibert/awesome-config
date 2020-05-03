using StringTools;

import lua.Package;
import lua.Lua;

import pkg.PackageBase;
import utils.Common;
import utils.lua.Globals;

typedef Log = utils.NaughtyLogger;
// typedef Log = utils.FileLogger;


@:expose
class Cleaner {
  public static function main() {
    final cmd = new PackageCommand();
    final pkg = cmd.getPackage();
    Log.raw('Cleaner: removing package "${pkg}"...');
    try {
      final success = cmd.PackageManager.unload(pkg, true);
      if (!success)
        handleError(pkg);
      else
        Log.raw('Cleaner: package "${pkg}" removed!');
    }
    catch (ex: String) {
      handleError(pkg, ex);
    }
  }

  private static function handleError(pkg: String, ex: String = "") {
    Log.raw('Cleaner: removing package "${pkg}" failed!');
    if (ex.length > 0)
      Log.raw("Exception data:\n" + Common.formatSimpleEx(ex));
  }
}
