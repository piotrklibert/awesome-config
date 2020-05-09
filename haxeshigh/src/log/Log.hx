package log;

import utils.lua.Globals;
import awful.Naughty;
import lib.Inspect;


// TODO:
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


  static function display(s: String) {
    // border_color: "#FF0000", border_width: 4, // doesnt work, why?
    Naughty.notify({
        fg: "white",
        bg: "#96413F",
        text: s,
        icon: "/home/cji/portless/lua/awesome-config/haxeshigh/bang2.png",
        width: 520,
        position: "bottom_right",
        timeout: 20,
        hover_timeout: 0,
      });
  }

  static function formatInfos(i: Null<haxe.PosInfos>): String {
    switch i {
      case null: return "    ERROR: no pos info!\n";
      case i: return [
        '    ${i.fileName}:${i.lineNumber}',
        '    ${i.className}.${i.methodName}'
      ].join("\n");
    }
  }

  public static function log(x: Any, ?infos: haxe.PosInfos): Void {
    switch x {
      case (s : String):
        final infos = formatInfos(infos);
        display('${infos}\n    -----------------------\n\n${s}\n');
      default:
        log(Inspect.inspect(x, {depth: 2}), infos);
    }
  }
}
