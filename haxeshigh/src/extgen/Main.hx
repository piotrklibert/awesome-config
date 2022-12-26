package extgen;

using Safety;


@:nullSafety(Strict)
class Main {
    public static function main() {
        switch Sys.args() {
        case ["-all"]:
            extgen.awesome.Generator.parseAll();
        case ["-one"]:
            extgen.awesome.Generator.parseOne();
        default:
            trace("Bad arg");
        };
    }
}


// Local Variables:
// haxe-module: "hx_extgen"
// End:
