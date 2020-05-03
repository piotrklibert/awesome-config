package utils;

import haxe.ds.Option;


class OptionTools {
  public static inline function toOption<T>(value:T): Option<T> {
    return Some(value);
  }

  public static inline function sure<T>(value:Option<T>): T {
    switch (value) {
      case None:
        throw "None in OptionTools.sure() call";
      case Some(val):
        return val;
    }
  }

  public static inline function then<T, U>(value: Option<T>, func: (T) -> U): Option<T> {
    switch (value) {
      case Some(v): func(v);
      default:
    }
    return value;
  }

  public static inline function or<T>(value:Option<T>, defaultValue:T): T {
    switch (value) {
      case None:
        return defaultValue;
      case Some(val):
        return val;
    }
  }
}
