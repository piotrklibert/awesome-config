package brightness;

import pkg.PackageBase;
import log.Log;
import utils.lua.Macro as M;
import brightness.BrightnessWidget;

using Safety;


@:expose
@:nullSafety(Strict)
class Pkg extends PackageBase implements PackageDefinition {
  @:keep static function main() {}
  public final name = "brightness";
  public static final ver = M.timestamp();
  public static function instance() return new Pkg();

  public var widget: Null<BrightnessWidget> = null;


  public function get_widget() {
    return widget.sure().w();
  }

  public function start() {
    if (this.widget == null)
      this.widget = new BrightnessWidget();
  }

  public function stop() {
    final wb = this.widget.sure();
    // wb.visible = false;
    this.widget = null;
  }

  public function unload() {
    try this.stop() catch (_){}
    Log.info('BRIGHTNESS($ver): unload!');
  }

  public function load() {
    Log.info('BRIGHTNESS($ver) loaded!');
  }
}
