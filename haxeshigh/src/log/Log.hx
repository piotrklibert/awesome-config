package log;

import utils.lua.Globals;
import awful.Naughty;
import lib.Inspect;

using utils.NullTools;
using utils.lua.Macro;

// TODO:
enum LogLevel {
  Debug;
  Info;
  Warn;
  Error;
}


abstract Tbl(lua.Table.AnyTable) {
  @:from
  static public inline function fromMap<K, V>(m: haxe.ds.Map<K, V>): Tbl {
    return untyped m.h;
  }
}


// @:expose
@:tink
@:nullSafety(Strict)
class Log {
  static final defaults = {
        fg: "white",
        bg: "#96413F",
        icon: "/home/cji/portless/lua/awesome-config/haxeshigh/bang2.png",
        width: 520,
        position: "bottom_right",
        timeout: 20,
        hover_timeout: 0,
  };

  static function display(s: String, opts: NaughtyOptions = {}) {
    // border_color: "#FF0000", border_width: 4, // doesnt work, why?
    final defs = Reflect.copy(defaults).sure();
    for (f in Reflect.fields(opts))
      Reflect.setField(defs, f, Reflect.field(opts, f));
    Reflect.setField(defs, "text", s);
    Naughty.notify(defs);
  }


  static function formatInfos(i: Null<haxe.PosInfos>): String {
    switch i {
      case null: return "    ERROR: no pos info!\n";
      case i: return lua.Table.concat([
        '    ${i.fileName}:${i.lineNumber}',
        '    ${i.className}.${i.methodName}'
        ].asTable(), "\n");
    }
  }

  public static function log(x: Any, ?infos: haxe.PosInfos): Void {
    switch x {
      case (s : String):
        final infos = formatInfos(infos);
        display('${infos}\n    -----------------------\n\n${s}\n');
      default:
        log(Inspect.inspect(x, {depth: 2}.asTable()), infos);
    }
  }
}
