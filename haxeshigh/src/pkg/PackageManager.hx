package pkg;
import sys.io.File;
using StringTools;
using utils.NullTools;

import lua.Package;
import lua.Lua;

import utils.lua.Globals;
import pkg.PackageBase.PackageDefinition;
import utils.Common as Utils;

using Lambda;


typedef Log = utils.NaughtyLogger;



@:expose
@:nullSafety(Strict)
class PackageManager {
  private function new(){}

  public final argFilePath = "/home/cji/portless/lua/awesome-config/haxeshigh/tmp/loading";
  public final packages: Array<PackageDefinition> = [];

  public function clear() {
    this.packages.resize(0);
  }

  public function load(name: String, require: Bool = false): Bool {
    final pkg = this.packages.find(o -> (o.name == name));
    switch pkg {
      case null:
        if (!require) {
          Log.log('PackageManager: Error - ${name} not found');
          return false;
        }
        else {
          this.addPackage(name);
          this.load(name);
        }
      case pkg:
        pkg.load();
    }
    return true;
  }

  public function unload(name: String, remove: Bool = false) {
    final pkg = this.packages.find(o -> (o.name == name));
    switch pkg {
      case null:
        Log.log('[PackageManager] unloading error: package "${name}" not found');
        return false;
      case pkg:
        if (remove) {
          this.packages.remove(pkg);
          // Unload the module so that next `require` will reload it from disk.
          // TODO: get rid of `untyped`
          @:nullSafety(Off)
          untyped Package.loaded['hx_${pkg.name}'] = null;
        }
        pkg.unload();
      }
    return true;
  }

  public function addPackage(pkgName: String) {
    final mod = Reflect.field(Lua.require("hx_" + pkgName), pkgName);
    untyped {
      this.add(mod.Pkg["instance"]());
    }
  }

  private function add(x: PackageDefinition) {
    final name = x.name;
    if (this.packages.find(o -> (o.name == name)) == null) {
      this.packages.push(x);
    }
    else {
      Log.log('PackageManager: package "${name}" already present');
    }
  }

  // Creates an instance of PackageManager and installs it in the global
  // namespace. Copies loaded packages array from previous instance if found.
  public static function main() {
    Utils.check_path();
    switch Globals.PackageManager {
      case null:
        Log.log("PackageManager: no previous manager found, creating new instance.");
        Globals.PackageManager = new PackageManager();
      case prev:
        Log.log("PackageManager: found previous instance, updating.");
        final mgr = new PackageManager();
        prev.packages.iter(mgr.packages.push);
        Globals.PackageManager = mgr;
    }
    final mgr = Globals.PackageManager.sure();
    final len = mgr.packages.length;
    Log.log('PackageManager: loaded; ${len} packages available');
  }
}
