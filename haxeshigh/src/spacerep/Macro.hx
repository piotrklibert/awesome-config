package spacerep;

@:autoBuild(Macro.build())
interface ModuleData {}

@:publicFields
class Macro {
    macro function build() {
        trace("argh");
        return macro "";
    }
}

// Local Variables:
// haxe-module: "hx_spacerep"
// End: