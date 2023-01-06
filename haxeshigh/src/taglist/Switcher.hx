package taglist;

import taglist.TaglistAnimator;

import lib.Globals;

import externs.Screen;
import externs.Tag;

using Safety;
using utils.OptionTools;


/** Tags are visually aligned like this (with wrap-around on all sides):
 *
 * ["7", "8", "9"]
 * ["4", "5", "6"]
 * ["1", "2", "3"]
 *
 * but tag-switching functions see them as a single linear list:
 *
 * ['1', '2', '3', '4', '5', '6', '7', '8', '9']
 *
 * Tag.viewidx takes a relative offset and activates the tag it finds after
 * moving in the list above by a given distance.
 */
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
        if ([1, 4, 7].contains(currentTagNumber()))
            move(2);
        else
            move(-1);
    }

    public static function tag_right() {
        if ([3, 6, 9].contains(currentTagNumber()))
            move(-2);
        else
            move(1);
    }

    private static function move(offset: Int) {
        final animator: TaglistAnimator = OptionTools.sure(Globals.Taglist.animator);
        animator.show();
        Tag.viewidx(offset);
        animator.autoHide(4);
    }

    private static extern inline function currentTagNumber()
        return Std.parseInt(Screen.focused().selected_tag.name).sure();
}
