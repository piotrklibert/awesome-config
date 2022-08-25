package lib;
// import log.Log;




@:native("_G")
extern class Globals implements Dynamic {
  public static final gtk: Dynamic;
  public static final lgi: Dynamic;


  public static function s(obj: Any): Void; // show_summary
  public static function st(obj: Any): Void; // show_summary + tabular
  public static function gs(obj: Any): String; // get_summary

  public static function ss(obj: Any): Void; // show_full

  // public static function sil(obj: Any): Void; // show_inspect depth=3
  @:native("sil")
  public static function si(obj: Any): Void; // show_inspect

  public static function sf(obj: Any): Void; // show_file

  /**

  The classes below are a representation of app.TaglistManager and app.Taglist.
  They are needed so that the loader and unloader (cleaner) can do their job
  without the need to include the whole app code in them, which would kind of
  defeat the purpose... :)

  **/

  public static var Taglist: Dynamic;
  public static var PackageManager: Null<pkg.PackageManager>;
  // public static var Logger: Null<Class<Log>>;

  public static function clone<T>(x: T): T;
}
