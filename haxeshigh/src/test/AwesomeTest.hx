package test;


@:nullSafety(Strict)
class AwesomeTest {
    public static function main() {
        final t: LuaTable<Int, Int> = lua.Table.create([2, 3, 4, 5]);
        trace(t.pop());
        trace(t.values());
        t.push(45);
        trace(t.keys());
        trace(t.mapValues((x) -> {prints(x); 3;}));
        trace(t.has(4));
        trace(t.toMap());
        trace(t.arrayOf(Int));
        trace(t is lua.Table);
        trace({a: 3});
    }
}
// Local Variables:
// haxe-module: "hx_test"
// End:
