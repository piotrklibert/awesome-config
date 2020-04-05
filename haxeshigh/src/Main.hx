import haxe.ds.Option;
import haxe.DynamicAccess;
import haxe.ds.Either;
import haxe.ds.StringMap;
import haxe.ds.ReadOnlyArray;

import lua.*;
import lua.Table;


// import ex.Inspect;
import ex.Timer;
import ex.Screen;
import ut.Utils;

import app.Taglist;

// using Lambda;
using ut.OptionTools;
using lua.PairTools;
using ut.EitherTools;
import lua.Package;

typedef StringTable<V> = Table<String, V>;
typedef MixedTable<V> = Table<Either<String, Int>, V>;

typedef Log = ut.FileLogger;
// typedef Log = ut.NaughtyLogger;

extern class Widget {
  static function taglist(o: Any): Dynamic;
}


@:nullSafety(Strict)
@:expose
class Main {
  public static final mkLua = () -> Utils.mkLua();
  public static function main() {
    @:nullSafety(Off)
    untyped Package.loaded["out"] = null;
    Package.path = "/home/cji/portless/lua/awesome-config/haxeshigh/?.lua;" + Package.path;
    Log.log("Loaded.");
  }
}
