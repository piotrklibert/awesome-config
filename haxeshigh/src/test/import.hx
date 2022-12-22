import haxe.Json;
import sys.io.File;
using Lambda;
using StringTools;
using Safety;

#if !macro
import lua.Table;
import lua.Table.AnyTable;
import utils.lua.Macro.A;
import utils.lua.Macro.T;
import lib.Globals.Prelude.*;
import lib.LuaTable;
import lib.Inspect;
// import Console;

using lib.LambdaTools;
using lua.PairTools;
using lib.TableTools;
using lib.IoTools;
#end
