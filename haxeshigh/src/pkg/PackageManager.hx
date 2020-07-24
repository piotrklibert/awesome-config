package pkg;

import lua.Lua;
import lua.Package;
import sys.io.File;

import lib.Globals;
import pkg.PackageBase.PackageDefinition;
import utils.Common;
import log.Log;

using Lambda;
using StringTools;
using Safety;


#if pkg
@:keep
#end
@:nullSafety(Strict)
class PackageManager {
  private function new() {}

  public final argFilePath =
    "/home/cji/portless/lua/awesome-config/haxeshigh/tmp/loading";

  public final packages: Array<PackageDefinition> = [];
  public final widgetCache: Map<String, awful.Widget> = [];

  public function reload(mod: String, ?hard: Bool = true) {
    this.unload(mod, hard);
    this.load(mod, hard);
  }


  public function clear() {
    this.packages.resize(0);
  }

  function findByName(name: String): Null<PackageDefinition> {
    return this.packages.find(o -> (o.name == name));
  }

  public final function load(name: String, require: Bool = false): Bool {
    final pkg = findByName(name);
    switch [pkg, require] {
      case [null, false]:
        Log.log('ERROR: ${name} not found!');
        return false;
      case [null, true]:
        // try to read/require the package, then try loading it again
        this.requirePkg(name);
        return this.load(name, false);
      case [pkg, _]:
        pkg.load();
        return true;
    }
  }


  public final function unload(name: String, remove: Bool = false) {
    final pkg = findByName(name);
    switch [pkg, remove] {
      case [null, _]:
        Log.log('ERROR: "${name}" not found!');
        return false;
      case [pkg, remove]:
        if (remove) this.remove(pkg);
        pkg.unload();
        return true;
    }
  }


  public function requirePkg(pkgName: String) {
    final mod = Reflect.field(Lua.require("hx_" + pkgName), pkgName);
    untyped {
      this.add(mod.Pkg["instance"]());
    }
  }


  private function remove(pkg: PackageDefinition) {
    // Unload the module so that next `require` will reload it from disk.
    this.packages.remove(pkg);
    // TODO: get rid of `untyped`
    @:nullSafety(Off)
    untyped Package.loaded['hx_${pkg.name}'] = null;
  }


  private function add(pkg: PackageDefinition) {
    final name = pkg.name;
    if (findByName(name) == null) {
      this.packages.push(pkg);
    }
    else {
      Log.log('PackageManager: package "${name}" already exists.');
    }
  }

  // Creates an instance of PackageManager and installs it in the global
  // namespace under PackageManager name. Copies the loaded `packages` array
  // from previously installed instance if one is found. This function is run on
  // `make pkg`, but not on `./bin/build pkg`.
  public static function main() {
    Common.check_path();
    switch Globals.PackageManager {
      case null:
        Log.info("No previous PackageManager found, creating new instance...");
        Globals.PackageManager = new PackageManager();
      case prev:
        Log.info("PKGMAN: Found previous PackageManager instance, updating...");
        final mgr = new PackageManager();
        prev.packages.iter(mgr.packages.push);
        for (k => v in prev.widgetCache)
          mgr.widgetCache[k] = v;
        Globals.PackageManager = mgr;
    }
    final mgr = Globals.PackageManager.sure();
    final len = mgr.packages.length;
    Log.info('PKGMAN: Loaded! We have ${len} packages.');
  }
}
