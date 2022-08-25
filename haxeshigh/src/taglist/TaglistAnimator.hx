package taglist;

import awful.Timer;


interface TaglistAnimator {
  // public final timers: Timers;

  public function disable(): Void;
  public function autoHide(n: Float): Void;
  public function show(): Void;
  public function slideOut(timer: Timer): Void;
  public function slideIn(timer: Timer): Void;
  public function slide(arg: String): Void;
}
