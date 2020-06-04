package battery;

import utils.lua.Macro;
import awful.Wibox;

using Safety;


@:expose
@:nullSafety(Strict)
class Battery extends utils.WidgetPreview {
  public function new() {
    final pbar = Macro.widget({
      max_value: 1,
      value: 0.75,
      color: "#AECF96",
      forced_height: 10,
      forced_width: 100,
      shape: awful.gears.Tools.GShape.rounded_bar,
      border_width: 2,
      border_color: "#AECF96",
      widget: Wibox.widget.progressbar,
    });
    // trace(lib.Inspect.inspect(pbar));
    final batwidget = Macro.widget({
      layout: Wibox.layout.align.horizontal,
      forced_height: 30,
      children: [
        {forced_width: 40, widget: Wibox.container.background},
        {widget: Wibox.layout.fixed.vertical, children: [
          {forced_height: 50, widget: Wibox.container.background},
          pbar,
        ]},
        {forced_width: 40, widget: Wibox.container.background},
      ],
    });
    super(batwidget);
  }
}
