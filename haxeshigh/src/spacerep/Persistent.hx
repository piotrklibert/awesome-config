package spacerep;

using Reflect;

@:publicFields
class Persistent<T: { function upgrade(arg: T): T; }> {
    private var prev: Null<T>;
    final vname: String;

    function new(vname: String) {
        this.vname = vname;
    }

    function get(): T {
        return globals()[vname].sure();
    }

    function getOrNull(): Null<T> {
        return globals()[vname];
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
        trace("Starting upgrade");
        final old: Null<T> = this.getOrNull();
        if (old == null) {
            trace("Upgrade aborted; setting instead");
            return this.set(obj);
        }
        final fun: Null<(T) -> T> = obj.field("upgrade");
        if (fun != null) {
            trace('Upgrade function: $fun');
            return this.set(obj.callMethod(fun, [old]));
        }
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

// Local Variables:
// haxe-module: "hx_spacerep"
// End:
