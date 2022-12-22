package lib;

import lua.Table;
using Lambda;
using lib.LambdaTools;
using Safety;

@:publicFields
class TableTools {
    static function keys<K, V>(table: Table<K, V>): Iterator<K> {
        final m : Map<K, Dynamic> = Table.toMap(table);
        return m.keys();
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
            .toArray()
            .filter(x -> Std.parseInt(x) != null)
            .map(x -> Std.parseInt(x).sure());
        nums.sort(Reflect.compare);
        return nums.map(Std.string);
    }

    static function stringKeys<V>(table: Table<Dynamic, V>): Array<String> {
        final pp : Table<String, V> = cast table;
        final nums = TableTools.keys(pp)
            .toArray()
            .filter(x -> Std.parseInt(x) == null);
        // nums.sort(Reflect.compare);
        return nums.map(Std.string);
    }


    static inline function last<K, V>(it: Table<K, V>): V {
        return untyped __lua__("{0}[#{0}]", it, it);
    }

    static inline function first<K, V>(it: Table<K, V>): V {
        return untyped __lua__("{0}[1]", it);
    }

    static inline function keysArray<K, V>(it: Table<K, V>): Array<K> {
        return TableTools.keys(it).toArray();
    }

    static function values<K, V>(it: Table<K, V>): Array<V> {
        final m : Map<K, V> = Table.toMap(it);
        return [ for(v in m) v ];
    }
}
