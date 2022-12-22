package extgen.awesome;

import extype.Set;

import extgen.awesome.AwesomeDocExterns.Document;
import extgen.awesome.AwesomeDocExterns.Item;
import extgen.awesome.AwesomeDocExterns.Params;
import extgen.awesome.AwesomeDocExterns.RawParams;
import extgen.awesome.AwesomeDocExterns.ArgData;
import extgen.awesome.AwesomeDocExterns.MethodData;


using Lambda;


@:tink
class Processor {
    static function getJson(fname: String): Document {
        final root = "/home/cji/priv/awesomescripts/haxeshigh/";
        return Json.parse(File.getContent('${root}/api/${fname}.json'));
    }

    public static function parse() {
        final files = sys.FileSystem.readDirectory("api")
            .filter(x -> !~/^[0-9]/.match(x))
            .map(x -> x.replace(".json", ""));
        for (f in files)
            parseFile(f);
        // parseFile("wibox.widget.calendar");
        // for (x in s)
        //     sys.FileSystem.createDirectory("out/" + x);
    }
    // static final s: Set<String> = new Set();

    public static function parseFile(fname: String) {
        final json = try { getJson(fname); } catch (ex) {
            trace('Invalid json: $fname');
            return;
        };
        final fmt = new Formatter(json);
        final file = sys.io.File.write("out/"+ fmt.outputPath);

        function println(str: String)
            file.writeString(str + "\n");

        println(fmt.formatClass(json));

        final it = json.items.filter(x -> x.type == "property");
        for (i in it)
            println(fmt.formatField(i));

        final it = json.items
            .filter(x -> x.type == "constructorfct")
            .map(Reflect.copy);

        if (it.length > 1) for (x in it) x.type = "staticfct";
        for (i in it)
            println(fmt.formatMethod(i));

        final it = json.items.filter(x -> x.type == "method");
        for (i in it){
            println(fmt.formatMethod(i));
        }

        final it = json.items.filter(x -> x.type == "function");
        for (i in it)
            println(fmt.formatMethod(i));

        final it = json.items.filter(x -> x.type == "staticfct");
        for (i in it)
            println(fmt.formatMethod(i));

        println("}");
    }
}

// Local Variables:
// haxe-module: "hx_test"
// End:
