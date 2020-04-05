package ut;

import lua.Table;
import haxe.ds.StringMap;


typedef KeyFunc<T> = Dynamic -> T;


class Utils {
  public static var ident: KeyFunc<Dynamic> = (x) -> x;

  @:nullSafety(Strict)
  public static function filterIn<T>(s: Array<T>, ?t: KeyFunc<T>) {
    final tt: KeyFunc<T> = (t == null ? ident : t);
    return function (x: Dynamic): Bool {
      return s.indexOf(tt(x)) != -1;
    }
  }

  public static function mkLua(){
    return untyped __lua__("{}");
  }

  public static inline function mapToTable<T>(map: StringMap<T>): AnyTable {
    // StringMaps on Lua are built around a table stored in .h key
    return untyped map.h;
  };

  public static function structToTable(s: Dynamic): AnyTable {
    final obj: AnyTable = mkLua();
    for(i in Reflect.fields(s)) untyped {
      obj[i] = s[i];
    }
    return obj;
  }


// typedef StringTable<V> = Table<String, V>
// typedef MixedTable<V> = Table<Either<String, Int>, V>;


}
