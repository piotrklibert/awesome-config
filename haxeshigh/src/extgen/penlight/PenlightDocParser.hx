package extgen.penlight;

import Console;
import extgen.penlight.PenlightDocExterns.Document;
import extgen.penlight.PenlightDocExterns.Item;



class PenlightDocParser {
    static final typeMap = [
        "Number" => "Int",
        "Integer" => "Int",
        "Boolean" => "Bool",
        "Tab" => "lua.Table",
        "Func" => "Function"
    ];

    static final argMap = [
        "..." => "...rest"
    ];

    static function getJson(fname: String): Dynamic {
        final root = "/home/cji/priv/awesomescripts/haxeshigh/";
        return Json.parse(File.getContent('${root}/api-pl/${fname}.json'));
    }

    static function formatClass(json: Document) : String {
        final out = [];
        final parent: Null<Array<String>> = json.tags["supermodule"];
        out.push(parent.or([]).join(","));
        out.push('\t${json.name} :: ${json.file}:${json.lineno}');
        out.push('${json.summary}');
        return out.filter(s -> s != "").join("\n");
    }

    static function formatReturnType(item: Item): String {
        return item.ret.let(item -> item[0]).or("Dynamic");
    }

    static function formatItem(item: Item) : String {
        final out = [];
        final retType = formatReturnType(item);
        final args = formatInlineArgs(item);
        out.push("/** " + item.summary);
        out.push(formatArgs(item).map(x -> ' * @param $x').join("\n"));
        out.push(" */");
        out.push([
            'static ${item.type}'.trim(),
            '${item.name}${args}',
            ': ${retType};'
        ].join(" "));
        return out.filter(s -> s != "").join("\n");
    }

    static function formatInlineArgs(item: Item): String {
        var s = "";
        final params: LuaTable<String, Dynamic> = cast item.params;
        for (n in params.numericKeys()) {
            final arg: String = params[n.toString()];
            final type = formatType(item.modifiers.param[arg]?.type);
            final arg = argMap[arg].let(a -> a).or(arg);
            s += '$arg: $type, ';
        }
        s = s.substr(0, s.length - 2);
        return '($s)';
    }

    static function formatArgs(item: Item) : Array<String> {
        final out = [];
        final params: LuaTable<String, Dynamic> = cast item.params;
        for (n in params.numericKeys()) {
            final arg: String = params[n.toString()];
            out.push(formatParamDesc(item, arg));
        }
        return out.filter(s -> s != "");
    }

    static function formatType(type: Null<String>): String {
        return type
            .let(s -> s.capitalize())
            .or("Dynamic")
            .let(s -> typeMap[s] != null ? typeMap[s] : s);
                // .let(s -> '<green>$s</green>')
    }

    static function formatParamDesc(item: Item, arg: String) : String {
        final out = [];
        final arg2: String = argMap[arg].let(a -> a).or(arg);
        out.push('${arg2} ');
        // out.push('<yellow>${arg}</> ');
        out.push(formatType(item.modifiers.param[arg]?.type));
        out.push(formatDescription(item.params.map[arg]));
        return out.join("");
    }

    static function formatDescription(desc: String) {
        return (desc != "")
            ? (~/  +/.replace(desc, " ").replace("\n", "") : String)
            : " <no desc>";
    }

    public static function parse() {
        haxe.Timer.measure(() -> {
            final json: Document = getJson("tablex");

            println("-----");
            println(formatClass(json));

            for (x in json.items) {
                if (x.name.contains(":").not()) {
                    println(formatItem(x));
                    println("");
                }
            }
        });
        // trace(keys.keysArray());
        // final z = extgen.JsonTools.nvm(<a> ${keys} </a>);
        // final c = cast {emits: 3};
        // final m: Modifiers = c;


        // https://github.com/DenkiYagi/extype
        // https://github.com/DenkiYagi/extype/blob/master/src/extype/Set.hx
        // TODO: https://haxe.org/manual/lf-static-extension-metadata.html#default-static-extension

        // for (k in keys.keys()) {
        //     println('var $k: Dynamic;');
        // }
        // trace(Std.isOfType(T({}), Table));
    }
}

// Local Variables:
// haxe-module: "hx_test"
// End:
