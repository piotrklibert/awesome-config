package app;
import haxe.ds.Option;
import awful.Timer;
import awful.Wibox;
import lua.Coroutine;
import lua.Table;

using utils.OptionTools;


@:tink
class TaglistAnimator {
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
