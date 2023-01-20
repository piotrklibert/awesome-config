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
