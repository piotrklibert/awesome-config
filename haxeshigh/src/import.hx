#if macro
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Compiler;
import haxe.macro.Type;
import haxe.macro.Expr.ComplexType;
import haxe.macro.Printer;

using haxe.macro.ExprTools;
using haxe.macro.TypeTools;
using haxe.macro.TypedExprTools;
using haxe.macro.MacroStringTools;
#end

import haxe.extern.EitherType;

#if !macro
import lua.Table;
import lua.Coroutine as Coro;

import lib.LuaTable;
import lib.Prelude.*;

using lua.PairTools;
using lib.LambdaTools;
using lib.TableTools;
using lib.Globals.Env;
#end

using Lambda;
using Safety;
using StringTools;
