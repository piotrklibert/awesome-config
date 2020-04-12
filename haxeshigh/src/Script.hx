import lua.Package;
using StringTools;

class Script {
  public static function check_path() {
      if ( !Package.path.contains("haxeshigh/build") ) {
      Package.path = "/home/cji/portless/lua/awesome-config/haxeshigh/build/?.lua;" + Package.path;
    }
  }
}
