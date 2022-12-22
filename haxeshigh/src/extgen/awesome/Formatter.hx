package extgen.awesome;

import extgen.awesome.AwesomeDocExterns.Document;
import extgen.awesome.AwesomeDocExterns.Item;
import extgen.awesome.AwesomeDocExterns.Params;
import extgen.awesome.AwesomeDocExterns.RawParams;
import extgen.awesome.AwesomeDocExterns.ArgData;
import extgen.awesome.AwesomeDocExterns.MethodData;


typedef ClassName = { pkg: String, name: String, native: Null<String> };
typedef AttributeName = { name: String, native: Null<String> };



@:tink
@:publicFields
class Formatter {
    var className: ClassName;
    var filename: String;
    var outputPath: String;

    function new(json: Document) {
        filename = json.file.replace("/home/cji/portless/awesome/build/", "");
        className = getClassName(json.name);
        outputPath = className.pkg
            .split(".")
            .concat([className.name])
            .join("/") + ".hx";
    }

    function formatClass(json: Document) : String {
        final out = [];
        final parent: Null<Array<String>> = json.tags["supermodule"];
        final extds = parent.or([])
            .join(",")
            .let(x -> {
                if (x == "") "" else {
                    final x = getClassName(x);
                    ' extends ${x.pkg}.${x.name}';
                }
            }) ;

        out.push('package ${className.pkg};\n\n');
        out.push('@:luaRequire("${json.name}")');
        out.push('extern class ${className.name}${extds} {');
        out.push('/** ${json.summary}');
        out.push(' * $filename:${json.lineno}');
        out.push(" */");
        return out.filter(s -> s != "").join("\n");
    }

    private function getClassName(name: String) {
        final parts = ["externs"].concat(name.split("."));
        final name = parts.last().capitalize();
        final pkg = parts.dropRight(1).array().join(".");
        return {pkg: pkg, name: name};
    }

    function formatField(item: Item) {
        final data = Extractor.getFieldData(item);
        final out = [];
        out.push(formatDescription(item, []));
        out.push("var ");
        out.push(data.name);
        out.push(": ");
        out.push(formatType(data.args[0].let(x -> x.typeName).or("Dynamic")));
        out.push(";");
        return out.join("");
    }

    function formatMethod(item: Item) {
        final data = Extractor.getMethodData(item);
        var out = ['${data.kind} ${data.name}('];
        for (arg in data.args) {
            out.push(arg.argName);
            out.push(": ");
            out.push(arg.typeName);
            out.push(", ");
        }
        if (", " == out.last()) {
            out = out.dropRight(1).array();
        }
        out.push(")");
        if (data.retType != null) {
            out.push(": ");
            out.push(Extractor.typeMap[data.retType] ?? data.retType ?? "Dynamic");
        }
        out.push(";");
        out = [formatDescription(item, data.args)].concat(out);
        return out.join("");
    }

    private function formatSummary(desc: String) {
        return (desc != "")
            ? (~/  +/.replace(desc, " ").replace("\n", "") : String)
            : " <no desc>";
    }


    private function formatDescription(item: Item, args: Array<ArgData>) {
        final out = [];
        out.push("/**\n * ");
        out.push(formatSummary(item.summary));
        out.push("\n");
        if (item.lineno != null && filename != null) {
            out.push(" * @see " + filename + ":" + item.lineno + "\n");
        }
        for ({argName: a, argDoc: b, typeName: c} in args)
            out.push(' * @param $a $c $b\n');
        out.push(" */\n");
        return out.join("");
    }

    private function formatType(typeName: String) {
        function tMap(t: String) return Extractor.typeMap[t] ?? t ?? "Dynamic";
        final t = tMap(typeName);
        if (t.contains("|")) {
            var tt = t.split("|");
            final nullable =
                if (tt.has("nil")) {
                    tt = tt.filter(x -> x != "nil");
                    true;
                }
                else {
                    false;
                };
            if (tt.length == 1) {
                if (nullable) {
                    return 'Null<${tMap(tt[0])}>';
                }
                else {
                    return tt[0];
                }
            }
            else {
                final ts = tt.map(tMap).join(", ");
                return 'haxe.extern.EitherType<$ts>';
            }
        }
        return t;
    }
}
