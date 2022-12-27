package extgen.awesome;


enum abstract MethodDeclarator(String) {
    var Static = "static function";
    var Method = "function";
    var Constructor = "@:selfCall function";
}

typedef Package = {
    path: Array<String>,
    name: String,
}

typedef Identifier = {
    var name: String;
    @:optional var pkg: Null<String>;
    @:optional var native: Null<String>;
};


typedef ArgumentDesc = {
    name: Identifier,
    type: String,
    doc: String,
};

enum Argument {
    SimpleArgument(a: ArgumentDesc);
    ComplexArgument(a: ArgumentDesc & {structure: Map<String, String>});
}


typedef Attribute = {
    declarator: String,
    name: Identifier,
    type: String,
    summary: String,
    line: Int,
};

typedef Method = {
    declarator: String,
    name: Identifier,
    arguments: Array<Argument>,
    returnType: String,
    summary: String,
    line: Int,
    isConstructor: Bool,
};

typedef Signal = {
    name: String,
    summary: String,
    arguments: Array<String>,
}

typedef Class = {
    var cname: Identifier;
    var attributes: Array<Attribute>;
    var methods: Array<Method>;
    var summary: String;
    @:optional var signals: Array<Signal>;
    @:optional var parent: Null<Identifier>;
};


typedef Module = {
    pkg: String,
    imports: Array<String>,
    types: Array<String>,
    cls: Class,
    source: String,
    file: String,
};


class Data {}
