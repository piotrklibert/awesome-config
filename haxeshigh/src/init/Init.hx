package init;

import lib.Globals;
import lib.Inspect.inspect;
import lib.Globals.s;
import lua.Package;
import lua.Lua;
import lua.Table;
import utils.lua.Macro.withProps;
import utils.lua.Macro.castTable;
import utils.lua.Macro.withArray;
import utils.lua.Macro.T;
import utils.lua.Macro.A;
import utils.lua.Macro.TA;
import utils.lua.Macro.AT;
// import awful.Screen;
// import lib.Globals.gs;

using Safety;
import tink.core.Pair;



@:expose
class Paths {

  public static final path = [
    "/usr/local/share/awesome/lib/?.lua",
    "/usr/local/share/awesome/lib/?/init.lua",
    "/usr/local/share/lua/5.1/?.lua",
    "/usr/local/share/lua/5.1/?/init.lua",
    "/usr/local/share/luajit-2.1.0-beta3/?.lua",

    "./?.lua",
    "/etc/xdg/awesome/?.lua",
    "/etc/xdg/awesome/?/init.lua",
    "/home/cji/.config/awesome/?.lua",
    "/home/cji/.config/awesome/?/init.lua",
    "/home/cji/.config/awesome/widgets/?/?.lua",
    "/home/cji/.config/awesome/widgets/?/init.lua",

    "/home/cji/.luarocks/lib/lua/5.1/?.so",
    "/home/cji/.luarocks/lib/lua/5.1/lgi/?.so",
    "/home/cji/.luarocks/share/lua/5.1/?.lua",
    "/home/cji/.luarocks/share/lua/5.1/?/init.lua",
    "/home/cji/portless/lua/?.lua",
    "/home/cji/portless/lua/?/?.lua",
    "/home/cji/portless/lua/?/init.lua",
    "/home/cji/portless/lua/Microlight/?.lua",
    "/home/cji/portless/lua/Penlight/lua/?/",
    "/home/cji/portless/lua/Penlight/lua/?/init.lua",
    "/home/cji/portless/lua/awesome-config/haxeshigh/output/?.lua",
    "/home/cji/priv/moonscript/awesomescript/?.lua",
    "/home/cji/priv/moonscript/awesomescript/?.lua",
    "/home/cji/priv/moonscript/awesomescript/vendor/?.lua",
    "/home/cji/priv/moonscript/awesomescript/vendor/?/init.lua",
    "/home/cji/priv/moonscript/awesomescript/vendor/readline/?.lua",
  ];

  public static final cpath = [
    "/usr/local/lib/lua/5.1/loadall.so",
    "/home/cji/.config/awesome/?.so",
    "/home/cji/priv/moonscript/awesomescript/vendor/readline/?.so",
    "/usr/local/share/awesome/lib/?.so",
    "/home/cji/.luarocks/lib/lua/5.1/?.so",
    "/etc/xdg/awesome/?.so",
    "./?.so",
    "/usr/local/lib/lua/5.1/?.so",
  ];

  public static function set() {
    Package.path = path.join(";");
    Package.cpath = cpath.join(";");
  }
}

class Z2 {
  public static final a = 2;
}
class Z {
  public static final A = Z2;
}

// @:keep
@:nullSafety(StrictThreaded)
@:expose
class Init {
  static function __init__() {
    untyped {
      Globals.Paths = Paths;
    }
  }

  public static function unique(s: String) {
    final m: Map<String, Any> = [];
    for (p in s.split(";")) m[p] = 1;
    for (p in m.keys()) trace(p);
    final x: Bool = true;
  }

  public static function search(s: String) {
    trace("In path:\n\t" + Package.searchpath(s, Package.path).or("<not found>"));
    trace("In cpath:\n\t" + Package.searchpath(s, Package.cpath).or("<not found>"));
  }

  public static function main() {
    Lua.print(Z.A.a);
    // Paths.set();
    Lua.print();
    unique(Package.path);
    untyped {
       [
         awful.layout.suit.tile,
         awful.layout.suit.floating,
         awful.layout.suit.tile.right,
         awful.layout.suit.tile.left,
         awful.layout.suit.tile.bottom,
         awful.layout.suit.tile.top,
       ];
    }
    unique(Package.cpath);
    search("std.base");
    trace("------");
    search("ml");
    final m = [
      "John" => 26,
      "Peter" => 17,
      "Mark" => 32,
    ];
    if (m != null)
      trace(m);

    // trace(
    //   untyped __lua_table__({a: 3})
    // );
    // untyped __lua__("print({0})", 4);
    // untyped {
    // /   Lua.dofile("/home/cji/priv/moonscript/awesomescript/runtime/init.lua");
    // }
    // trace(Package.searchpath("inspect", Package.path));
    // final tbl : lua.AnyTable = (untyped __lua__("_G"));
    // trace(inspect(Reflect.fields(tbl), {depth: 1}));

    // trace(TA({z: 4}, [1, T({a: 42}), null,  4]));


    // trace(inspect(
    //   AT([
    //     AT([
    //       T({
    //         image: "/home/cji/portless/lua/awesome-config/analytics.png",
    //         resize: true,
    //         widget: "wibox.widget.imagebox",
    //         forced_width: 25
    //       })
    //     ], {
    //       left: 2,
    //       top: 2,
    //       bottom: 2,
    //       right: 2,
    //       widget: "wibox.container.margin"
    //     })
    //   ], {
    //     top: 5,
    //     bottom: 3,
    //     widget: "wibox.container.margin"
    //   })
    // ));



    // trace(taglist.Taglist);
    // final wb: awful.Wibox = untyped Globals.screen[1].mywibox;
    // final kids: Array<awful.Widget> = lua.Table.toArray(wb.get_widget().get_all_children());
    // for (child in kids) {
    //   trace(untyped child.widget_name);
    //   if (untyped child._private.by_id) {
    //     final n: Null<awful.Widget> = untyped child._private.by_id["brightness"];
    //     if (n != null) {
    //       trace(gs(child));
    //       untyped lib.Globals["wd"] = n;
    //     }
    //   }
    // }
  }
}
