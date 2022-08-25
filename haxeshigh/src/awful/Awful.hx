package awful;

class Awful {
  public static function key(
    mods: Array<String>,
    keyName: String,
    callback: ()->Void,
    props: Map<String, Any>
  ) {

  }
}

private extern class AwfulNative {
  public static function key(arrayTable: lua.AnyTable, s: String, f: Function, dictTable: lua.AnyTable): lua.AnyTable
}
