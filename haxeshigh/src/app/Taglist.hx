package app;

import lua.Table;
import haxe.ds.Option;

import awful.*;
import utils.Common;
import utils.lua.LuaTools;

using Lambda;
using utils.OptionTools;


typedef Log = utils.FileLogger;


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
  public var my_wibox: Option<Wibox> = None;
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
    if (my_wibox == None) {
      my_wibox = Some(new Wibox(wiboxConfig));
    }
    setup(my_wibox.sure(), mkWidget(Screen.focused()));
    return this;
  }

  public function disable() {
    this.animator = None;
    final wb = my_wibox.sure();
    wb.visible = false;
    my_wibox = None;
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
    wibox.connect_signal("mouse::enter", () -> this.animator.sure().slide("in"));
    wibox.connect_signal("mouse::leave", () -> this.animator.sure().slide("out"));
    wibox.visible = true;

    return wibox;
  }


  static function mkWidget(s: Screen): Widget {
    final ret = Table.fromDynamic({
      id: "grid", spacing: 6,
      layout: Wibox.layout.fixed.vertical
    });

    final rows = [
      new TaglistRow(["1", "2", "3"]),
      new TaglistRow(["4", "5", "6"]),
      new TaglistRow(["7", "8", "9"]),
    ];

    for (row in rows)
      Table.insert(ret, row.toLua(s));

    return Widget.widget(ret);
  }
}
