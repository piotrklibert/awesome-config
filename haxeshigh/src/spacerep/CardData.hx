package spacerep;


@:nullSafety(Strict)
@:publicFields
class CardData {
    var data: LuaTable<String, LuaTable<String, Dynamic>>;

    function new() {
        this.data = readJson("/home/cji/priv/programming-idioms/by-hash.json");

        // final path = "/home/cji/priv/programming-idioms/cards//3dce0098d3797a2905ffc6afcbce36c0.png";
        // trace(ReminderData.history.get().hist[path]);
        // final id = path.split("/").last().split(".").first();
        // final links = linksMap[id];
        // trace(id, links);
    }

    // public static function getLinks(): Map<String, Array<String>> {
    //     final m: LuaTable<String, Dynamic> = readJson("/home/cji/priv/programming-idioms/edit-links.json");
    //     final m2: Map<String, Array<String>> = new Map();
    //     final keys = m.keys().filter(k -> k != "__fields__");
    //     for (k in keys) {
    //         m2[k] = Safety.sure(m[k]);
    //     }
    //     return m2;
    // }

}
