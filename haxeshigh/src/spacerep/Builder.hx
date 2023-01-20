package spacerep;

import haxe.macro.Printer;


class Builder {
    static function exp(x: Any) return { pos: Context.currentPos(), expr: x };

    static function str(s: String) return exp(EConst(CString(s)));

    public static macro function build(): Array<Field> {

        final fields = Context.getBuildFields();
        var generated = [];
        for (field in fields)
            generated = generated.concat(processField(field));
        return generated;
    }

    static function processField(field: Field) {
        switch (field.meta[0]) {
            case {name: ":perm"}:
                return processFieldPerm(field);
            case {name: ":semi"}:
                return processFieldSemi(field);
            default:
                return [ field ];
        }
    }

    static function processFieldSemi(field: Field) {
        trace("@:semi field processing");
        // The class we're building.
        final tinst = Context.getLocalType();  // e.g. TInst(spacerep.ReminderData, [])

        final fieldType =
            switch (field.kind) {
                case FProp(_, _, fieldType): fieldType;
                default:
                    throw "fuck";
            };
        field.access = field.access.concat([APublic, AStatic]);

        final thisType =
            switch (tinst) {
                case TInst(thisType, _): thisType;
                default:
                    throw "fuck";
            }

        final fname = field.name;
        final mangled = str(
            thisType.toString().replace(".", "__") + "__" + fname
        );

        final fieldTypePath =
            switch (fieldType) {
                case TPath(fieldTypePath): fieldTypePath;
                default:
                    throw "fuck";
            }

        final c = macro class {
            static function get(): $fieldType {
                final env = globals();
                final previous: Null< $fieldType > = env[$mangled];
                if (previous == null) {
                    return env[$mangled] = new $fieldTypePath();
                }
                else {
                    return previous;
                }
            }
        };
        final getter = c.fields[0];
        getter.name = 'get_${fname}';

        final c = macro class {
            static function set(obj: $fieldType): $fieldType {
                return globals()[$mangled] = obj;
            }
        };
        final setter = c.fields[0];
        setter.name = 'set_${fname}';

        trace(new Printer().printField(getter));
        trace(new Printer().printField(setter));

        return [ field, getter, setter ];
    }

    static function processFieldPerm(field: Field) {
        trace("@:perm field processing");
        // The class we're building.
        final tinst = Context.getLocalType();  // e.g. TInst(spacerep.ReminderData, [])

        final fieldType =
            switch (field.kind) {
                case FProp(_, _, fieldType): fieldType;
                default:
                    throw "fuck";
            };
        field.access = field.access.concat([APublic, AStatic]);

        final thisType =
            switch (tinst) {
                case TInst(thisType, _): thisType;
                default:
                    throw "fuck";
            }

        final fname = field.name;
        final mangled = str(
            thisType.toString().replace(".", "__") + "__" + fname
        );

        final fieldTypePath =
            switch (fieldType) {
                case TPath(fieldTypePath): fieldTypePath;
                default:
                    throw "fuck";
            }
        final c = macro class {
            static function get(): $fieldType {
                return new Persistent($mangled); // TODO: maybe cache instances
            }
        };
        final getter = c.fields[0];
        getter.name = 'get_${fname}';

        trace(new Printer().printField(getter));

        return [ field, getter ];
    }
}
