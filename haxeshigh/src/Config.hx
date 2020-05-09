#if macro

class Config {
  public static macro function modnameCap() {
    final modname = haxe.macro.Context.definedValue("load");
    final modname = modname.charAt(0).toUpperCase() + modname.substr(1);
    return macro $v{modname};
  }
  public static macro function modname() {
    final val = haxe.macro.Context.definedValue("load");
    return macro $v{val};
  }
  // public static final load = dd();
}
#end
