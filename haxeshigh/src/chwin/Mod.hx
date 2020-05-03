package chwin;


typedef Log = utils.NaughtyLogger;

import utils.Module.Module;


@:expose
class Mod extends Module {
  public static override function stop() {
    Log.log("chwin stopping!");
  }

  public static override function start() {
    Log.log("chwin started!");
  }
}
