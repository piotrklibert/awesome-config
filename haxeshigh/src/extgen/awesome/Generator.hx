package extgen.awesome;

import sys.FileSystem;
import extgen.awesome.Externs.Document;

using Lambda;


@:tink
class Generator {
    public static function parseOne() {
        parseFile("screen");
    }

    public static function parseAll() {
        final files = FileSystem.readDirectory("api")
            .filter(x -> !~/^[0-9]/.match(x))
            .map(x -> x.replace(".json", ""));
        for (f in files)
            parseFile(f);
    }

    private static function getJson(fname: String): Document {
        final root = "/home/cji/priv/awesomescripts/haxeshigh/";
        return Json.parse(File.getContent('${root}/api/${fname}.json'));
    }

    private static function makePackageDirs(paths: Array<String>) {
        for (path in paths) FileSystem.createDirectory('out/$path');
    }


    private static function parseFile(fname: String) {
        final json = try { getJson(fname); } catch (ex) {
            trace('Invalid json: $fname');
            return;
        };
        final ext = Extractor.get(json).extract();
        final fmt = new Formatter(ext.module, "out/");
        fmt.saveFile();
    }
}

// Local Variables:
// haxe-module: "hx_extgen"
// End:
