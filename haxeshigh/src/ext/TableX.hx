package ext;

import haxe.Constraints.Function;

typedef AnyTable = lua.Table<Dynamic, Dynamic>;
typedef ArrayLike<V> = lua.Table<Int, V>;
typedef ObjectLike = lua.Table<String, Dynamic>;
typedef MapLike<K, V> = lua.Table<K, V>;

/**
 * Extended operations on Lua tables.
 */
@:luaRequire("pl/tablex")
extern class TableX {
    /** copy a table into another, in-place.
     * @param t1 AnyTable destination table
     * @param t2 AnyTable source (actually any iterable object)
     */
    static function update(t1: AnyTable, t2: AnyTable) : AnyTable ; // first table;

    /** total number of elements in this table.
     * @param t AnyTable a table
     */
    static function size(t: AnyTable) : Int; // the size;

    /** make a shallow copy of a table
     * @param t AnyTable an iterable source
     */
    static function copy(t: AnyTable) : AnyTable; // new table;

    /** make a deep copy of a table, recursively copying all the keys and fields.
     * @param t AnyTable A table
     */
    static function deepcopy(t: AnyTable) : AnyTable; // new table;

    /** compare two values.
     * @param t1 Dynamic A value
     * @param t2 Dynamic A value
     * @param ignore_mt Bool if true, ignore __eq metamethod (default false)
     * @param eps Int if defined, then used for any number comparisons
     */
    static function deepcompare(t1: Dynamic, t2: Dynamic, ignore_mt: Bool, eps: Int) : Bool; // true or false;

    /** compare two arrays using a predicate.
     * @param t1 ArrayLike<Dynamic> an array
     * @param t2 ArrayLike<Dynamic> an array
     * @param cmp Function A comparison function; `bool = cmp(t1_value, t2_value)`
     */
    static function compare<V>(t1: ArrayLike<V>, t2: ArrayLike<V>, cmp: Function) : Bool; // true or false;

    /** compare two list-like tables using an optional predicate, without regard for element order.
     * @param t1 ArrayLike<Dynamic> a list-like table
     * @param t2 ArrayLike<Dynamic> a list-like table
     * @param cmp Dynamic A comparison function (may be nil)
     */
    static function compare_no_order(t1: ArrayLike<Dynamic>, t2: ArrayLike<Dynamic>, ?cmp: Dynamic) : Bool;

    /** return the index of a value in a list.
     * @param t ArrayLike<Dynamic> A list-like table
     * @param val Dynamic A value
     * @param idx Int index to start; -1 means last element,etc (default 1)
     */
    static function find(t: ArrayLike<Dynamic>, val: Dynamic, idx: Int) : Null<Int>; // index of value or nil if not found;

    /** return the index of a value in a list, searching from the end.
     * @param t ArrayLike<Dynamic> A list-like table
     * @param val Dynamic A value
     * @param idx Dynamic index to start; -1 means last element,etc (default `#t`)
     */
    static function rfind(t: ArrayLike<Dynamic>, val: Dynamic, idx: Dynamic) : Null<Int>; // index of value or nil if not found;

    /** return the index (or key) of a value in a table using a comparison function.
     * @param t AnyTable A table
     * @param cmp Function A comparison function
     * @param arg Dynamic an optional second argument to the function
     */
    static function find_if(t: AnyTable, cmp: Function, arg: Dynamic) : Null<Int>; // index of value, or nil if not found;

    /** return a list of all values in a table indexed by another list.
     * @param tbl AnyTable a table
     * @param idx ArrayLike<Dynamic> an index table (a list of keys)
     */
    static function index_by<K, V>(tbl: lua.Table<K, V>, idxs: ArrayLike<K>) : lua.Table<K, V>; // a list-like table;

    /** apply a function to all values of a table.
     * @param fun Function A function that takes at least one argument
     * @param t AnyTable A table
     * @param ...rest Dynamic optional arguments
     */
    static function map<K, V, Z>(fun: Function, t: lua.Table<K, V>, ...rest: Dynamic) : lua.Table<K, Z>;

    /** apply a function to all values of a list.
     * @param fun Function A function that takes at least one argument
     * @param t ArrayLike<Dynamic> a table (applies to array part)
     * @param ...rest Dynamic optional arguments
     */
    static function imap<V, Z>(fun: Function, t: ArrayLike<V>, ...rest: Dynamic) : ArrayLike<Z>; // a list-like table;

    /** apply a named method to values from a table.
     * @param name String the method name
     * @param t ArrayLike<Dynamic> a list-like table
     * @param ...rest Dynamic any extra arguments to the method
     */
    static function map_named_method(name: String, t: ArrayLike<Dynamic>, ...rest: Dynamic) : Dynamic; // a `List` with the results of the method (1st result only);

    /** apply a function to all values of a table, in-place.
     * @param fun Function A function that takes at least one argument
     * @param t AnyTable a table
     * @param ...rest Dynamic extra arguments passed to `fun`
     */
    static function transform(fun: Function, t: AnyTable, ...rest: Dynamic) : AnyTable;

    /** generate a table of all numbers in a range.
     * @param start Int number
     * @param finish Int number
     * @param step Int make this negative for start < finish
     */
    static function range(start: Int, finish: Int, step: Int) : ArrayLike<Int>;

    /** apply a function to values from two tables.
     * @param fun Function a function of at least two arguments
     * @param t1 AnyTable a table
     * @param t2 AnyTable a table
     * @param ...rest Dynamic extra arguments
     */
    static function map2(fun: Function, t1: AnyTable, t2: AnyTable, ...rest: Dynamic) : AnyTable; // a table;

    /** apply a function to values from two arrays.
     * @param fun Function a function of at least two arguments
     * @param t1 ArrayLike<Dynamic> a list-like table
     * @param t2 ArrayLike<Dynamic> a list-like table
     * @param ...rest Dynamic extra arguments
     */
    static function imap2<V>(fun: Function, t1: ArrayLike<V>, t2: ArrayLike<V>, ...rest: Dynamic) : Dynamic;

    /** 'reduce' a list using a binary function.
     * @param fun Function a function of two arguments
     * @param t ArrayLike<Dynamic> a list-like table
     * @param memo ArrayLike<Dynamic> optional initial memo value. Defaults to first value in table.
     */
    static function reduce<Acc, V, R>(fun: (V, Acc) -> R, t: ArrayLike<V>, memo: V) : R; // the result of the function;

    /** apply a function to all elements of a table.
     * @param t AnyTable a table
     * @param fun Function a function on the elements; `function(value, key, ...)`
     * @param ...rest Dynamic extra arguments passed to `fun`
     */
    static function foreach(t: AnyTable, fun: Function, ...rest: Dynamic) : Dynamic;

    /** apply a function to all elements of a list-like table in order.
     * @param t ArrayLike<Dynamic> a table
     * @param fun Function a function with at least one argument
     * @param ...rest Dynamic optional arguments
     */
    static function foreachi(t: ArrayLike<Dynamic>, fun: Function, ...rest: Dynamic) : Dynamic;

    /** Apply a function to a number of tables.
     * @param fun Dynamic A function that takes as many arguments as there are tables
     * @param ...rest AnyTable n tables
     */
    static function mapn(fun: Dynamic, ...rest: AnyTable) : Dynamic;

    /** call the function with the key and value pairs from a table.
     * @param fun Function A function which will be passed each key and value as arguments, plus any extra arguments to pairmap.
     * @param t AnyTable A table
     * @param ...rest Dynamic optional arguments
     */
    static function pairmap(fun: Function, t: AnyTable, ...rest: Dynamic) : Dynamic;

    /** return all the keys of a table in arbitrary order.
     * @param t AnyTable A list-like table where the values are the keys of the input table
     */
    static function keys(t: AnyTable) : Dynamic;

    /** return all the values of the table in arbitrary order
     * @param t AnyTable A list-like table where the values are the values of the input table
     */
    static function values(t: AnyTable) : Dynamic;

    /** create an index map from a list-like table.
     * @param t ArrayLike<Dynamic> a list-like table
     */
    static function index_map(t: ArrayLike<Dynamic>) : ArrayLike<Dynamic>; // a map-like table;

    /** create a set from a list-like table.
     * @param t ArrayLike<Dynamic> a list-like table
     */
    static function makeset(t: ArrayLike<Dynamic>) : Dynamic; // a set (a map-like table);

    /** combine two tables, either as union or intersection.
     * @param t1 AnyTable a table
     * @param t2 AnyTable a table
     * @param dup Bool true for a union, false for an intersection.
     */
    static function merge(t1: AnyTable, t2: AnyTable, dup: Bool) : Dynamic;

    /** the union of two map-like tables.
     * @param t1 AnyTable a table
     * @param t2 AnyTable a table
     */
    static function union(t1: AnyTable, t2: AnyTable) : AnyTable;

    /** the intersection of two map-like tables.
     * @param t1 AnyTable a table
     * @param t2 AnyTable a table
     */
    static function intersection(t1: AnyTable, t2: AnyTable) : AnyTable;

    /** a new table which is the difference of two tables.
     * @param s1 AnyTable a map-like table or set
     * @param s2 AnyTable a map-like table or set
     * @param symm Bool symmetric difference (default false)
     */
    static function difference(s1: AnyTable, s2: AnyTable, symm: Bool) : AnyTable; // a map-like table or set;

    /** A table where the key/values are the values and value counts of the table.
     * @param t ArrayLike<Dynamic> a list-like table
     * @param cmp Function a function that defines equality (otherwise uses ==)
     */
    static function count_map<V>(t: ArrayLike<V>, cmp: Function) : MapLike<V, Int>; // a map-like table;

    /** filter an array's values using a predicate function
     * @param t ArrayLike<V> a list-like table
     * @param pred Function a boolean function
     * @param arg Dynamic optional argument to be passed as second argument of the predicate
     */
    static function filter<V>(t: ArrayLike<V>, pred: Function, arg: Dynamic) : ArrayLike<V>;

    /** return a table where each element is a table of the ith values of an arbitrary
        number of tables.
        * @param ...rest ArrayLike<V> arrays to be zipped
        */
    static function zip(...rest: ArrayLike<Dynamic>) : ArrayLike<Dynamic>;

    /** copy an array into another one, clearing `dest` after `idest+nsrc`, if necessary.
     * @param dest ArrayLike<V> a list-like table
     * @param src ArrayLike<V> a list-like table
     * @param idest Int where to start copying values into destination
     * @param isrc Int where to start copying values from source
     * @param nsrc Int number of elements to copy from source
     */
    static function icopy<V>(dest: ArrayLike<V>, src: ArrayLike<V>, idest: Int, isrc: Int, nsrc: Int) : ArrayLike<V>;

    /** copy an array into another one.
     * @param dest ArrayLike<V> a list-like table
     * @param src ArrayLike<V> a list-like table
     * @param idest Int where to start copying values into destination
     * @param isrc Int where to start copying values from source
     * @param nsrc Int number of elements to copy from source
     */
    static function move<V>(dest: ArrayLike<V>, src: ArrayLike<V>, idest: Int, isrc: Int, nsrc: Int) : ArrayLike<V>;

    /** Extract a range from a table, like  'string.sub'.
     * @param t ArrayLike<V> a list-like table
     * @param first Int An index
     * @param last Int An index
     */
    static function sub<V>(t: ArrayLike<V>, first: Int, last: Int) : ArrayLike<V>; //a new List;

    /** set an array range to a value.
     * @param t ArrayLike<V> a list-like table
     * @param val Dynamic a value
     * @param i1 Int start range
     * @param i2 Int end range
     */
    static function set<V>(t: ArrayLike<V>, val: V, i1: Int, i2: Int) : ArrayLike<V>;

    /** create a new array of specified size with initial value.
     * @param n Int size
     * @param val Dynamic initial value (can be `nil`, but don't expect `#` to work!)
     */
    @:native("new")
    static function make<V>(n: Int, val: V) : ArrayLike<V>; // the table;

    /** clear out the contents of a table.
     * @param t ArrayLike<V> a list
     * @param istart Dynamic optional start position
     */
    static function clear<V>(t: ArrayLike<V>, istart: Int) : ArrayLike<V>;

    /** insert values into a table.
     * @param t ArrayLike<V> the list
     * @param position Int (default is at end)
     * @param values ArrayLike<V> <no desc>
     */
    static function insertvalues<V>(t: ArrayLike<V>, position: Int, values: ArrayLike<V>) : ArrayLike<V>;

    /** remove a range of values from a table.
     * @param t ArrayLike<V> a list-like table
     * @param i1 Int start index
     * @param i2 Int end index
     */
    static function removevalues<V>(t: ArrayLike<V>, i1: Int, i2: Int) : ArrayLike<V>;

    /** find a value in a table by recursive search.
     * @param t AnyTable the table
     * @param value Dynamic the value
     * @param exclude ArrayLike<V> any tables to avoid searching
     */
    static function search(t: AnyTable, value: Dynamic, exclude: ArrayLike<AnyTable>) : String; // a fieldspec, e.g. 'a.b' or 'math.sin';

    /** return an iterator to a table sorted by its keys
     * @param t AnyTable the table
     * @param f Function an optional comparison function (f(x,y) is true if x < y)
     */
    static function sort(t: AnyTable, f: Function) : lua.NativeIterator<Dynamic>; // an iterator to traverse elements sorted by the keys;

    /** return an iterator to a table sorted by its values
     * @param t AnyTable the table
     * @param f Function an optional comparison function (f(x,y) is true if x < y)
     */
    static function sortv(t: AnyTable, f: Function) : lua.NativeIterator<Dynamic>; // an iterator to traverse elements sorted by the values;

    /** modifies a table to be read only.
     * @param t AnyTable the table
     */
    static function readonly(t: AnyTable) : AnyTable; // the table read only (a proxy).;

}
