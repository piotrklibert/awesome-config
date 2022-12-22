package externs;


@:luaRequire("xproperties")
extern class Xproperties {
/** Handling of X properties.
 * objects/window.c:32
 */
/**
 * Change a xproperty.
 * @see objects/window.c:430
 * @param name Dynamic  The name of the X11 property
 * @param value Dynamic  The new value for the property
 */
static function set_xproperty(name: Dynamic, value: Dynamic);
/**
 * Get the value of a xproperty.
 * @see objects/window.c:442
 * @param name Dynamic  The name of the X11 property
 */
static function get_xproperty(name: Dynamic);
}
