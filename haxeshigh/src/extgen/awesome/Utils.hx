package extgen.awesome;

@:publicFields
class Utils {
    static macro function returnIfPresent(
        set: ExprOf<extype.Set<String>>,
        name: ExprOf<String>
    ) {
        return macro {
            if ($set.exists($name)) {
                trace("duplicate", $name);
                return;
            }
            $set.add($name);
        }
    }
}
