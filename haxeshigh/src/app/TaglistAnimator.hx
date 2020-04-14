package app;

import haxe.ds.Option;
import awful.Timer;
import awful.Wibox;
import lua.Coroutine;

using utils.OptionTools;

typedef AnimatorConfig = {
  step_time : Float,
  last : Int,
  init : Int
};


/**
    A class which handles slide in/out animation for Taglist.
**/
@:tink
@:nullSafety(Strict)
class TaglistAnimator {
  public final timers: Timers = new Timers();
  public static final slideConf: AnimatorConfig = mkConf();

  final taglist: Taglist;

  @:nullSafety(Off)
  var my_wibox(get, null): Wibox;
  function get_my_wibox(): Wibox {
    switch (this.taglist.my_wibox) {
      case Some(wb): return wb;
      case None: throw "Cannot animate nonexistent widget";
    }
  }

  public function new(t: Taglist) {
    this.taglist = t;
  };

  @:keep
  public function disable() {
    // this.taglist = null;
  }

  @:keep
  public function autoHide(n: Float) {
    if (timers.hide_timer != None) {
      timers.hide_timer.sure().stop();
      timers.hide_timer = None;
    }
    timers.hide_timer = Some(Timer.callAfter(4, () -> slide("out")));
  }

  static inline function mkConf(): AnimatorConfig {
    final init = 1820;
    return {
      init: init,
      last: init + 75,
      step_time: 0.05
    }
  }

  @:keep
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

    final generator = Coroutine.wrap(if (arg == "in") slideIn else slideOut);
    timers.slide_timer = Some(
      Timer.callInterval(
        slideConf.step_time,
        function (t) generator(timers.slide_timer.sure())
      )
    );
  }
}

/**
    A simple class for holding `awful.Timer`s
**/
class Timers {
  public var slide_timer: Option<Timer> = None;
  public var hide_timer: Option<Timer> = None;
  public function new() {}
}
