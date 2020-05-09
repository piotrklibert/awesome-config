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



class TaglistRow {
  final tags: Array<String>;
  public function new(tags: Array<String>) { this.tags = tags; }

  public function toLua(s: Screen): LuaTable {
    return makeTaglist(s);
  }

  function makeTaglist(s: Screen): LuaTable {
    // Log.log(Table.fromArray(this.tags));
    final conf = LuaTools.table();
    conf.screen = s;
    conf.filter = this.makeFilterFun();
    final button = awful.Button.make(cast {}, 1, function (x: Dynamic) {
        final sel = Screen.focused().selected_tag;
        Tag.viewtoggle(x);
        Tag.viewtoggle(sel);
      });
    conf.buttons = Table.fromArray([button]);
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


@:expose
@:nullSafety(Strict)
class Taglist {
  public var tagListBox: Option<Wibox> = None;
  var animator: Option<TaglistAnimator> = None;


  public function new() {}


  public function autoHide() {
    this.animator.sure().autoHide(4);
  }

  public function show() {
    this.animator.sure().show();
  }


  static final wiboxConfig: Wibox.WiboxArgs = {
    ontop: true,
    opacity: 0.7,
    x: 1820,
    y: 440,
    height: 115,
    width: 95,
  }


  public function enable() {
    // TODO: refactor (as prop?)
    if ( tagListBox == None) {
       tagListBox = Some(new Wibox(wiboxConfig));
    }
    setup( tagListBox.sure(), mkWidget(Screen.focused()));
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
    final widgetTable = Common.structToTable({
        margins: 15,
        layout: Wibox.container.margin,
    });
    widgetTable[1] = widget;

    final setupTable = Common.structToTable({
      id: "bg",
      border_color: "#919191",
      border_width: 1,
      border_strategy: "inner",
      widget: Wibox.container.background,
    });
    setupTable[1] = widgetTable;

    this.animator = Some(new TaglistAnimator(this));

    wibox.setup(setupTable);
    wibox.connect_signal("mouse::enter", () -> this.animator.sure().show());
    wibox.connect_signal("mouse::leave", () -> this.animator.sure().slide("out"));
    wibox.visible = true;

    return wibox;
  }


  static function mkWidget(s: Screen): Widget {
    final rows = [
      new TaglistRow(["1", "2", "3"]),
      new TaglistRow(["4", "5", "6"]),
      new TaglistRow(["7", "8", "9"]),
    ];

    // final rows = Table.fromArray(rows.map((x) -> x.toLua(s)));

    final ret = {
      id: "grid",
      spacing: 6,
      layout: Wibox.layout.fixed.vertical
    }

    for (row in rows)
      LuaTools.add(ret.asTable(), row.toLua(s));

    return Widget.widget(ret);
  }
}
