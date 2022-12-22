package extgen;

import utils.lua.Macro.T;
using Safety;


@:nullSafety(Strict)
class Main {
    static public function __init__() {
        // haxe.macro.Compiler.includeFile("example.lua");
        final x = 4;
    }

    @:keep
    public static function main() {
        final xx: Null<Int> = cast 3;
        switch Sys.args() {
        case ["-macro"]:
            trace(extgen.JsonTools.ffff());
        case ["-timeit"]: haxe.Timer.measure(() -> {
            for (x in 0...1000) {
                xx.let(i -> {println(i); i;});
            }
        });
        case ["-awesome"]:
            extgen.awesome.Processor.parse();
        case ["-penlight"]:
            extgen.penlight.PenlightDocParser.parse();
        case ["-scratch"]:
            scratch();
        default:
            trace("Bad arg");
        };
    }

    static function scratch() {
        // trace(ext.TableX.size(T({})));
    }
}


// Local Variables:
// haxe-module: "hx_extgen"
// End:
