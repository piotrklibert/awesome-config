package taglist;

import lua.Table;
import haxe.ds.Option;
import haxe.extern.Rest;

import awful.*;
import utils.Common;
import utils.lua.LuaTools;

using Lambda;
using utils.OptionTools;
using utils.lua.LuaTools;
using StringTools;

import lua.Package;
import utils.lua.Globals;
import taglist.Taglist.TaglistManager;

import pkg.PackageBase;


@:expose
class Pkg extends PackageBase implements PackageDefinition {
  public final name = "taglist";

  public static function instance()
    return new Pkg();

  public var app: Null<taglist.Taglist> = null;

  public function load() {
    try {
      this.app = TaglistManager.enable();
    }
    catch(ex: Dynamic) {
      Log.log("Error loading taglist module: " + Std.string(ex));
    }
  }

  public function start() {}
  public function stop() {}

  public function unload() {
    TaglistManager.disable();
    this.app = null;
    untyped {
      // Globals.Mgr.disable();
      Globals.App = null;
      Globals.Mgr = null;
      Globals.TaglistModule = null;
    }
  }
}
