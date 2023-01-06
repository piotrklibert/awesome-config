package test;

@:publicFields
class Main {
    static function main() {
#if awesome
        AwesomeTest.main();
#else
        LuaTest.main();
#end
    }
}
