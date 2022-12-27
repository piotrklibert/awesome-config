package extgen.awesome;

import extgen.awesome.Externs.Document;
import extgen.awesome.Externs.Item;
import extgen.awesome.Externs.Params;
import extgen.awesome.Externs.RawParams;

import extgen.awesome.Data.Argument;
import extgen.awesome.Data.Method;
import extgen.awesome.Data.Module;
import extgen.awesome.Data.Identifier;

import extgen.awesome.Utils.returnIfPresent;
using Reflect;


@:tink
@:publicFields
class Extractor {
    static final modMap = [
        "screen" => "awful.screen",
    ];

    static final argMap = [
        "..." => "...rest",
    ];

    static final kindMap = [
        "staticfct" => "static function",
        "method" => "function",
        "property" => "var",
        "function" => "static function",
        "constructorfct" => "@:selfCall function",
    ];

    var data: Document;
    var module: Module;
    private var attributeNames: extype.Set<String> = new extype.Set();

    function toString() { return Std.string(module); }

    static function get(d: Document) return new Extractor(d);
    function new(data: Document) {
        this.data = data;
    }


    function extract() {
        this.module = extractModule();
        var constructors = 0;
        for (item in this.data.items) {
            switch (item.type) {
            case "signal":
                extractSignal(item);
            case "method" | "function" | "staticfct":
                extractMethod(item);
            case "property":
                extractProperty(item);
            case "constructorfct":
                if (constructors++ < 1)
                    extractMethod(item);
                else {
                    item.type = "staticfct";
                    extractMethod(item);
                }
            }
        }
        return this;
    }

    function extractModule(): Module {
        final parent = data.tags.supermodule.let(x -> x[0]);
        final parentId: Identifier = parent.let(p -> cast {name: p});
        final sourcePath = convertPath(data.file);
        final clsName = getClassAndPackage(data.name);
        // trace(parent.let(p -> getClassAndPackage(p)));
        return {
            pkg: clsName.pkg,
            source: '${sourcePath}:${data.lineno}',
            file: sourcePath,
            imports: [],
            types: [],
            cls: {
                signals: [],
                parent: parent.let(parent -> getClassAndPackage(parent)),
                cname: { name: clsName.name, native: clsName.native },
                summary: data.summary,
                attributes: [],
                methods: [],
            }
        };
    }

    function extractMethod(item: Item) {
        final methodName = sanitizeName(item.name);
        returnIfPresent(attributeNames, methodName);

        final args = extractMethodArguments(item);
        final retType = item.modifiers?.ret.let(x -> x[0]).let(x -> x.type);
        // trace(Types.formatType(retType));
        final isConstructor = item.type == "constructorfct";

        module.cls.methods.push({
            declarator: kindMap[item.type] ?? "",
            arguments: args,
            name: isConstructor ? {name: "new"} : getFieldName(methodName),
            summary: item.summary,
            returnType: isConstructor ? null : retType,
            line: item.lineno,
            isConstructor: isConstructor,
        });
    }

    function extractMethodArguments(item: Item) {
        final args: Array<Argument> = [];
        final argNames: extype.Set<String> = new extype.Set();

        final argumentNames =
            [ for (arg in item.params.numericKeys()) item.params[arg] ];

        // TODO: extract structures of table arguments, make typedefs for them
        //
        // for (argName in argumentNames) {
        //     if (argNames.exists(argName)) continue;
        //     argNames.add(argName);
        //     final argToSub: Map<String, {a: String, b: String}> = new Map();
        //     final keys: Array<String> = item.params.map.keys();
        //     for (k in keys) {
        //         if (k.startsWith(argName) && k != argName)
        //             argToSub[k] = {b: formatSummary(item.params.map[k]), a: ""};
        //     }
        //     final keys: Array<String> = item.modifiers.param.keys();
        //     for (k in keys) {
        //         if (k.startsWith(argName) && k != argName){
        //             final a = argToSub[k].sure();
        //             argToSub[k] = {a: item.modifiers.param[k].type, b: a.b};
        //         }
        //     }
        //     for (a => b in argToSub)
        //         trace(a, b.a, b.b);
        // }

        for (arg in item.params.numericKeys()) {
            final argName = item.params[arg];
            if (argNames.exists(argName)) continue;
            argNames.add(argName);

            final argMods: LuaTable<String, String> = item.modifiers.param[argName];
            final typeName = argMods.let(x -> x["type"]);
            final argDoc = item.params.map[argName];
            final argName = getFieldName(argMap[argName] ?? argName);
            final typeName = Types.formatType(typeName) ?? "Dynamic";
            args.push(
                SimpleArgument({name: argName, doc: argDoc, type: typeName})
            );
        }
        return args;
    }

    function extractProperty(item: Item) {
        final propertyName = sanitizeName(item.name);
        returnIfPresent(attributeNames, propertyName);

        final type = item.params["1"];
        final modifiers = item.modifiers.field["1"];
        final mappedType = Types.formatType(type);
        final typeName =
            (type != mappedType) ? mappedType : Types.formatType(modifiers.type);
        final argDoc = item.params.map[type];
        final type = argMap[type] ?? type;

        module.cls.attributes.push({
            name: getFieldName(sanitizeName(item.name)),
            summary: item.summary,
            type: typeName,
            declarator: kindMap[item.type] ?? "",
            line: item.lineno,
        });
    }

    function extractSignal(item: Item) {
        final nkeys = item.params.numericKeys();
        final keys = item.params.keysArray().filterIt(~/[a-z]/.match(it));
        final args = [];
        for (k in nkeys) {
            args.push(item.params[k]);
        }

        final args: Array<String> = [
            for (i in 0...args.length) {
                final n = args[i];
                '$n ${item.params.map[n]}';
            }
        ];
        module.cls.signals.push({
            name: item.name,
            summary: item.summary,
            arguments: args,
        });
    }

    static function sanitizeName(name: String) {
        final re = ~/[.:]/g;
        return re.split(name).last();
    }

    static function getClassAndPackage(name: String) {
        final parts = ["externs"].concat(name.split("."));
        final name = parts.last().capitalize();
        final pkg = parts.dropRight(1).array().join(".");
        if (Keywords.keywords.has(name)) {
            return {pkg: pkg, name: '_$name', native: name };
        }
        return {pkg: pkg, name: name, native: null};
    }

    static function getFieldName(name: String) {
        if (Keywords.keywords.contains(name)) {
            return { name: '_$name', native: name, pkg: null };
        }
        else {
            return { name: name, native: null, pkg: null };
        }
    }

    static function convertPath(path: String) {
        return path.replace("/home/cji/portless/awesome/build/", "");
    }

    static function formatSummary(desc: String) {
        return (desc != "")
            ? (~/  +/g.replace(desc, " ").replace("\n", "") : String)
            : " <no desc>";
    }
}


// Local Variables:
// haxe-module: "hx_extgen"
// End:
