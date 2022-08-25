package taglist;

import awful.Naughty;
import utils.lua.Macro.T;
import utils.lua.Macro.A;
import taglist.TaglistAnimator;
import haxe.ds.Option;
import lib.Globals;

using Safety;
using utils.OptionTools;


@:luaRequire("awful.tag")
extern class Tag {
  public static function viewidx(idx: Int): Void;
  public static function selected(): {name: String};
}


@:keep
@:expose
@:nullSafety(Strict)
class Switcher {
  public static function tag_up() {
    move(3);
  }

  public static function tag_down() {
    move(-3);
  }

  public static function tag_left() {
    if ([1, 4, 7].contains(tagNum()))
      move(2);
    else
      move(-1);
  }

  public static function tag_right() {
    if ([3, 6, 9].contains(tagNum()))
      move(-2);
    else
      move(1);
  }

  private static extern inline function tagNum()
    return Std.parseInt(Tag.selected().name).sure();

  private static function move(dest: Int) {
    final animator: TaglistAnimator = OptionTools.sure(Globals.Taglist.animator);
    animator.show();
    Tag.viewidx(dest);
    animator.autoHide(4);
  }

}
