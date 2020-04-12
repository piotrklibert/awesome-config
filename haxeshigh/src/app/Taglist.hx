package app;

import lua.Coroutine;
import lua.Table;

import haxe.ds.Option;

import awful.*;
import utils.Common as Utils;   // TODO: remove
import utils.lua.Common;

using utils.OptionTools;


typedef Log = utils.FileLogger;


// TODO:
class WidgetDesc {
  public final widgets: Array<Any>;
  public final options: {};
  public function new(widgets: Array<Any>, options: {}) {
    this.widgets = widgets;
    this.options = options;
  }
}


@:expose
@:nullSafety(Strict)
class TaglistManager {
  static var taglist: Option<Taglist> = None;

  public static function enable() {
    switch taglist {
      case None:
        taglist = Some((new Taglist()).enable());
      case Some(tl):
        taglist = Some(tl.enable());
    }
    return taglist;
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

  public function new() {}

  public function enable() {
    if (my_wibox == None) {
      my_wibox = Some(mkWibox());
    }
    setup(my_wibox.sure(), mkWidget(Screen.focused()));
    return this;
  }

  public function disable() {
    final wb = my_wibox.sure();
    wb.visible = false;
    my_wibox = None;
    return this;
  }


  public function setup(wibox: Wibox, widget: Widget): Wibox {
    final widgetTable = Utils.structToTable({
        margins: 15,
        layout: Wibox.container.margin,
      });
    widgetTable[1] = widget;

    final setupTable = Utils.structToTable({
      id: "bg",
      border_color: "#919191",
      border_width: 1,
      border_strategy: "inner",
      widget: Wibox.container.background,
      });
    setupTable[1] = widgetTable;

    final anim = new TaglistAnimator(this);
    wibox.setup(setupTable);
    wibox.connect_signal("mouse::enter", () -> anim.slide("in"));
    wibox.connect_signal("mouse::leave", () -> anim.slide("out"));
    wibox.visible = true;

    return wibox;
  }

  static final wibox_config = {
    ontop: true,
    opacity: 0.7,
    x: 1820,
    y: 440,
    height: 115,
    width: 95,
  }

  public static function mkWibox(): Wibox {
    return new Wibox(wibox_config);
  }

  private static function mkWidget(s: Screen): Widget {
    Log.log("mkWidget");
    function makeTaglist(screen: Screen, filter: Dynamic): AnyTable untyped {
      final tbl = Utils.mkLua();
      tbl.screen = screen;
      tbl.filter = filter;
      return tbl;
    }
    inline function tl(x) return untyped Widget["taglist"](x);
    final keyFunc = (x) -> x.name;
    final ret: AnyTable = Utils.mkLua();

    ret[1] = tl(makeTaglist(s, Utils.filterIn(["1", "2", "3"], keyFunc)));
    ret[2] = tl(makeTaglist(s, Utils.filterIn(["4", "5", "6"], keyFunc)));
    ret[3] = tl(makeTaglist(s, Utils.filterIn(["7", "8", "9"], keyFunc)));


    // final _filter = Utils.filterIn.bind(_, (x) -> x.name);
    // final ret: LuaTable = cast Table.fromArray([
    //     Widget.taglist({screen: s, filter: _filter(["1", "2", "3"])}),
    //     Widget.taglist({screen: s, filter: _filter(["4", "5", "6"])}),
    //     Widget.taglist({screen: s, filter: _filter(["7", "8", "9"])}),
    //   ]);
    ret.spacing = 6;
    ret.id = "grid";
    ret.layout = Wibox.layout.fixed.vertical;
    // ret.buttons = taglist_buttons;

    return Widget.widget(ret);
  }
}
