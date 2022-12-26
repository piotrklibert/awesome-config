package extgen.awesome;


@:publicFields
class Types {
    static final typeMap = [
        "number" => "Int",
        "integer" => "Int",
        "int" => "Int",
        "boolean" => "Bool",
        "bool" => "Bool",
        "table" => "lua.Table<String, Dynamic>",
        "function" => "haxe.Constraints.Function",
        "widget" => "externs.wibox.Widget",
        "string" => "String",
        "height" => "Int",
        "width" => "Int",
        "The" => "Dynamic",
        "A" => "Dynamic",
        "gears.shape" => "externs.gears.Shape",
        "gears.surface" => "externs.gears.Surface",
        "gears.suface" => "externs.gears.Surface",
        "surface" => "externs.gears.Surface",
        "cairo.surface" => "Dynamic",
        "cairo_surface" => "Dynamic",
        "cairo_context" => "Dynamic",
        "gears.color" => "externs.gears.Color",
        "color" => "externs.gears.Color",
        "object" => "externs.gears.Object",
        "screen" => "externs.Screen",
        "client" => "externs.Client",
        "tag" => "externs.Tag",
        "interger" => "Int",
        "client.object" => "externs.Client",
        "awful.key" => "externs.awful.Key",
        "awful.button" => "externs.awful.Button",
        "?number" => "Null<Int>",
        "layout" => "externs.awful.Layout",
        "path" => "Dynamic",
    ];


    static function formatType(typeName: String) {
        function tMap(t: String) return typeMap[t] ?? t ?? "Dynamic";
        if (typeName.or("").startsWith("?")) {
            typeName = typeName.substring(1);
            trace(typeName);
            true;
        }
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

// Local Variables:
// haxe-module: "hx_extgen"
// End:
