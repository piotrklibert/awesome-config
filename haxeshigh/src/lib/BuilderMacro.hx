package lib;

import haxe.macro.Printer;


class BuilderMacro {
    static public macro function build(): Array<Field> {
        final fields = Context.getBuildFields();
        final fields = processFields(fields);
        return fields;
    }

    #if macro

    static function processFields(fields: Array<Field>) {
        var generated = [];
        for (field in fields)
            generated = generated.concat(processField(field));
        final complex_type = Context.getLocalType().toComplexType();
        final type_path = switch (complex_type) {
            case TPath(t): t;
            default:
                throw "Bad type";
        }
        final c = macro class {
            function new() {}
            static var inst(get, never): $complex_type;
            static function get_inst() return new $type_path();
        };
        generated = generated.concat(c.fields);
        return generated;
    }

    static function processField(field: Field) {
        final type = switch (field.kind) {
            case FVar(type = TPath({name: name})):
                    type;
            case _:
                return [ field ];
        };
        final nullable = macro : Null< $type >;
        final name = "_" + field.name;
        final raw_name = field.name;
        final c = macro class {
            var $name: $nullable = null;
            function $raw_name(val: $type) {
                this.$name = val;
                return this;
            }
        };
        // trace(new Printer().printField(c.fields[1]));
        return c.fields;
    }

    #end
}
