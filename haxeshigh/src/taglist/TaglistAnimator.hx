package taglist;

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
  var tagListBox(get, null): Wibox;

  function get_tagListBox(): Wibox {
    switch (this.taglist.tagListBox) {
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
      resetTimer(timers.hide_timer.sure());
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
      resetTimer(timers.slide_timer.sure());
    }
    tagListBox.geometry({x: slideConf.init});
  }

  public function slideOut(timer: Timer) {
    for (x += 2 in tagListBox.x...slideConf.last) {
      tagListBox.geometry({x: x});
      Coroutine.yield();
    }
    resetTimer(timer);
  }


  public function slideIn(timer: Timer) {
    for (x -= 2 in tagListBox.x...slideConf.init) {
      tagListBox.geometry({x: x});
      Coroutine.yield();
    }
    resetTimer(timer);
  }
  function resetTimer(timer: Timer) {
    if (timer.started) timer.stop();
  }
  public function slide(arg: String) {
    if (timers.slide_timer != None) {
      resetTimer(timers.slide_timer.sure());
      timers.slide_timer = None;
    }

    final generator = Coroutine.wrap(
      if (arg == "in") slideIn else slideOut
    );
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
