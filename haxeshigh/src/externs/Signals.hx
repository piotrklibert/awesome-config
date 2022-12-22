package externs;


@:luaRequire("signals")
extern class Signals {
    /** Handling of signals.
     * common/luaobject.c:30
     */
    /**
     * Add a signal.
     * @see common/luaobject.c:174
     * @param name String  A signal name.
     * @param func func  A function to call when the signal is emitted.
     */
    static function connect_signal(name: String, func: func);
    /**
     * Remove a signal.
     * @see common/luaobject.c:187
     * @param name String  A signal name.
     * @param func func  A function to remove.
     */
    static function disconnect_signal(name: String, func: func);
    /**
     * Emit a signal.
     * @see common/luaobject.c:264
     * @param name String  A signal name.
     * @param ...rest Dynamic  Various arguments.
     */
    static function emit_signal(name: String, ...rest: Dynamic);
}
