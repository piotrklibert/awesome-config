package spacerep;

using Reflect;

@:publicFields
class Persistent<T> {
    private var prev: Null<T>;
    final vname: String;

    function new(vname: String) {
        this.vname = vname;
    }

    function get(): Null<T> {
        final env = globals();
        final obj: Null<T> = env[vname];
        return obj;
    }

    function set(obj: T): T {
        final env = globals();
        this.prev = env[vname];
        env[vname] = obj;
        return obj;
    }

    function setSilent(obj: T) {
        final env = globals();
        env[vname] = obj;
        return obj;
    }

    function upgrade(obj: T) {
        final val: Null<T> = this.get();
        if (val == null)
            return this.set(val);
        final fun: Null<Dynamic> = val.field("upgrade");
        if (fun != null)
            return this.set(val.callMethod(fun, [prev]));
        throw new haxe.Exception("Upgrade failed");
    }

    function getOrCreate() {}

    function getPrev() {
        return this.prev;
    }

    function clearPrev() {
        this.prev = null;
    }
}
