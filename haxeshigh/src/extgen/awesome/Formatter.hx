package extgen.awesome;

import extgen.awesome.Data.Argument;
import extgen.awesome.Data.Method;
import extgen.awesome.Data.Module;
import extgen.awesome.Data.Identifier;
import extgen.awesome.Data.Attribute;


@:tink
@:publicFields
class Formatter {
    var moduleData: Module;
    var className: Identifier;
    var filename: String;
    var outputPath: String;
    var prefix: String;

    private var _output: Null<haxe.io.Output> = null;
    var output(get, never): haxe.io.Output;
    function get_output()
        return _output ?? (_output = sys.io.File.write(prefix + outputPath));


    function new(json: Module, prefix: String) {
        this.moduleData = json;
        this.prefix = prefix;
        filename = json.source;
        className = moduleData.cls.cname;
        outputPath = moduleData.pkg
            .split(".")
            .concat([moduleData.cls.cname.name])
            .join("/") + ".hx";
    }

    function println(str: String){
        output.writeString(str + "\n");
    };

    function saveFile() {
        trace(outputPath);
        println(formatModule());
    }

    static final modMap = [
        "screen" => "awful.screen",
    ];

    function formatModule(): String {
        final json = this.moduleData;
        final out = [];
        final parent = json.cls.parent.let(p -> '${p.pkg}.${p.name}');
        final extds = parent.let(p -> ' extends ${parent}') ?? "";
        out.push('package ${json.pkg};\n\n');
        var pkg = json.pkg.replace("externs", "");
        if (pkg.startsWith(".")) pkg = pkg.substring(1);
        if (pkg.length > 0) pkg = pkg + ".";
        final cname = json.cls.cname.name.toLowerCase();
        final require = modMap[pkg + cname] ?? pkg + cname;
        out.push('@:luaRequire("$require")');
        out.push('extern class ${json.cls.cname.name}${extds} {');
        out.push('    /** ${json.cls.summary}');
        out.push('     * @see ${json.source}');
        out.push("     */\n");
        for (attr in json.cls.attributes) {
            formatAttribute(attr, out);
        }
        for (meth in json.cls.methods) {
            formatMethod(meth, out);
        }
        return out.filter(s -> s != "").join("\n") + "}\n";
    }

    function formatMethod(item: Method, out2: Array<String>) {
        final data = item;
        var docstring = [];
        var out = [];
        docstring.push("/** " + formatSummary(item.summary));
        docstring.push(" *");
        docstring.push(" * " + '@see ${moduleData.file}:${item.line}');
        for (arg in data.arguments) {
            switch (arg) {
                case SimpleArgument(arg):
                    docstring.push(" * @param " + arg.name.name + " " + arg.type + " " + formatSummary(arg.doc));
                default:
            }
        }
        docstring.push(" */");
        out.push(docstring.mapIt('    $it').join("\n") + "\n");
        var decl = [];
        decl.push('    ${data.declarator} ${data.name.name}(');
        for (arg in data.arguments) {
            switch (arg) {
                case SimpleArgument(arg):
                    decl.push(arg.name.name + ": " + arg.type);
                    decl.push(", ");
                default:
            }
        }
        if (", " == decl.last()) {
            decl = decl.dropRight(1).array();
        }
        decl.push(")");

        if (data.returnType != null) {
            decl.push(": ");
            decl.push(Types.formatType(data.returnType));
        }
        else {
            decl.push(": Void");
        }
        decl.push(";");
        out.push(decl.join(""));
        out2.push(out.join("") + "\n");
        return out2;
    }

    private function formatSummary(desc: String) {
        return (desc != "")
            ? (~/  +/g.replace(desc, " ").replace("\n", "") : String)
            : " <no desc>";
    }


    private function formatAttribute(item: Attribute, out: Array<String>) {
        out.push("    /**\n     * " + formatSummary(item.summary));
        if (item.line != null && moduleData.file != null) {
            out.push("     * @see " + moduleData.file + ":" + item.line);
        }
        out.push("     */");
        final decl = ["    "];
        if (item.name.native != null)
            decl.push('@:native("${item.name.native}") ');
        decl.push(item.declarator);
        decl.push(" ");
        decl.push(item.name.name);
        decl.push(": " + (item.type ?? "Dynamic"));
        decl.push(";");
        out.push(decl.join("") + "\n");
        return out;
    }

    // private function formatMethod(item: Method, out: Array<String>) {
        // out.push("    /**\n     * " + formatSummary(item.summary));
        // if (item.line != null && moduleData.file != null) {
        //     out.push("     * @see " + moduleData.file + ":" + item.line);
        // }
        // out.push("     */");
        // final decl = ["    "];
        // if (item.name.native != null) decl.push('@:native("${item.name.native}") ');
        // decl.push(item.declarator);
        // decl.push(" ");
        // decl.push(item.name.name);
        // decl.push(": "+ item.type);
        // decl.push(";");
        // out.push(decl.join(""));
    // return
    // }
        // for ({argName: a, argDoc: b, typeName: c} in args)
        //     out.push(' * @param $a $c $b\n');


}

// Local Variables:
// haxe-module: "hx_extgen"
// End:
