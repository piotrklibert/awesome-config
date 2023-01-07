package lib;

import lua.Table;
import haxe.Constraints;

using Lambda;
using lib.LambdaTools;
using Safety;
using StringTools;

@:multiReturn
extern class Next<K, V> {
    var key: K;
    var val: V;
}

@:tink
@:publicFields
class TableTools {
    static inline function last<K, V>(it: Table<K, V>): Null<V> {
        return untyped __lua__("{0}[#{0}]", it, it);
    }

    static inline function first<K, V>(it: Table<K, V>): Null<V> {
        return untyped __lua__("{0}[1]", it);
    }

    static inline function at<K, V>(it: Table<K, V>, pos: K): Null<V> {
        return Reflect.field(it, cast pos); // => __lua__("{0}[{1}]", it, pos);
    }

    static inline function has<K, V>(it: Table<K, V>, el: V): Bool {
        @:keep var ret: Bool = false;
        untyped __lua__(
            "for _,v in pairs({0}) do if v == {1} then {2} = true; end end",
            it, el, ret
        );
        return untyped ret;
    }

    static inline function count<K, V>(tbl: Table<K, V>): Int {
        return untyped __lua__("#{0}", tbl);
    }

    static extern inline function next<K, V>(tbl: Table<K, V>, ?pos: K): Next<K, V> {
        return untyped __lua__("next({0}, {1})", tbl, pos);
    }

    /** Return a Haxe Array with values from given table.
     *
     * NOTE: order of returned elements is unspecified.
     * */
    static inline function values<K, V>(tbl: Table<K, V>): Array<V> {
        if (tbl.next() == null) return [];
        var ret = lua.Table.create();
        untyped __lua__(
            "for k,v in pairs({0}) do _G.table.insert({1}, v); end",
            tbl, ret
        );
        final len = ret.count();
        // safe, checked at the start
        final fst: V = Safety.unsafe(ret.pop());
        ret[0] = fst.unsafe();
        return untyped __lua__("_hx_tab_array({0}, {1})", ret, len);
    }

    /** Return a Haxe Array with keys from given table.
     *
     * NOTE: order of returned elements is unspecified.
     * */
    static inline function keys<K, V>(tbl: Table<K, V>): Array<K> {
        if (tbl.next() == null) return [];
        var ret = lua.Table.create();
        untyped __lua__(
            "for k,v in pairs({0}) do _G.table.insert({1}, k); end",
            tbl, ret
        );
        final len = ret.count();
        // safe, checked at the start
        final fst: V = Safety.unsafe(ret.pop());
        ret[0] = fst.unsafe();
        return untyped __lua__("_hx_tab_array({0}, {1})", ret, len);
    }

    /** Remove first element from array-like table and return it.
      *
      * This is inefficient but required due to tables and Haxe array being
      * indexed differently (1-based vs 0-based). Would be better to compile
      * Arrays as slices (ie. with beg and end indexes) on top of tables...
      */
    static function pop<K, V>(tbl: Table<K, V>): Null<V> {
        final fst = tbl.next();
        if (fst == null)
            return null
        else {
            final fst1 = fst.unsafe();
            untyped __lua__("_G.table.remove({0}, {1})", tbl, fst1.key);
            return fst1.val;
        }
    }

    static inline function push<K, V>(tbl: Table<K, V>, el: V): Table<K, V> {
        untyped __lua__("_G.table.insert({0}, {1})", tbl, el);
        return tbl;
    }

    static inline function iter<K, V>(tbl: Table<K, V>): Iterator<{index: K, value: V}> {
        return lua.PairTools.pairsIterator(tbl);
    }

    static inline function iteri<V>(tbl: Table<Int, V>): Iterator<{index: Int, value: V}> {
        return lua.PairTools.ipairsIterator(tbl);
    }

    static function numericKeys<V>(tbl: Table<Dynamic, V>): Array<String> {
        final pp : Table<String, V> = cast tbl;
        final nums = TableTools.keys(pp)
            .filter(x -> Std.parseInt(x) != null)
            .map(x -> Std.parseInt(x).unsafe());
        nums.sort(Reflect.compare);
        return nums.map(Std.string);
    }

    static function stringKeys<V>(tbl: Table<Dynamic, V>): Array<String> {
        final pp : Table<String, V> = cast tbl;
        final nums = TableTools.keys(pp)
            .filter(x -> Std.parseInt(x) == null);
        // nums.sort(Reflect.compare);
        return nums.map(Std.string);
    }

    static inline function mapValues<K, V, T: Dynamic>(
        tbl: Table<K, V>, func: (V) -> T
    ): Array<T> {
        final vs = tbl.values();
        return vs != null ? vs.map(func) : [];
    }
}
