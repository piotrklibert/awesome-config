package taglist;

import pkg.PackageBase;

import utils.Common;
import utils.lua.Globals;
import taglist.Taglist.TaglistManager;



@:expose
class Pkg extends PackageBase implements PackageDefinition {
  public final name = "taglist";

  // for easier access from Lua side
  public static function instance() return new Pkg();

  public function start() {}
  public function stop() {}

  public function load() {
    try {
      // The `Globals.App` reference is used in awesome-config/tags.moon when
      // assigning keyboard shortcuts, to show/hide the widget after desktop
      // change.
      final app = Globals.App = TaglistManager.enable();
      app.autoHide(4);
    }
    catch(ex: Dynamic) {
      Log.log("Error loading taglist module: " + Std.string(ex));
    }
  }

  public function unload() {
    TaglistManager.disable();
    Globals.App = null;
  }
}