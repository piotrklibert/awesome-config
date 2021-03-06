package taglist;

import pkg.PackageBase;

import utils.Common;
import lib.Globals;
import taglist.Taglist.TaglistManager;
import log.Log;

using utils.lua.Macro;

@:expose
@:keep
class Pkg extends PackageBase implements PackageDefinition {
  @:keep static function main() {}
  public final name = "taglist";
  public static final ver = Macro.timestamp();

  // for easier access from Lua side - to fix later
  public static function instance() return new Pkg();

  public function start() {}
  public function stop() {}

  public function load() {
    try {
      // The `Globals.Taglist` reference is used in awesome-config/tags.moon
      // when assigning keyboard shortcuts, to show/hide the widget after
      // desktop change.
      final app = Globals.Taglist = TaglistManager.enable();
      app.autoHide(4);
    }
    catch(ex: Dynamic) {
      Log.log("Error loading taglist module: " + Std.string(ex));
    }
  }

  public function unload() {
    TaglistManager.disable();
    Globals.Taglist = null;
  }
}
