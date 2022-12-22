package extgen.awesome;

import extgen.awesome.AwesomeDocExterns.Document;
import extgen.awesome.AwesomeDocExterns.Item;
import extgen.awesome.AwesomeDocExterns.Params;
import extgen.awesome.AwesomeDocExterns.RawParams;
import extgen.awesome.AwesomeDocExterns.ArgData;
import extgen.awesome.AwesomeDocExterns.MethodData;


@:publicFields
class Extractor {
    static final typeMap = [
        "number" => "Int",
        "integer" => "Int",
        "boolean" => "Bool",
        "table" => "lua.Table<String, Dynamic>",
        "function" => "Function",
        "widget" => "externs.wibox.Widget",
        "string" => "String",
        "height" => "Int",
        "width" => "Int",
        "The" => "Dynamic",
        "gears.shape" => "externs.gears.Shape",
        "gears.color" => "externs.gears.Color",
        "color" => "externs.gears.Color",
        "screen" => "externs.Screen",
        "client" => "externs.Client",

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

    static function getMethodData(item: Item): MethodData {
        final params: Params = item.params;
        final args: Array<ArgData> = [];
        for (arg in params.numericKeys()) {
            final argName = params[arg];
            final argMods: LuaTable<String, String> = item.modifiers.param[argName];
            final typeName = argMods.let(x -> x["type"]);
            final argDoc = params.map[argName];
            final argName = argMap[argName] ?? argName;
            final typeName = formatType(typeName);
            args.push({
                argName: argName, argDoc: argDoc, typeName: typeName
            });
        }
        final retType =
            item.modifiers?.ret.let(x -> x[0]).let(x -> x.type);
        final methodName = sanitizeName(item.name);
        final isConstructor = item.type == "constructorfct";
        return {
            args: args,
            name: isConstructor ? "new" : methodName,
            summary: item.summary,
            retType: isConstructor ? null : retType,
            kind: kindMap[item.type] ?? "",
            line: item.lineno,
            isConstructor: isConstructor,
        }
    }

    static function sanitizeName(name: String) {
        final re = ~/[.:]/;
        final sep = if (re.match(name)) re.matched(0) else null;
        if (sep == null) {
            return name;
        }
        else {
            return name.split(sep).last();
        }
    }

    static function getFieldData(item: Item): MethodData {
        final params: Params = item.params;
        final args: Array<ArgData> = [];
        for (arg in params.numericKeys()) {
            final argName = params[arg];
            final argMods = item.modifiers.field["1"];
            final tt = formatType(item.params["1"]);
            final typeName = (~/^[A-Z]/.match(tt)) ? tt : argMods.type;
            final argDoc = params.map[argName];
            final argName = argMap[argName] ?? argName;
            final typeName = typeMap[typeName] ?? typeName ?? "Dynamic";
            args.push({argName: argName, argDoc: argDoc, typeName: typeName});
        }
        final retType =
            item.modifiers?.ret.let(x -> x[0]).let(x -> x.type);
        return {
            args: args,
            name: sanitizeName(item.name),
            summary: item.summary,
            retType: retType,
            kind: kindMap[item.type] ?? "",
            line: item.lineno,
            isConstructor: false,
        }
    }

    static function formatType(typeName: String) {
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
