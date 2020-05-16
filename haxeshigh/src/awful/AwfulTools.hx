package awful;

import utils.lua.Macro as M;
import utils.lua.LuaTools;
import log.Log;

class AwfulTools {
  public static function makeWidget(children: LuaTable, properties: LuaTable): Widget {
    return Widget.widget(children.merge(properties));
  }
}
