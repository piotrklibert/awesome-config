package taglist;

import awful.Naughty;
import utils.lua.Macro.T;
import utils.lua.Macro.A;
import taglist.TaglistAnimator;
import haxe.ds.Option;
import lib.Globals;

import externs.Screen;
import externs.Tag;

using Safety;
using utils.OptionTools;


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
    return Std.parseInt(Screen.focused().selected_tag.name).sure();

    private static function move(dest: Int) {
        final animator: TaglistAnimator = OptionTools.sure(Globals.Taglist.animator);
        animator.show();
        Tag.viewidx(dest);
        animator.autoHide(4);
    }
}
