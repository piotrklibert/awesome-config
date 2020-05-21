package brightness;

// TODO: cleanup
import lua.Table;
import haxe.ds.Option;
import haxe.extern.Rest;

import awful.*;
import utils.Common;
import utils.lua.LuaTools;
import utils.lua.Macro as M;
import log.Log;
import brightness.Pkg;
import haxecontracts.*;

using Lambda;
using utils.OptionTools;
using utils.NullTools;
using utils.lua.LuaTools;



enum State {
  InProgress(val: Float);
  Ready(val: Float);
}


@:expose
@:nullSafety(Strict)
class BrightnessWidget implements haxecontracts.HaxeContracts {
  public static final PATH_TO_ICON = "/home/cji/.config/awesome/haxeshigh/res/br-wid-1.png";
  public static final FONT = "mono 12";
  public static final BACKLIGHT_PATH = "/sys/class/backlight/intel_backlight/brightness";

  var state: State;
  var widget: Null<awful.Widget>;

  public function new(){
    state = Ready(get_brightness());
  }

  public function get_brightness() {
    final val = Std.parseInt(StringTools.trim(sys.io.File.getContent(BACKLIGHT_PATH)));
    return Std.int(val.sure() / 19200 * 100);
  }


  public function set_brightness(percent: Float) {
    if (!(percent >= 0 && percent <= 100)) return -1;
    final val = Std.int(percent / 100 * 19200);
    final cmd = 'sudo bash -c "echo ${val} >${BACKLIGHT_PATH}"';
    state = InProgress(percent);
    Spawn.easy_async(cmd, function (_) { state = Ready(get_brightness()); });
    return val;
  }


  public function w() {
    final brightness_text = untyped __call__("wibox.widget.textbox");
    brightness_text.set_font(FONT);
    brightness_text.set_text(' ${get_brightness()}%');

    final icon = M.asTable({
      image: PATH_TO_ICON,
      resize: false,
      widget: untyped __lua__("wibox.widget.imagebox"),
      forced_width: 25
    });

    final brightness_icon = AwfulTools.makeWidget(
      [ icon ].asTable(),
      { top: 5,
        widget: untyped __lua__("wibox.container.margin") }.asTable()
    );
    final t: LuaTable = M.asTable([ brightness_icon, brightness_text ]);
    final widget = AwfulTools.makeWidget(
      t,
      { layout: untyped __lua__("wibox.layout.fixed.horizontal"),
        id: "brightness" }.asTable()
    );

    widget.connect_signal("button::press", function (_, _, _, button) {
        if (Type.enumConstructor(state) == "InProgress")
          return;
        final percent = get_brightness();
        switch (button) {
          case 4:
            brightness_text.set_text(" " + Math.min(percent + 5, 100) + "%");
            set_brightness(Math.min(percent + 5, 100));
          case 5:
            brightness_text.set_text(" " + Math.max(percent - 5, 0) + "%");
            set_brightness(Math.max(percent - 5, 0));
          case _:
            return;
        }
      }
    );
    return widget;
  }
}
