package log;

import haxe.macro.Context.currentPos as pos;

import haxe.macro.Context;
import haxe.macro.Expr;

class Builder {
    public static macro function build(): Array<Field> {
        return process(Context.getBuildFields());
    }

    #if macro
    static function process(fields: Array<Field>): Array<Field> {
        final cls = macro class {
            function x(){}
        }
        fields.push(cls.fields[0]);
        return fields;
    }
    #end
}
