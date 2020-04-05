package app;

import ex.Screen;
import ex.Timer;
import ex.Widget;
import lua.Coroutine;
import lua.Table;
import haxe.ds.Option;
import haxe.ds.StringMap;
import haxe.extern.EitherType;
import ut.Utils;

using ut.OptionTools;

typedef Log = ut.FileLogger;



@:luaRequire("wibox")
extern class Wibox implements Dynamic {
  public function new(tbl: AnyTable);
  public static var layout: {fixed: Dynamic};
  public static var container: Dynamic;
  public static function widget(table: AnyTable): Widget;
}





@:nullSafety(Strict)
@:expose
class Taglist {
  // TODO: get rid of the aliases below
  public static final copy = (obj: Dynamic) -> Utils.structToTable(obj);
  public static final mkLua: () -> Dynamic = () -> Utils.mkLua();

  public static final slideConf = mkConf();
  public static final timers = new Timers();
  public static var my_wibox: Option<Wibox> = None;


  public static function enable() {
    initWibox();
    setup(my_wibox.sure(), mkWidget(Screen.focused()));
  }


  private static function initWibox() {
    Log.log("Initializing");
    if (my_wibox == None) my_wibox = Some(mkWiboxContainer());
  }

  public static function setup(wibox: Wibox, widget: Widget): Wibox {
    Log.log("Setup");
    final widgetTable: AnyTable = mkLua();
    widgetTable[1] = widget;
    widgetTable.margins = 15;
    widgetTable.layout = Wibox.container.margin;

    final setupTable: AnyTable = mkLua();
    setupTable.id = "bg";
    setupTable.border_color = "#919191";
    setupTable.border_width = 1;
    setupTable.border_strategy = "inner";
    setupTable.widget = Wibox.container.background;
    setupTable[1] = widgetTable;

    // Log.log(setupTable);
    wibox.setup(setupTable);
    wibox.connect_signal("mouse::enter", () -> slide("in"));
    wibox.connect_signal("mouse::leave", () -> slide("out"));
    wibox.visible = true;

    return wibox;
  }


  public static function mkWiboxContainer(): Wibox {
    Log.log("mkWiboxContainer");
    final wb: Wibox = untyped Wibox(__lua__("{ontop = true}"));
    wb.opacity = 0.7;
    wb.x = 1820;
    wb.y = 440;
    wb.height = 115;
    wb.width = 95;
    return wb;
  }


  private static function mkWidget(s: Screen): Widget {
    Log.log("mkWidget");
    inline function makeTaglist(screen: Screen, filter: Dynamic): AnyTable untyped {
      final tbl = Table.create();
      tbl.screen = screen;
      tbl.filter = filter;
      return tbl;
    }
    inline function tl(x) return untyped Widget["taglist"](x);
    final keyFunc = (x) -> x.name;
    final ret: AnyTable = mkLua();

    ret[1] = tl(makeTaglist(s, Utils.filterIn([1, 2, 3], keyFunc)));
    ret[2] = tl(makeTaglist(s, Utils.filterIn([4, 5, 6], keyFunc)));
    ret[3] = tl(makeTaglist(s, Utils.filterIn([7, 8, 9], keyFunc)));

    ret.spacing = 6;
    ret.id = "grid";
    ret.layout = Wibox.layout.fixed.vertical;
    // ret.buttons = taglist_buttons;

    return Wibox.widget(ret);
  }

  private static inline function mkConf(): AnyTable {
    final obj: AnyTable = mkLua();
    final init = 1820;
    untyped {
      obj.init = init;
      obj.last = init + 75;
      obj.step_time = 0.05;
    }
    return obj;
  }


  public static function show() {
    if (timers.slide_timer != None) {
      timers.slide_timer.sure().stop();
    }
    final geom = mkLua();
    geom.x = slideConf.init;
    my_wibox.sure().geometry(geom);
  }


  public static function slideOut(timer: Timer) {
    final s = copy(slideConf);
    try {
      final init: Int = my_wibox.sure().geometry().x;
      var x = init;
      while (x < s.last) {
        Log.log("in slideout2");
        my_wibox.sure().geometry({x: x});
        Log.log("in slideout3");
        Coroutine.yield();
        x += 2;
      }
      timer.stop();
    }
    catch (ex: Dynamic) {
      Log.log("MASAKRAAAA!");
      Log.log(ex);
      return;
    }

  }


  public static function slideIn(timer: Timer) {
    Log.log("in slidein");
    final s = copy(slideConf);
    final last: Int = my_wibox.sure().geometry().x;
    var x = last;
    while (x >= s.init) {
      Log.log("in slidein");
      my_wibox.sure().geometry({x: x});
      Coroutine.yield();
      x -= 2;
    }
    timer.stop();
  }


  @:nullSafety(Off)
  public static var generator: (Timer) -> Void;

  public static function slide(arg: String) {
    Log.log("1");
    if (timers.slide_timer != None) {
      timers.slide_timer.sure().stop();
      timers.slide_timer = None;
    }
    Log.log("2");
    generator = if (arg == "in") {
      Coroutine.wrap(slideIn);
    }
    else {
      Coroutine.wrap(slideOut);
    }
    Log.log("3");
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
  public var blink_timer: Option<Timer> = None;
  public function new() {}
}
