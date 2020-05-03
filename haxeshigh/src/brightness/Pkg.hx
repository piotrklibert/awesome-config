package brightness;

// import utils.Module.Module;

typedef Log = utils.NaughtyLogger;



@:expose
class Module {
  private static var mod: Any;

  public static function unload() {
    Log.log("brightness unload!");
  }

  public static function load() {
    Log.log("brightness started!");
    // mod = new brightness.BrightnessWidget.Brightness();
    Log.log("afasadsf");
  }
}
