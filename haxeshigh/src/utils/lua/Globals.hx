package utils.lua;

// import app.Taglist;


@:luaDotMethod
extern class ExMgr {
  function enable(): Dynamic;
  function disable(): Void;
}


@:native("_G")
extern class Globals implements Dynamic {
  public static var Mgr: ExMgr;
  public static var App: Dynamic;
}
