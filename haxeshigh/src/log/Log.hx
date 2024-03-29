package log;

import externs.Naughty;
import lib.Inspect;
import lib.Globals;

import lib.LuaMacros;
import lib.LuaMacros.T;
import lib.LuaMacros.castTable as A;

using Safety;


enum abstract LogLevel(String) {
    var Debug;
    var Info;
    var Warn;
    var Error;
}


@:tink
@:nullSafety(Strict)
@:build(log.Builder.build())
class Log {
    static final level = Debug;
    static final backgrounds = [
        Debug => "#45cf65",
        Info => "#55aaff", // #5555ff
        Warn => "#ffff7f",
        Error => "#b91e1e",
    ];
    static final res_path = "/home/cji/priv/awesomescripts/haxeshigh/res";

    static final defaults = {
        // fg: "white",
        fg: "black",
        bg: "#96413F",
        // opacity: 0.85,
        font: "mono 10",
        icon: '${res_path}/bang2.png',
        width: 720,
        position: "bottom_right",
        timeout: 12,
        // timeout: 2,
        hover_timeout: 0.2,
    };

    static function display(s: String, opts: NaughtyOptions = {}) {
        // border_color: "#FF0000", border_width: 4, // doesnt work, why?
        final defs = Reflect.copy(defaults).sure();
        for (f in Reflect.fields(opts))
            Reflect.setField(defs, f, Reflect.field(opts, f));
        Reflect.setField(defs, "text", s);
        Naughty.notification(defs);
    }


    static function formatInfos(i: Null<haxe.PosInfos>): String {
        switch i {
            case null:
                return "    ERROR: no pos info!\n";
            case i:
                return lua.Table.concat(A([
                    '    ${i.fileName}:${i.lineNumber}',
                    '    ${i.className}.${i.methodName}'
                ]), "\n");
        }
    }

    // @:keep
    public static inline function debug(x: Any, ?infos: haxe.PosInfos): Void {
        final opts = {bg: backgrounds[Debug], icon: '${res_path}/debug4.png'};
        log(x, opts, infos);
    }

    // @:keep
    public static inline function info(x: Any, ?infos: haxe.PosInfos): Void {
        final opts = {bg: backgrounds[Info], icon: '${res_path}/debug2.png'};
        log(x, opts, infos);
    }

    // @:keep
    public static inline function warn(x: Any, ?infos: haxe.PosInfos): Void {
        final opts = {bg: backgrounds[Warn], icon: '${res_path}/warn2.png'};
        log(x, opts, infos);
    }

    // @:keep
    public static inline function error(x: Any, ?infos: haxe.PosInfos): Void {
        final opts = {bg: backgrounds[Error], icon: '${res_path}/error2.png'};
        log(x, opts, infos);
    }

    // @:keep
    public static function log(x: Any, ?opts: NaughtyOptions = {}, ?infos: haxe.PosInfos): Void {
        switch (x) {
            case (s : String):
                final infos = formatInfos(infos);
                display('${infos}\n    -----------------------\n\n${s}\n', opts);
            default:
                log(Inspect.haxe(x, cast T({depth: 2})), opts, infos);
        }
    }
}
