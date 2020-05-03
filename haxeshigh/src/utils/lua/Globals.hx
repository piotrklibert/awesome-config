package utils.lua;


/**
    The classes below are a representation of app.TaglistManager and
    app.Taglist. They are needed so that the loader and unloader (cleaner) can
    do their job without the need to include the whole app code in them, which
    would kind of defeat the purpose... :)
**/

@:luaDotMethod
extern class ExMgr {
  function enable(): Dynamic;
  function disable(): Void;
}


@:native("_G")
extern class Globals implements Dynamic {
  public static var Mgr: ExMgr;
  public static var App: Dynamic;
  public static var PackageManager: Null<pkg.PackageManager>;
}
