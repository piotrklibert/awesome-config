package extgen.awesome;


extern class FieldType extends Table<String, String> {
    var type: String;
}

@:publicFields
@:structInit
extern class Modifiers extends Table<String, Dynamic> {
    // @:selfCall // https://haxe.org/manual/target-javascript-external-libraries.html
    // function new(){};
    @:native("return")
    var ret: Null<Table<Int, FieldType>>;
    var emits: Null<Dynamic>;
    var baseclass: Null<Dynamic>;
    var param: Null<LuaTable<String, Dynamic>>;
    var see: Null<Dynamic>;
    var emitstparam: Null<Dynamic>;
    var usebeautiful: Null<Dynamic>;
    var usage: Null<Dynamic>;
    var propemits: Null<Dynamic>;
    var field: Null<LuaTable<String, FieldType>>;
}

extern class RawParams extends lua.Table<String, Dynamic> {
    var map: LuaTable<String, String>;
}

@:notNull
abstract Params(RawParams) to RawParams from RawParams {
    public var map(get, never): LuaTable<String, String>;
    function get_map() { return this.map; }

    @:op([]) public function fieldRead(name: String): Any
        return untyped this[name];

    @:op([]) public function fieldWrite<T>(name: String, val: T): T
        return untyped this[name] = val;
}

// https://github.com/ciscoheat/dataclass
extern class Item extends Table<String, Dynamic> {
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
    var subparams: LuaTable<String, Table<Int, String>>;
    var summary: String;
    var tags: Null<LuaTable<String, Dynamic>>;
    var type: String;
    var baseclass: Array<String>;
    var ret: Array<String>;
}

extern class DocumentTags extends lua.Table<String, Dynamic> implements ArrayAccess<Dynamic> {
    var author: Array<String>;
    var copyright: Array<String>;
    var supermodule: Array<String>;
    var readonly: Null<Array<String>>;
    var see: Null<Array<String>>;
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
    var tags: DocumentTags;
    var items: Array<Item>;
    var description: String;
}

class Externs {}
