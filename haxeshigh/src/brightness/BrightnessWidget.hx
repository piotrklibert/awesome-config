package brightness;

import awful.Wibox;
import awful.Widget;
import awful.Spawn;
import utils.lua.Macro;
import lib.Globals;

import log.Log;

using Safety;


enum State {
  InProgress(val: Float);
  Ready(val: Float);
}


@:expose
@:nullSafety(Strict)
class BrightnessWidget {
  public static final PATH_TO_ICON = "/home/cji/.config/awesome/haxeshigh/res/br-wid-1.png";
  public static final FONT = "mono 12";
  public static final BACKLIGHT_PATH = "/sys/class/backlight/intel_backlight/brightness";

  var state: State;
  var brightnessWidget: Null<awful.Widget>;
  var widget: Null<awful.Widget>;


  public function new() {
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

  // TODO: refactor, handle errors better, fix package definition after
  public function w() {
    final brightness_text = Macro.widget({
      widget: Wibox.widget.textbox,
      font: FONT,
      text: ' ${get_brightness()}%'
    });
    this.brightnessWidget = Macro.widget({
      layout: Wibox.layout.fixed.horizontal,
      children: [
        {
          widget: Wibox.container.margin,
          top: 5,
          children: [{
            widget: Wibox.widget.imagebox,
            image: PATH_TO_ICON,
            resize: false,
            forced_width: 25
          }]
        },
        brightness_text,
      ]
    });
    try {
      // TODO: how to wrap the widget with 'widget' base class, instead of container?
      this.widget = Macro.widget({
        id: "brightness",
        widget: Wibox.container.margin,
        children: [this.brightnessWidget]
      });
    }
    catch (e: Any) {
      this.widget = this.brightnessWidget;
      Log.log("not ok! " + Std.string(e));
    }
    this.connect_signals(brightness_text);
    return this.widget;
  }

  function connect_signals(brightness_text: Widget) {
    this.widget.sure().connect_signal("button::press", function (_, _, _, button) {
      if (Type.enumConstructor(state) == "InProgress") return;
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
    });
  }
}
