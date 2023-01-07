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

    static inline function at<K, V>(it: Table<K, V>, pos: Int): Null<V> {
        return Reflect.field(it, cast pos); //__lua__("{0}[{1}]", it, pos+1);
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
        return untyped __lua__("next({0})", tbl, pos);
    }

    static inline function values<K, V>(tbl: Table<K, V>): Array<V> {
        if (tbl.next() == null) return [];
        @:keep var ret = lua.Table.create();
        untyped __lua__("for k,v in pairs({0}) do _G.table.insert(ret, v); end", tbl);
        final len = ret.count();
        final fst: V = Safety.unsafe(ret.pop());
        ret[0] = fst.unsafe();
        return untyped __lua__("_hx_tab_array({0}, {1})", ret, len);
    }

    static inline function mapValues<K, V, T: Dynamic>(tbl: Table<K, V>, f: (V) -> T): Array<T> {
        final vs = tbl.values();
        return vs != null ? vs.map(f) : [];
    }

    static inline function keys<K, V>(tbl: Table<K, V>): Array<K> {
        if (tbl.next() == null) return [];
        @:keep var ret = lua.Table.create();
        untyped __lua__("for k,v in pairs({0}) do _G.table.insert(ret, k); end", tbl);
        final len = ret.count();
        final fst: V = Safety.unsafe(ret.pop());
        ret[0] = fst.unsafe();
        return untyped __lua__("_hx_tab_array({0}, {1})", ret, len);
    }

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

    // static function without<K, V>(tbl: Table<K, V>, ...args: K): Table<K, V> {
    //     final t = tbl;
    //     for (x in args)
    //         untyped t[x] = null;
    //     return t;
    // }

    static function numericKeys<V>(tbl: Table<Dynamic, V>): Array<String> {
        final pp : Table<String, V> = cast tbl;
        final nums = TableTools.keys(pp)
            .filter(x -> Std.parseInt(x) != null)
            .map(x -> Std.parseInt(x).sure());
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
}
