package lib;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Expr.ExprOf;
import haxe.macro.Context.*;
import haxe.macro.TypeTools.*;
import haxe.macro.MacroStringTools.*;
import haxe.Constraints;

using haxe.macro.ExprTools;

using Lambda;
using lib.LambdaTools;


@:publicFields
class LambdaTools {
    static inline function toArray<T>(it: Iterator<T>): Array<T> {
        return [for (x in it) x];
    }

    static function hasAnyOf<T>(it: Iterable<T>, elts: Array<T>): Bool {
        final res = it.find((item) -> elts.has(item));
        return res != null;
    }

    static function keysArray<K, V>(it: Map<K, V>): Array<K> {
        return it.keys().toArray();
    }

    static inline function not(b: Bool): Bool return !b;

    static function capitalize(s: String): String {
        return s.substr(0, 1).toUpperCase() + s.substr(1);
    }

    static inline function first<T>(it: Iterable<T>): T {
        return it.iterator().next();
    }

    static function last<T>(it: Iterable<T>): T {
        final arr = it.array();
        return arr[arr.length - 1];
    }

    static function dropRight<T>(it: Iterable<T>, n: Int = 1): Iterable<T> {
        final arr = it.array();
        arr.resize(arr.length - n);
        return arr;
    }

    static inline function each<T, R>(it: Iterable<T>, func: (T)->R): Void {
        for (x in it) func(x);
    }

    static inline function sorted<T>(it: Iterable<T>): Array<T> {
        final a = it.array();
        a.sort(Reflect.compare);
        return a;
    }

    static macro function iterIt<T>(it: ExprOf<Iterable<T>>, expr: Expr) {
        return macro Lambda.iter($it, (it) -> { $expr; });
    }

    static macro function mapIt<T>(it: ExprOf<Iterable<T>>, expr: Expr) {
        return macro Lambda.map($it, (it) -> $expr);
    }

    static macro function filterIt<T>(it: ExprOf<Iterable<T>>, expr: Expr) {
        return macro Lambda.filter($it, (it) -> $expr);
    }
}
