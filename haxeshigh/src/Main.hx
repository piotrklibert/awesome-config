using StringTools;

import lua.Package;

typedef Log = utils.NaughtyLogger;

class Main {
  public static function main() {
    Package.loaded.loader = null;
    Package.loaded.app = null;

    if ( !Package.path.contains("haxeshigh/build") ) {
      Package.path = "/home/cji/portless/lua/awesome-config/haxeshigh/build/?.lua;" + Package.path;
    }

    Log.log("Loaded.");
  }
}
