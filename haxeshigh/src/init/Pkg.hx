package init;

import log.Log;
import pkg.PackageBase;
import utils.lua.Macro as M;

using utils.NullTools;

import init.Transcript;


@:expose
@:nullSafety(Strict)
class Pkg extends PackageBase implements PackageDefinition {
  public final name = "init";
  public static final ver = M.timestamp();
  public static function instance() return new Pkg();

  // public var widget: Null<> = null;

  public function start() {
  }

  public function stop() {
  }

  public function unload() {
    Log.info('INIT($ver): unload!');
  }

  public function load() {
    Log.info('INIT($ver) loaded!!!');
  }
}
