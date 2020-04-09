package utils;

class NullTools {
  public static inline function sure<T>(value:Null<T>):T {
    if (value == null) {
      throw "null pointer in .sure() call";
    }
    return @:nullSafety(Off) (value:T);
  }
  public static inline function or<T>(value:Null<T>, defaultValue:T):T {
    if (value == null) {
      return defaultValue;
    }
    return @:nullSafety(Off) (value:T);
  }
}
