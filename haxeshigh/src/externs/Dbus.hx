package externs;


@:luaRequire("dbus")
extern class Dbus {
/** awesome D-Bus API
 * dbus.c:28
 */
/**
 * Register a D-Bus name to receive messages from.
 * @see dbus.c:639
 * @param bus Dynamic  A string indicating if we are using system or session bus.
 * @param name Dynamic  A string with the name of the D-Bus name to register.
 */
static function request_name(bus: Dynamic, name: Dynamic);
/**
 * Release a D-Bus name.
 * @see dbus.c:656
 * @param bus Dynamic  A string indicating if we are using system or session bus.
 * @param name Dynamic  A string with the name of the D-Bus name to unregister.
 */
static function release_name(bus: Dynamic, name: Dynamic);
/**
 * Add a match rule to match messages going through the message bus.
 * @see dbus.c:672
 * @param bus Dynamic  A string indicating if we are using system or session bus.
 * @param name Dynamic  A string with the name of the match rule.
 */
static function add_match(bus: Dynamic, name: Dynamic);
/**
 * Remove a previously added match rule "by value" (the most recently-added identical rule gets removed).
 * @see dbus.c:695
 * @param bus Dynamic  A string indicating if we are using system or session bus.
 * @param name Dynamic  A string with the name of the match rule.
 */
static function remove_match(bus: Dynamic, name: Dynamic);
/**
 * Add a signal receiver on the D-Bus.
 * @see dbus.c:719
 * @param interface Dynamic  A string with the interface name.
 * @param func Dynamic  The function to call.
 */
static function connect_signal(interface: Dynamic, func: Dynamic);
/**
 * Remove a signal receiver on the D-Bus.
 * @see dbus.c:743
 * @param interface Dynamic  A string with the interface name.
 * @param func Dynamic  The function to call.
 */
static function disconnect_signal(interface: Dynamic, func: Dynamic);
/**
 * Emit a signal on the D-Bus.
 * @see dbus.c:767
 * @param bus Dynamic  A string indicating if we are using system or session bus.
 * @param path Dynamic  A string with the dbus path.
 * @param interface Dynamic  A string with the dbus interface.
 * @param method Dynamic  A string with the dbus method name.
 * @param type_1st_arg Dynamic  type of 1st argument
 * @param value_1st_arg Dynamic  value of 1st argument
 * @param type_2nd_arg Dynamic  type of 2nd argument
 * @param value_2nd_arg Dynamic  value of 2nd argument
 ... etc
 */
static function emit_signal(bus: Dynamic, path: Dynamic, interface: Dynamic, method: Dynamic, type_1st_arg: Dynamic, value_1st_arg: Dynamic, type_2nd_arg: Dynamic, value_2nd_arg: Dynamic);
}
