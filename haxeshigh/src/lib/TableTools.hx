package lib;

import lua.Table;
using Lambda;
using lib.LambdaTools;
using Safety;
using StringTools;

@:tink
@:publicFields
class TableTools {
    static inline function last<K, V>(it: Table<K, V>): V {
        return untyped __lua__("{0}[#{0}]", it, it);
    }

    static inline function first<K, V>(it: Table<K, V>): V {
        return untyped __lua__("{0}[1]", it);
    }

    static inline function at<K, V>(it: Table<K, V>, pos: Int): V {
        return untyped __lua__("{0}[{1}]", it, pos+1);
    }

    static inline function keys<K, V>(table: Table<K, V>): Array<K> {
        return [ for ({index: k} in lua.PairTools.pairsIterator(table)) k ];
    }

    static inline function values<K, V>(table: Table<K, V>): Array<V> {
        return [ for ({value: v} in lua.PairTools.pairsIterator(table)) v ];
    }

    static inline function iter<K, V>(table: Table<K, V>): Iterator<{index: K, value: V}> {
        return lua.PairTools.pairsIterator(table);
    }

    static inline function iteri<V>(table: Table<Int, V>): Iterator<{index: Int, value: V}> {
        return lua.PairTools.ipairsIterator(table);
    }

    // static function without<K, V>(table: Table<K, V>, ...args: K): Table<K, V> {
    //     final t = table;
    //     for (x in args)
    //         untyped t[x] = null;
    //     return t;
    // }

    static function numericKeys<V>(table: Table<Dynamic, V>): Array<String> {
        final pp : Table<String, V> = cast table;
        final nums = TableTools.keys(pp)
            .filter(x -> Std.parseInt(x) != null)
            .map(x -> Std.parseInt(x).sure());
        nums.sort(Reflect.compare);
        return nums.map(Std.string);
    }

    static function stringKeys<V>(table: Table<Dynamic, V>): Array<String> {
        final pp : Table<String, V> = cast table;
        final nums = TableTools.keys(pp)
            .filter(x -> Std.parseInt(x) == null);
        // nums.sort(Reflect.compare);
        return nums.map(Std.string);
    }
}
