package extgen.penlight;

import haxe.Json;
import sys.io.File;

import lua.Table;
import lua.Table.AnyTable;

import utils.lua.Macro.A;
import utils.lua.Macro.T;
import lib.Globals.Prelude.*;
import lib.LuaTable;
import lib.Inspect;
import Console;

using Lambda;
using lib.LambdaTools;
using lua.PairTools;
using lib.TableTools;
using lib.IoTools;
using StringTools;
using Safety;

extern class FieldType {
    var type: String;
}

@:publicFields
@:structInit
extern class Modifiers extends Table<String, Dynamic> {
    // @:selfCall // https://haxe.org/manual/target-javascript-external-libraries.html
    // function new(){};
    // @:native("return")
    var ret: Null<Table<Int, FieldType>>;
    var emits: Null<Dynamic>;
    var baseclass: Null<Dynamic>;
    var param: Null<LuaTable<String, FieldType>>;
    var see: Null<Dynamic>;
    var emitstparam: Null<Dynamic>;
    var usebeautiful: Null<Dynamic>;
    var usage: Null<Dynamic>;
    var propemits: Null<Dynamic>;
    var field: Null<Table<Int, FieldType>>;
}

extern class RawParams {
    var map: LuaTable<String, String>;
}

@:notNull
abstract Params(RawParams) {
    public var map(get, never): LuaTable<String, String>;
    function get_map() { return this.map; }

    @:op([]) public function fieldRead(name: String): Dynamic
        return untyped this[name];

    @:op([]) public function fieldWrite<T>(name: String, val: T): T
        return untyped this[name] = val;
}

// https://github.com/ciscoheat/dataclass
extern class Item {
    var args: String;
    var description: String;
    var inferred: Bool;
    var kind: String;
    var lineno: Int;
    var modifiers: Modifiers;
    var name: String;
    var parameter: String;
    var params: Params;
    var section: String;
    var subparams: Dynamic;
    var summary: String;
    var tags: Null<LuaTable<String, Dynamic>>;
    var type: String;
    var baseclass: Array<String>;
    var ret: Array<String>;
}

extern class Document {
    var inferred: Bool;
    var kind: String;
    var type: String;
    var mod_name: String;
    var file: String;
    var lineno: Int;
    var sections: Dynamic;
    var summary: String;
    var name: String;
    var modifiers: Modifiers;
    var usage: String;
    @:native("package")
    var pkg: String;
    var tags: LuaTable<String, Dynamic>;
    var items: Array<Item>;
    var description: String;
}

class PenlightExterns {}
