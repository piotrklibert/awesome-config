package externs.gears;


@:luaRequire("gears.protected_call")
extern class Protected_call {
    /** 
     * @see lib/gears/protected_call.lua:7
     */

    /** Call a function in protected mode and handle error-reporting.
     *
     * @see lib/gears/protected_call.lua:47
     * @param func haxe.Constraints.Function  The function to call
     * @param ...rest Dynamic  Arguments to the function
     */
    static function protected_call(func: haxe.Constraints.Function, ...rest: Dynamic): Void;
}

