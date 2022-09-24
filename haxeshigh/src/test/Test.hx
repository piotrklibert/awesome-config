package test;

// Build with:
//   haxe ~/portless/lua/awesome-config/haxeshigh/build/test.hxml
// or:
//   make test
// can compile to Lua:
//   time luajit output/hx_test.lua

import haxe.macro.Context;

class Test {
  public static macro function cp() {
    final cp = Context.getClassPath();
    return macro $v{cp};
  }
  public static function main() {
    final c: Array<String> = cp();
    for (p in c) {
      if (p.length > 0)
        trace(p);
    }
  }
}
