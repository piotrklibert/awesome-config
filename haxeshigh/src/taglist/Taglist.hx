package taglist;

import lua.Table;
import haxe.ds.Option;
import haxe.extern.Rest;

import awful.*;
import utils.Common;
import utils.lua.LuaTools;
import taglist.Pkg;
import log.Log;

using Lambda;
using utils.OptionTools;
using utils.lua.LuaTools;
import utils.lua.Macro as M;
import taglist.Switcher;

@:expose
@:nullSafety(Strict)
class TaglistManager {
  static var taglist: Option<Taglist> = None;

  public static function enable(): Taglist {
    switch taglist {
      case None:
        taglist = Some((new Taglist()).enable());
      case Some(tl):
        taglist = Some(tl.enable());
    }
    return taglist.sure();
  }

  public static function disable() {
    switch taglist {
      case None:
        throw "TaglistManager: Tried to call .disable(), but .enable() was not called before";
      case Some(tl): {
          tl.disable();
          taglist = None;
        }
    }
  }
}


class TaglistRow {
  final tags: Array<String>;
  public function new(tags: Array<String>) { this.tags = tags; }

  public function toLua(s: Screen): LuaTable {
    return makeTaglist(s);
  }

  function makeTaglist(s: Screen): LuaTable {
    final button = awful.Button.make(cast {}, 1, function (x: Dynamic) {
      trace("asdasda");
      final sel = Screen.focused().selected_tag;
      Tag.viewtoggle(x);
      Tag.viewtoggle(sel);
    });
    final conf = M.castTable({
      screen: s,
      filter: this.makeFilterFun(),
      buttons: M.castTable([button])
      });
    return Widget.taglist(conf);
  }


  function makeFilterFun() {
    return function (tag: tink.core.Named<Any>) {
      return this.tags.has(tag.name);
    }
  }
}


@:expose
@:nullSafety(Strict)
class Taglist {
  public var tagListBox: Option<Wibox> = None;
  var animator: Option<TaglistAnimator> = None;
  public static function __init__() {
    untyped __lua__("_G.Switcher = {0}", Switcher);
  }
  public function new() {}

  public function autoHide() this.animator.sure().autoHide(4);
  public function show() this.animator.sure().show();

  static final wiboxConfig: Wibox.WiboxArgs = {
    x: 1820, y: 240, height: 115, width: 95,
    ontop: true, opacity: 0.7,
  }

  public function enable() {
    if (tagListBox == None) {
       tagListBox = Some(new Wibox(wiboxConfig));
    }
    setup(tagListBox.sure(), mkWidget(Screen.focused()));
    return this;
  }

  public function disable() {
    this.animator = None;
    final wb = tagListBox.sure();
    wb.visible = false;
    tagListBox = None;
    return this;
  }

  public function setup(wibox: Wibox, widget: Widget): Wibox {
    final widgetTable = M.withProps([widget], {
      margins: 15,
      layout: Wibox.container.margin,
    });

    final setupTable = M.withProps([widgetTable], {
      id: "bg",
      border_color: "#919191",
      border_width: 1,
      border_strategy: "inner",
      widget: Wibox.container.background,
      });

    this.animator = Some(new TaglistAnimatorImpl(this));

    wibox.setup(setupTable);
    wibox.connect_signal("mouse::enter", () -> this.animator.sure().show());
    wibox.connect_signal("mouse::leave", () -> this.animator.sure().slide("out"));
    wibox.visible = true;

    return wibox;
  }

  static function mkWidget(s: Screen): Widget {
    final rows = [
      new TaglistRow(["7", "8", "9"]),
      new TaglistRow(["4", "5", "6"]),
      new TaglistRow(["1", "2", "3"]),
    ];

    final ret = M.castTable({
      id: "grid",
      spacing: 6,
      layout: Wibox.layout.fixed.vertical
    });

    for (row in rows)
      Table.insert(cast ret, row.toLua(s));

    return Widget.widget(ret);
  }
}
