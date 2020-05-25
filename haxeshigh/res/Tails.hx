class Tails {
  // static function __init__() {
  //   untyped require("luarocks.loader");
  // }

  public static function g(i: Int): Int {
    if (i > 10000000) {
      return i;
    }
    return g(i+1);
  }
  @:keep
  public static function main() {
    trace(g(0));
  }
}
