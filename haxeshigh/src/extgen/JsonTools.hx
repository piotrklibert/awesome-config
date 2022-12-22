package extgen;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Expr.ExprOf;
import haxe.macro.Context.*;
import haxe.macro.TypeTools.*;
import haxe.macro.MacroStringTools.*;
import haxe.Constraints;

using haxe.macro.ExprTools;
using Lambda;

typedef I = {a: Int};

@:publicFields
class JsonTools {
    static macro function test(ee: Expr) {}

    static macro function zzz(ee: ExprOf<TypePath>) {
        trace(ee);
        // final t = macro ({a: 3} : $e{ee});
        // trace(ee);
        // final t = macro $e{ee};
        // final t = macro ({a: 3} : I);
        // trace(t);
        return macro $v{"asdasd"};
    }

    @:generic
    static function someFun2<T>(x: Dynamic) : T {
        zzz(I);
        final xx = (x : T);
        return xx;
        // return 1;
    }

    public static macro function ffff() {
        trace(Context.getLocalModule());
        trace(macro @:doc function(x: Int) {});
        return macro null;
    }

    // autoBuild valueclass example: https://gist.github.com/puffnfresh/5314836
    // https://api.haxe.org/Type.html
    // https://api.haxe.org/Reflect.html
    // https://api.haxe.org/haxe/macro/Context.html
    // https://github.com/HaxeFoundation/haxe/blob/development/tests/unit/src/unit/HelperMacros.hx
	static public macro function nvm(e:Expr) {
		function loop(e:Expr) {
			return switch (e) {
				case macro @:markup $v{(s:String)}:
					formatString(s, e.pos);
				case macro $b{el}:
					el = el.map(loop);
					macro $a{el}.join("");
				case _:
					error("Markup literal expected", e.pos);
			}
		}
		return loop(e);
	}
	static public macro function parseAndPrint(s:String) {
		var e = parse(s, currentPos());
		var s2 = new haxe.macro.Printer().printExpr(e);
		return macro eq($v{s}, $v{s2});
	}

	static public macro function getMeta(e) {
		switch(e.expr) {
			case EMeta(m, _):
				return macro { name: $v{m.name}, args: $a{m.params} };
			default:
				return macro report("Metadata expected");
		}
	}
}
