package log;

import awful.Naughty;
import lib.Inspect;

using utils.NullTools;
using utils.lua.LuaTools;


enum LogLevel {
  Debug;
  Info;
  Warn;
  Error;
}


@:tink
@:expose
@:nullSafety(Strict)
class Log {
  static final level = Debug;

  static final defaults = {
    fg: "white",
    bg: "#96413F",
    opacity: 0.85,
    font: "mono 10",
    icon: "/home/cji/portless/lua/awesome-config/haxeshigh/res/bang2.png",
    width: 720,
    position: "bottom_right",
    timeout: 20,
    hover_timeout: 0.2,
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
      case i:
        return lua.Table.concat([
          '    ${i.fileName}:${i.lineNumber}',
          '    ${i.className}.${i.methodName}'
        ].asTable(), "\n");
    }
  }

  public static function debug(x: Any, ?infos: haxe.PosInfos): Void {
    final o = {bg: "green"};
    log(x, o, infos);
  }

  public static function info(x: Any, ?infos: haxe.PosInfos): Void {
    final o = {bg: "blue"};
    log(x, o, infos);
  }

  public static function warn(x: Any, ?infos: haxe.PosInfos): Void {
    log(x, {}, infos);
  }

  public static function error(x: Any, ?infos: haxe.PosInfos): Void {
    final o = {bg: "red"};
    log(x, o, infos);
  }

  public static function log(x: Any, ?opts: NaughtyOptions = {}, ?infos: haxe.PosInfos): Void {
    switch x {
      case (s : String):
        final infos = formatInfos(infos);
      display('${infos}\n    -----------------------\n\n${s}\n', opts);
      default:
        log(Inspect.inspect(x, {depth: 2}.asTable()), opts, infos);
    }
  }
}
