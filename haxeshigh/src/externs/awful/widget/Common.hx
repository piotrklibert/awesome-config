package externs.awful.widget;


@:luaRequire("awful.widget.common")
extern class Common {
/** 
 * lib/awful/widget/common.lua:7
 */
/**
 * Common method to create buttons.
 * @see lib/awful/widget/common.lua:23
 * @param buttons lua.Table<String, Dynamic> 
 * @param object Dynamic 
 */
static function common:create_buttons(buttons: lua.Table<String, Dynamic>, object: Dynamic): lua.Table<String, Dynamic>;
/**
 * Common update method.
 * @see lib/awful/widget/common.lua:122
 * @param w Dynamic  The widget.
 * @param buttons lua.Table<String, Dynamic> 
 * @param label func  Function to generate label parameters from an object.
   The function gets passed an object from `objects`, and
   has to return `text`, `bg`, `bg_image`, `icon`.
 * @param data lua.Table<String, Dynamic>  Current data/cache, indexed by objects.
 * @param objects lua.Table<String, Dynamic>  Objects to be displayed / updated.
 * @param args lua.Table<String, Dynamic> 
 */
static function common:list_update(w: Dynamic, buttons: lua.Table<String, Dynamic>, label: func, data: lua.Table<String, Dynamic>, objects: lua.Table<String, Dynamic>, args: lua.Table<String, Dynamic>);
}
