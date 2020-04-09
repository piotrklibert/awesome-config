package app;

import lua.Coroutine;
import lua.Table;

import haxe.ds.Option;

import awful.*;
import utils.Common;
import utils.lua.Common;

using utils.OptionTools;


typedef Log = utils.FileLogger;

class WidgetDesc {
  public final widgets: Array<Any>;
  public final options: {};
  public function new(widgets: Array<Any>, options: {}) {
    this.widgets = widgets;
    this.options = options;
  }
}

@:nullSafety(Strict)
@:expose
class Taglist {
  public var my_wibox: Option<Wibox> = None;

  public function new() {

  }

  public function enable() {
    if (my_wibox == None) {
      my_wibox = Some(mkWibox());
    }
    setup(my_wibox.sure(), mkWidget(Screen.focused()));
  }

  public function disable() {
    final wb = my_wibox.sure();
    wb.visible = false;
    my_wibox = None;
  }


  public function setup(wibox: Wibox, widget: Widget): Wibox {
    final widgetTable = Utils.structToTable({
        margins: 15,
        layout: Wibox.container.margin,
      });
    widgetTable[1] = widget;

    final setupTable = Utils.structToTable({
      id: "bg",
      border_color: "#919191",
      border_width: 1,
      border_strategy: "inner",
      widget: Wibox.container.background,
      });
    setupTable[1] = widgetTable;

    final anim = new TaglistAnimation(this);
    wibox.setup(setupTable);
    wibox.connect_signal("mouse::enter", () -> anim.slide("in"));
    wibox.connect_signal("mouse::leave", () -> anim.slide("out"));
    wibox.visible = true;

    return wibox;
  }

  static final wibox_config = {
    ontop: true,
    opacity: 0.7,
    x: 1820,
    y: 440,
    height: 115,
    width: 95,
  }

  public static function mkWibox(): Wibox {
    return new Wibox(wibox_config);
  }

  private static function mkWidget(s: Screen): Widget {
    final _filter = Utils.filterIn.bind(_, (x) -> x.name);
    final ret: LuaTable = cast Table.fromArray([
        Widget.taglist({screen: s, filter: _filter(["1", "2", "3"])}),
        Widget.taglist({screen: s, filter: _filter(["4", "5", "6"])}),
        Widget.taglist({screen: s, filter: _filter(["7", "8", "9"])}),
      ]);
    ret.spacing = 6;
    ret.id = "grid";
    ret.layout = Wibox.layout.fixed.vertical;
    // ret.buttons = taglist_buttons;

    return Widget.widget(ret);
  }
}

@:tink
class TaglistAnimation {
  @:nullSafety(Off)
  public var generator: (Timer) -> Void;
  public final my_wibox: Wibox;

  public function new(t: Taglist) {
    switch (t.my_wibox) {
      case Some(wb): my_wibox = wb;
      case None: throw "Cannot animate nonexistent widget";
    }
  };

  public final timers = new Timers();


  private static inline function mkConf() {
    final init = 1820;
    return {
      init: init,
      last: init + 75,
      step_time: 0.05
    }
  }
  public static final slideConf = mkConf();

  public function show() {
    if (timers.slide_timer != None) {
      timers.slide_timer.sure().stop();
    }
    my_wibox.geometry({x: slideConf.init});
  }

  public function slideOut(timer: Timer) {
    for (x += 2 in my_wibox.x...slideConf.last) {
      my_wibox.geometry({x: x});
      Coroutine.yield();
    }
    timer.stop();
  }

  public function slideIn(timer: Timer) {
    for (x -= 2 in my_wibox.x...slideConf.init) {
      my_wibox.geometry({x: x});
      Coroutine.yield();
    }
    timer.stop();
  }

  public function slide(arg: String) {
    if (timers.slide_timer != None) {
      timers.slide_timer.sure().stop();
      timers.slide_timer = None;
    }

    generator = Coroutine.wrap(if (arg == "in") slideIn else slideOut);
    timers.slide_timer = Some(
      Timer.callInterval(
        slideConf.step_time,
        function (t) generator(timers.slide_timer.sure())
      )
    );
  }
}


class Timers {
  public var slide_timer: Option<Timer> = None;
  public function new() {}
}
