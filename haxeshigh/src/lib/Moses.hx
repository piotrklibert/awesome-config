package lib;

import haxe.Constraints;

extern class Ops {
  //  Returns a + b. <em>Aliased as `op.add`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a + b
  public static function add<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a - b. <em>Aliased as `op.sub`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a - b
  public static function sub<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a * b. <em>Aliased as `op.mul`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a * b
  public static function mul<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a / b. <em>Aliased as `op.div`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a / b
  public static function div<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a % b. <em>Aliased as `op.mod`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a % b
  public static function mod<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a ^ b. <em>Aliased as `op.exp`, `op.pow`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a ^ b
  public static function exp<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns -a. <em>Aliased as `op.unm`, `op.neg`</em>.
  //  @param a a value
  //  @return -a
  public static function unm<K, V>(a: LuaTable<K, V>): LuaTable<K, V>;

  //  Performs floor division (//) between `a` and `b`. It rounds the quotient towards minus infinity. <em>Aliased as `op.floordiv`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a // b
  public static function floordiv<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Performs integer division between `a` and `b`. <em>Aliased as `op.intdiv`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a / b
  public static function intdiv<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if a equals b. <em>Aliased as `op.eq`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a == b
  public static function eq<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if a not equals b. <em>Aliased as `op.neq`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a ~= b
  public static function neq<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if a is strictly less than b. <em>Aliased as `op.lt`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a < b
  public static function lt<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if a is strictly greater than b. <em>Aliased as `op.gt`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a > b
  public static function gt<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if a is less or equal to b. <em>Aliased as `op.le`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a <= b
  public static function le<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if a is greater or equal to b. <em>Aliased as `op.ge`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a >= b
  public static function ge<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns logical a and b. <em>Aliased as `op.land`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a and b
  public static function land<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns logical a or b. <em>Aliased as `op.lor`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a or b
  public static function lor<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns logical not a. <em>Aliased as `op.lnot`</em>.
  //  @param a a value
  //  @return not a
  public static function lnot<K, V>(a: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns concatenation of a and b. <em>Aliased as `op.concat`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a .. b
  public static function concat<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the length of a. <em>Aliased as `op.len`</em>.
  //  @param a a value
  //  @return #a
  public static function length<K, V>(a: LuaTable<K, V>): LuaTable<K, V>;
}


@:luaRequire("moses")
extern class Moses {

  //  Table functions
  //  @param t a table
  //  @return the given table, cleared.
  public static function clear<K, V>(t: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterates on key-value pairs, calling `f (v, k)` at every step. <br/><em>Aliased as `forEach`</em>.
  //  @param t a table
  //  @param f a function, prototyped as `f (v, k)`
  //
  public static function each<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterates on integer key-value pairs, calling `f(v, k)` every step.  Only applies to values located at integer keys. The table can be a sparse array.  Iteration will start from the lowest integer key found to the highest one. <br/><em>Aliased as `forEachi`</em>.
  //  @param t a table
  //  @param f a function, prototyped as `f (v, k)`
  //
  public static function eachi<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Collects values at given keys and return them wrapped in an array.
  //  @param t a table
  //  @param ... A variable number of keys to collect values
  //  @return an array-list of values
  public static function at<K, V>(t: LuaTable<K, V>, ks: Rest<LuaTable<K, V>>): LuaTable<K, V>;

  //  Adjusts the value at a given key using a function or a value. In case `f` is a function,  it should be prototyped `f<K, V>(v)`. It does not mutate the given table, but rather returns a new array. In case the given `key` does not exist in `t`, it throws an error.
  //  @param t a table
  //  @param key a key
  //  @param f a function, prototyped as `f(v)` or a value
  //
  public static function (t: LuaTable<K, V>, key: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Counts occurrences of a given value in a table. Uses @{isEqual} to compare values.
  //  @param t a table
  //  @param[opt] val a value to be searched in the table. If not given, the @{size} of the table will be returned
  //  @return the count of occurrences of the given value
  public static function count<K, V>(t: LuaTable<K, V>, val: LuaTable<K, V>): LuaTable<K, V>;

  //  Counts the number of values passing a predicate test. Same as @{count}, but uses an iterator.  Returns the count for values passing the test `f (v, k)`
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (v, k)`
  //  @return the count of values validating the predicate
  public static function countf<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if all values in a collection are equal. Uses an optional `comp` function which is used to compare values and defaults to @{isEqual} when not given. <br/><em>Aliased as `alleq`</em>.
  //  @param t a table
  //  @param[opt] comp a comparison function. Defaults to `isEqual`
  //  @return `true` when all values in `t` are equal, `false` otherwise.
  public static function allEqual<K, V>(t: LuaTable<K, V>, comp: LuaTable<K, V>): LuaTable<K, V>;

  //  Loops `n` times through a table. In case `n` is omitted, it will loop forever. In case `n` is lower or equal to 0, it returns an empty function. <br/><em>Aliased as `loop`</em>.
  //  @param t a table
  //  @param[opt] n the number of loops
  //  @return an iterator function yielding value-key pairs from the passed-in table.
  public static function cycle<K, V>(t: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Maps `f (v, k)` on value-key pairs, collects and returns the results.  Uses `pairs` to iterate over elements in `t`. <br/><em>Aliased as `collect`</em>.
  //  @param t a table
  //  @param f  an iterator function, prototyped as `f (v, k)`
  //  @return a table of results
  public static function map<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Maps `f (v, k)` on value-key pairs, collects and returns the results.  Uses `ipairs` to iterate over elements in `t`.
  //  @param t a table
  //  @param f  an iterator function, prototyped as `f (v, k)`
  //  @return a table of results
  public static function mapi<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Reduces a table, left-to-right. Folds the table from the first element to the last element to a single value, using a given iterator and an initial state. The iterator takes a state and a value and returns a new state. <br/><em>Aliased as `inject`, `foldl`</em>.
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param[opt] state an initial state of reduction. Defaults to the first value in the table.
  //  @return the final state of reduction
  public static function reduce<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>, state: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the best value passing a selector function. Acts as a special case of
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @return the final state of reduction
  public static function best<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Reduces values in a table passing a given predicate. Folds the table left-to-right, considering only values validating a given predicate.
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param pred a predicate function `pred (v, k)` to select values to be considered for reduction
  //  @param[opt] state an initial state of reduction. Defaults to the first value in the table of selected values.
  //  @param[optchain] ... optional args to be passed to `pred`
  //  @return the final state of reduction
  public static function reduceBy<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>, pred: LuaTable<K, V>, state: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Reduces a table, right-to-left. Folds the table from the last element to the first element  to single value, using a given iterator and an initial state. The iterator takes a state and a value, and returns a new state. <br/><em>Aliased as `injectr`, `foldr`</em>.
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param[opt] state an initial state of reduction. Defaults to the last value in the table.
  //  @return the final state of reduction
  public static function reduceRight<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>, state: LuaTable<K, V>): LuaTable<K, V>;

  //  Reduces a table while saving intermediate states. Folds the table left-to-right using a given iterator and an initial state. The iterator takes a state and a value,  and returns a new state. The result is an array of intermediate states. <br/><em>Aliased as `mapr`</em>
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param[opt] state an initial state of reduction. Defaults to the first value in the table.
  //  @return an array of states
  public static function mapReduce<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>, state: LuaTable<K, V>): LuaTable<K, V>;

  //  Reduces a table while saving intermediate states. Folds the table right-to-left using a given iterator and an initial state. The iterator takes a state and a value,  and returns a new state. The result is an array of intermediate states. <br/><em>Aliased as `maprr`</em>
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param[opt] state an initial state of reduction. Defaults to the last value in the table.
  //  @return an array of states
  public static function mapReduceRight<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>, state: LuaTable<K, V>): LuaTable<K, V>;

  //  Performs a linear search for a value in a table. It does not work for nested tables. The given value can be a function prototyped as `f <K, V>(v, value)` which should return true when any v in the table equals the value being searched.  <br/><em>Aliased as `any`, `some`, `contains`</em>
  //  @param t a table
  //  @param value a value to search for
  //  @return a boolean : `true` when found, `false` otherwise
  public static function include<K, V>(t: LuaTable<K, V>, value: LuaTable<K, V>): LuaTable<K, V>;

  //  Performs a linear search for a value in a table. Returns the key of the value if found. The given value can be a function prototyped as `f <K, V>(v, value)` which should return true when any v in the table equals the value being searched. This function is similar to @{find},  which is mostly meant to work with array.
  //  @param t a table
  //  @param value a value to search for
  //  @return the key of the value when found or __nil__
  public static function detect<K, V>(t: LuaTable<K, V>, value: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns all values having specified keys `props`.
  //  @param t a table
  //  @param props a set of keys
  //  @return an array of values from the passed-in table
  public static function where<K, V>(t: LuaTable<K, V>, props: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the first value having specified keys `props`.
  //  @param t a table
  //  @param props a set of keys
  //  @return a value from the passed-in table
  public static function findWhere<K, V>(t: LuaTable<K, V>, props: LuaTable<K, V>): LuaTable<K, V>;

  //  Selects and returns values passing an iterator test. <br/><em>Aliased as `filter`</em>.
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (v, k)`
  //  @return the selected values
  public static function select<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Clones a table while dropping values passing an iterator test. <br/><em>Aliased as `discard`</em>
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (v, k)`
  //  @return the remaining values
  public static function reject<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if all values in a table are passing an iterator test. <br/><em>Aliased as `every`</em>
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (v, k)`
  //  @return `true` if all values passes the predicate, `false` otherwise
  public static function all<K, V>(t: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Invokes a method on each value in a table.
  //  @param t a table
  //  @param method a function, prototyped as `f (v, k)`
  //  @return the result of the call `f (v, k)`
  public static function invoke<K, V>(t: LuaTable<K, V>, method: LuaTable<K, V>): LuaTable<K, V>;

  //  Extracts values in a table having a given key.
  //  @param t a table
  //  @param key a key, will be used to index in each value: `value[key]`
  //  @return an array of values having the given key
  public static function pluck<K, V>(t: LuaTable<K, V>, key: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the max value in a collection. If a `transform` function is passed, it will be used to evaluate values by which all objects will be sorted.
  //  @param t a table
  //  @param[opt] transform a transformation function, prototyped as `transform <K, V>(v, k)`, defaults to @{identity}
  //  @return the max value found
  public static function max<K, V>(t: LuaTable<K, V>, transform: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the min value in a collection. If a `transform` function is passed, it will be used to evaluate values by which all objects will be sorted.
  //  @param t a table
  //  @param[opt] transform a transformation function, prototyped as `transform <K, V>(v, k)`, defaults to @{identity}
  //  @return the min value found
  public static function min<K, V>(t: LuaTable<K, V>, transform: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if two tables are the same. It compares if both tables features the same values, but not necessarily at the same keys.
  //  @param a a table
  //  @param b another table
  //  @return `true` or `false`
  public static function same<K, V>(a: LuaTable<K, V>, b: LuaTable<K, V>): LuaTable<K, V>;

  //  Sorts a table, in-place. If a comparison function is given, it will be used to sort values.
  //  @param t a table
  //  @param[opt] comp a comparison function prototyped as `comp <K, V>(a, b)`, defaults to <tt><</tt>
  //  @return the given table, sorted.
  public static function sort<K, V>(t: LuaTable<K, V>, comp: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterates on values with respect to key order. Keys are sorted using `comp` function which defaults to `math.min`. It returns upon each call a `key, value` pair.
  //  @param t a table
  //  @param[opt] comp a comparison function. Defaults to `<` operator
  //  @return an iterator function
  public static function sortedk<K, V>(t: LuaTable<K, V>, comp: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterates on values with respect to values order. Values are sorted using `comp` function which defaults to `math.min`. It returns upon each call a `key, value` pair.
  //  @param t a table
  //  @param[opt] comp a comparison function. Defaults to `<` operator
  //  @return an iterator function
  public static function sortedv<K, V>(t: LuaTable<K, V>, comp: LuaTable<K, V>): LuaTable<K, V>;

  //  Sorts a table in-place using a transform. Values are ranked in a custom order of the results of running `transform (v)` on all values. `transform` may also be a string name property  sort by.  `comp` is a comparison function.
  //  @param t a table
  //  @param[opt] transform a `transform` function to sort elements prototyped as `transform <K, V>(v)`. Defaults to @{identity}
  //  @param[optchain] comp a comparison function, defaults to the `<` operator
  //  @return a new array of sorted values
  public static function sortBy<K, V>(t: LuaTable<K, V>, transform: LuaTable<K, V>, comp: LuaTable<K, V>): LuaTable<K, V>;

  //  Splits a table into subsets groups.
  //  @param t a table
  //  @param iter an iterator function, prototyped as `iter (v, k)`
  //  @return a table of subsets groups
  public static function groupBy<K, V>(t: LuaTable<K, V>, iter: LuaTable<K, V>): LuaTable<K, V>;

  //  Groups values in a collection and counts them.
  //  @param t a table
  //  @param iter an iterator function, prototyped as `iter (v, k)`
  //  @return a table of subsets groups names paired with their count
  public static function countBy<K, V>(t: LuaTable<K, V>, iter: LuaTable<K, V>): LuaTable<K, V>;

  //  Counts the number of values in a collection. If being passed more than one argument it will return the count of all passed-in arguments.
  //  @param[opt] ... Optional variable number of arguments
  //  @return a count
  public static function size<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if all the keys of `other` table exists in table `t`. It does not compares values. The test is not commutative, i.e table `t` may contains keys not existing in `other`.
  //  @param t a table
  //  @param other another table
  //  @return `true` or `false`
  public static function containsKeys<K, V>(t: LuaTable<K, V>, other: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if both given tables have the same keys. It does not compares values.
  //  @param tA a table
  //  @param tB another table
  //  @return `true` or `false`
  public static function sameKeys<K, V>(tA: LuaTable<K, V>, tB: LuaTable<K, V>): LuaTable<K, V>;

  //  Array functions
  //  @param array an array
  //  @param[opt] n a number of elements to be sampled. Defaults to 1.
  //  @param[optchain] seed an optional seed for shuffling
  //  @return an array of selected values
  public static function sample<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>, seed: LuaTable<K, V>): LuaTable<K, V>;

  //  Return elements from a sequence with a given probability. It considers each value independently.  Providing a seed will result in deterministic sampling. Given the same seed it will return the same sample every time.
  //  @param array an array
  //  @param prob a probability for each element in array to be selected
  //  @param[opt] seed an optional seed for deterministic sampling
  //  @return an array of selected values
  public static function sampleProb<K, V>(array: LuaTable<K, V>, prob: LuaTable<K, V>, seed: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the n-top values satisfying a predicate. It takes a comparison function `comp` used to sort array values, and then picks the top n-values. It leaves the original array untouched.
  //  @param array an array
  //  @param[opt] n a number of values to retrieve. Defaults to 1.
  //  @param[optchain] comp a comparison function. Defaults to `<`
  //  @return an array of top n values
  public static function nsorted<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>, comp: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a shuffled copy of a given array. If a seed is provided, it will be used to init the built-in pseudo random number generator (using `math.randomseed`).
  //  @param array an array
  //  @param[opt] seed a seed
  //  @return a shuffled copy of the given array
  public static function shuffle<K, V>(array: LuaTable<K, V>, seed: LuaTable<K, V>): LuaTable<K, V>;

  //  Converts a list of arguments to an array.
  //  @param ... a list of arguments
  //  @return an array of all passed-in args
  public static function pack<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Looks for the first occurrence of a given value in an array. Returns the value index if found. Uses @{isEqual} to compare values.
  //  @param array an array of values
  //  @param value a value to lookup for
  //  @param[opt] from the index from where the search will start. Defaults to 1.
  //  @return the index of the value if found in the array, `nil` otherwise.
  public static function find<K, V>(array: LuaTable<K, V>, value: LuaTable<K, V>, from: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns an array where values are in reverse order. The passed-in array should not be sparse.
  //  @param array an array
  //  @return a reversed array
  public static function reverse<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Replaces elements in a given array with a given value. In case `i` and `j` are given it will only replaces values at indexes between `[i,j]`. In case `j` is greater than the array size, it will append new values, increasing the array size.
  //  @param array an array
  //  @param value a value
  //  @param[opt] i the index from which to start replacing values. Defaults to 1.
  //  @param[optchain] j the index where to stop replacing values. Defaults to the array size.
  //  @return the original array with values changed
  public static function fill<K, V>(array: LuaTable<K, V>, value: LuaTable<K, V>, i: LuaTable<K, V>, j: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns an array of `n` zeros.
  //  @param n a number
  //  @return an array
  public static function zeros<K, V>(n: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns an array of `n` 1's.
  //  @param n a number
  //  @return an array
  public static function ones<K, V>(n: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns an array of `n` times a given value.
  //  @param value a value
  //  @param n a number
  //  @return an array
  public static function vector<K, V>(value: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Collects values from a given array. The passed-in array should not be sparse. This function collects values as long as they satisfy a given predicate and returns on the first falsy test. <br/><em>Aliased as `takeWhile`</em>
  //  @param array an array
  //  @param f an iterator function prototyped as `f <K, V>(v, k)`
  //  @return a new table containing all values collected
  public static function selectWhile<K, V>(array: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Collects values from a given array. The passed-in array should not be sparse. This function collects values as long as they do not satisfy a given predicate and returns on the first truthy test. <br/><em>Aliased as `rejectWhile`</em>
  //  @param array an array
  //  @param f an iterator function prototyped as `f <K, V>(v, k)`
  //  @return a new table containing all values collected
  public static function dropWhile<K, V>(array: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the index at which a value should be inserted. This index is evaluated so  that it maintains the sort. If a comparison function is passed, it will be used to sort values.
  //  @param array an array
  //  @param the value to be inserted
  //  @param[opt] comp an comparison function prototyped as `f <K, V>(a, b)`, defaults to <tt><</tt>
  //  @param[optchain] sort whether or not the passed-in array should be sorted
  //  @return number the index at which the passed-in value should be inserted
  public static function sortedIndex<K, V>(array: LuaTable<K, V>, the: LuaTable<K, V>, comp: LuaTable<K, V>, sort: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the index of the first occurrence of value in an array.
  //  @param array an array
  //  @param value the value to search for
  //  @return the index of the passed-in value
  public static function indexOf<K, V>(array: LuaTable<K, V>, value: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the index of the last occurrence of value in an array.
  //  @param array an array
  //  @param value the value to search for
  //  @return the index of the last occurrence of the passed-in value or __nil__
  public static function lastIndexOf<K, V>(array: LuaTable<K, V>, value: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the first index at which a predicate returns true.
  //  @param array an array
  //  @param pred a predicate function prototyped as `pred <K, V>(v, k)`
  //  @return the index found or __nil__
  public static function findIndex<K, V>(array: LuaTable<K, V>, pred: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the last index at which a predicate returns true.
  //  @param array an array
  //  @param pred a predicate function prototyped as `pred <K, V>(k, v)`
  //  @return the index found or __nil__
  public static function findLastIndex<K, V>(array: LuaTable<K, V>, pred: LuaTable<K, V>): LuaTable<K, V>;

  //  Adds all passed-in values at the top of an array. The last elements will bubble to the top of the given array.
  //  @param array an array
  //  @param ... a variable number of arguments
  //  @return the passed-in array with new values added
  public static function addTop<K, V>(array: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Adds all passed-in values at the top of an array. As opposed to @{addTop}, it preserves the order of the passed-in elements.
  //  @param array an array
  //  @param ... a variable number of arguments
  //  @return the passed-in array with new values added
  public static function prepend<K, V>(array: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Pushes all passed-in values at the end of an array.
  //  @param array an array
  //  @param ... a variable number of arguments
  //  @return the passed-in array with new added values
  public static function push<K, V>(array: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Removes and returns the values at the top of a given array. <br/><em>Aliased as `pop`</em>
  //  @param array an array
  //  @param[opt] n the number of values to be popped. Defaults to 1.
  //  @return the popped values
  public static function shift<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Removes and returns the values at the end of a given array.
  //  @param array an array
  //  @param[opt] n the number of values to be unshifted. Defaults to 1.
  //  @return the values
  public static function unshift<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Removes all provided values in a given array. <br/><em>Aliased as `remove`</em>
  //  @param array an array
  //  @param ... a variable number of values to be removed from the array
  //  @return the passed-in array with values removed
  public static function pull<K, V>(array: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Removes values at an index within the range `[start, finish]`. <br/><em>Aliased as `rmRange`, `chop`</em>
  //  @param array an array
  //  @param[opt] start the lower bound index, defaults to the first index in the array.
  //  @param[optchain] finish the upper bound index, defaults to the array length.
  //  @return the passed-in array with values removed
  public static function removeRange<K, V>(array: LuaTable<K, V>, start: LuaTable<K, V>, finish: LuaTable<K, V>): LuaTable<K, V>;

  //  Chunks together consecutive values. Values are chunked on the basis of the return value of a provided predicate `f (v, k)`. Consecutive elements which return  the same value are chunked together. Leaves the first argument untouched if it is not an array.
  //  @param array an array
  //  @param f an iterator function prototyped as `f <K, V>(v, k)`. Defaults to @{identity}.
  //  @return a table of chunks (arrays)
  public static function chunk<K, V>(array: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Slices values indexed within `[start, finish]` range. <br/><em>Aliased as `M.sub`</em>
  //  @param array an array
  //  @param[opt] start the lower bound index, defaults to the first index in the array.
  //  @param[optchain] finish the upper bound index, defaults to the array length.
  //  @return a new array of sliced values
  public static function slice<K, V>(array: LuaTable<K, V>, start: LuaTable<K, V>, finish: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the first N values in an array. <br/><em>Aliased as `head`, `take` </em>
  //  @param array an array
  //  @param[opt] n the number of values to be collected, defaults to 1.
  //  @return a new array
  public static function first<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns all values in an array excluding the last N values.
  //  @param array an array
  //  @param[opt] n the number of values to be left, defaults to the array length.
  //  @return a new array
  public static function initial<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the last N values in an array.
  //  @param array an array
  //  @param[opt] n the number of values to be collected, defaults to the array length.
  //  @return a new array
  public static function last<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns all values after index. <br/><em>Aliased as `tail`</em>
  //  @param array an array
  //  @param[opt] index an index, defaults to 1
  //  @return a new array
  public static function rest<K, V>(array: LuaTable<K, V>, index: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the value at a given index.
  //  @param array an array
  //  @param index an index
  //  @return the value at the given index
  public static function nth<K, V>(array: LuaTable<K, V>, index: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns all truthy values (removes `falses` and `nils`).
  //  @param array an array
  //  @return a new array
  public static function compact<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Flattens a nested array. Passing `shallow` will only flatten at the first level.
  //  @param array an array
  //  @param[opt] shallow specifies the flattening depth. Defaults to `false`.`
  //  @return a flattened array
  public static function flatten<K, V>(array: LuaTable<K, V>, shallow: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns values from an array not present in all passed-in args. <br/><em>Aliased as `without` and `diff`</em>
  //  @param array an array
  //  @param another array
  //  @return a new array
  public static function difference<K, V>(array: LuaTable<K, V>, another: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the duplicate-free union of all passed in arrays.
  //  @param ... a variable number of arrays arguments
  //  @return a new array
  public static function union<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the  intersection of all passed-in arrays. Each value in the result is present in each of the passed-in arrays.
  //  @param ... a variable number of array arguments
  //  @return a new array
  public static function intersection<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if all passed in arrays are disjunct.
  //  @param ... a variable number of arrays
  //  @return `true` if the intersection of all arrays is not empty, `false` otherwise.
  public static function disjoint<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Performs a symmetric difference. Returns values from `array` not present in `array2` and also values from `array2` not present in `array`. <br/><em>Aliased as `symdiff`</em>
  //  @param array an array
  //  @param array2 another array
  //  @return a new array
  public static function symmetricDifference<K, V>(array: LuaTable<K, V>, array2: LuaTable<K, V>): LuaTable<K, V>;

  //  Produces a duplicate-free version of a given array. <br/><em>Aliased as `uniq`</em>
  //  @param array an array
  //  @return a new array, duplicate-free
  public static function unique<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if a given array contains distinct values. Such an array is made of distinct elements, which only occur once in this array. <br/><em>Aliased as `isuniq`</em>
  //  @param array an array
  //  @return `true` if the given array is unique, `false` otherwise.
  public static function isunique<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns an array list of all duplicates in array.
  //  @param array an array
  //  @return an array-list of duplicates
  public static function duplicates<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Merges values of each of the passed-in arrays in subsets. Only values indexed with the same key in the given arrays are merged in the same subset. <br/><em>Aliased as `transpose`</em>
  //  @param ... a variable number of array arguments
  //  @return a new array
  public static function zip<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Merges values using a given function. Only values indexed with the same key in the given arrays are merged in the same subset. Function `f` is used to combine values. <br/><em>Aliased as `transposeWith`</em>
  //  @param f a function
  //  @param ... a variable number of array arguments
  //  @return a flat array of results
  public static function zipWith<K, V>(f: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Clones array and appends values from another array.
  //  @param array an array
  //  @param other an array
  //  @return a new array
  public static function append<K, V>(array: LuaTable<K, V>, other: LuaTable<K, V>): LuaTable<K, V>;

  //  Interleaves arrays. It returns a single array made of values from all passed in arrays in their given order, interleaved.
  //  @param ... a variable list of arrays
  //  @return a new array
  public static function interleave<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Interposes value in-between consecutive pair of values in array. <br/><em>Aliased as `intersperse`</em>
  //  @param array an array
  //  @param value a value
  //  @return a new array
  public static function interpose<K, V>(array: LuaTable<K, V>, value: LuaTable<K, V>): LuaTable<K, V>;

  //  Produces a flexible list of numbers. If one value is passed, will count from 1 to that value, with a default step of 1 (or -1). If two values are passed, will count from the first one to the second one, using a default step of 1 (or -1). A third value passed will be considered a step value.
  //  @param[opt] from the initial value of the range
  //  @param[optchain] to the final value of the range
  //  @param[optchain] step the step of count. Defaults to 1 or -1.
  //  @return a new array of numbers
  public static function range<K, V>(from: LuaTable<K, V>, to: LuaTable<K, V>, step: LuaTable<K, V>): LuaTable<K, V>;

  //  Creates an array list of `n` values, repeated.
  //  @param value a value to be repeated
  //  @param n the number of repetitions of value.
  //  @return a new array of `n` values
  public static function rep<K, V>(value: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the powerset of array values. For instance, when given the set {1,2,3}, returns `{{},{1},{2},{3},{1,2},{2,3},{1,3},{1,2,3}}`.
  //  @param array an array
  //  @return an array
  public static function powerset<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterator returning partitions of an array. It returns arrays of length `n`  made of values from the given array. If the last partition has lower elements than `n` and  `pad` is supplied, it will be adjusted to `n` of elements with `pad` value.
  //  @param array an array
  //  @param[opt] n the size of partitions. Defaults to 1.
  //  @param[optchain] pads a value to adjust the last subsequence to the `n` elements
  //  @return an iterator function
  public static function partition<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>, pads: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterator returning overlapping partitions of an array.  If the last subsequence has lower elements than `n` and `pad` is  supplied, it will be adjusted to `n` elements with `pad` value.
  //  @param array an array
  //  @param[opt] n the size of partitions. Defaults to 2.
  //  @param[optchain] pads a value to adjust the last subsequence to the `n` elements
  //  @return an iterator function
  public static function overlapping<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>, pads: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterator returning sliding partitions of an array. <br/><em>Aliased as `sliding`</em>
  //  @param array an array
  //  @param[opt] n the size of partitions. Defaults to 2 (and then behaves like @{pairwise})
  //  @return an iterator function
  public static function aperture<K, V>(array: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterator returning sliding pairs of an array.
  //  @param array an array
  //  @return an iterator function
  public static function pairwise<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterator returning the permutations of an array. It returns arrays made of all values from the passed-in array, with values permuted.
  //  @param array an array
  //  @return an iterator function
  public static function permutation<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Concatenates values in a given array. Handles booleans as well. If `sep` string is passed, it will be used as a separator. Passing `i` and `j` will result in concatenating only values within `[i, j]` range. <br/><em>Aliased as `join`</em>
  //  @param array a given array
  //  @param[opt] sep a separator string, defaults to the empty string `''`.
  //  @param[optchain] i the starting index, defaults to 1.
  //  @param[optchain] j the final index, defaults to the array length.
  //  @return a string
  public static function concat<K, V>(array: LuaTable<K, V>, sep: LuaTable<K, V>, i: LuaTable<K, V>, j: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns all possible pairs built from given arrays.
  //  @param array a first array
  //  @param array2 a second array
  //  @return an array list of all pairs
  public static function xprod<K, V>(array: LuaTable<K, V>, array2: LuaTable<K, V>): LuaTable<K, V>;

  //  Creates pairs from value and array. Value is always prepended to the pair.
  //  @param valua a value
  //  @param array an array
  //  @return an array list of all pairs
  public static function xpairs<K, V>(valua: LuaTable<K, V>, array: LuaTable<K, V>): LuaTable<K, V>;

  //  Creates pairs from value and array. Value is always appended as the last item to the pair.
  //  @param valua a value
  //  @param array an array
  //  @return an array list of all pairs
  public static function xpairsRight<K, V>(valua: LuaTable<K, V>, array: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the sum of array values.
  //  @param array a given array
  //  @return the sum of array values
  public static function sum<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the product of array values.
  //  @param array a given array
  //  @return the product of array values
  public static function product<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the mean of an array of numbers. <br/><em>Aliased as `average`</em>
  //  @param array an array of numbers
  //  @return a number
  public static function mean<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the median of an array of numbers.
  //  @param array an array of numbers
  //  @return a number
  public static function median<K, V>(array: LuaTable<K, V>): LuaTable<K, V>;

  //  Utility functions

  //  @return nothing
  public static function noop<K, V>(): LuaTable<K, V>;

  //  Returns the passed-in value. This function is used internally as a default iterator.
  //  @param value a value
  //  @return the passed-in value
  public static function identity<K, V>(value: LuaTable<K, V>): LuaTable<K, V>;

  //  Calls `f` with the supplied arguments. Returns the results of `f(...)`.
  //  @param f a function
  //  @param[opt] ... a vararg list of args to `f`
  //  @return the result of `f(...)` call.
  public static function call<K, V>(f: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Creates a constant function which returns the same output on every call. <br/><em>Aliased as `always`</em>
  //  @param value a constant value
  //  @return a constant function
  public static function constant<K, V>(value: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a function which applies `specs` on args. This function produces an object having the same structure than `specs` by mapping each property to the result of calling its  associated function with the supplied arguments
  //  @param specs a table
  //  @return a function
  public static function applySpec<K, V>(specs: LuaTable<K, V>): LuaTable<K, V>;

  //  Threads `value` through a series of functions. If a function expects more than one args, it can be specified using an array list, where the first item is the function and the following are the remaining args neeeded. The value is used as the first input.
  //  @param value a value
  //  @param ... a vararg list of functions or arrays
  //  @return a value
  public static function thread<K, V>(value: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Threads `value` through a series of functions. If a function expects more than one args, it can be specified using an array list, where the first item is the function and the following are the remaining args neeeded. The value is used as the last input.
  //  @param value a value
  //  @param ... a vararg list of functions or arrays
  //  @return a value
  public static function threadRight<K, V>(value: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a dispatching function. When called with arguments, this function invokes each of its functions in the passed-in order and returns the results of the first non-nil evaluation.
  //  @param ... a vararg list of functions
  //  @return a dispatch function
  public static function dispatch<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Memoizes a given function by caching the computed result. Useful for speeding-up slow-running functions. <br/><em>Aliased as `cache`</em>
  //  @param f a function
  //  @return a new function
  public static function memoize<K, V>(f: LuaTable<K, V>): LuaTable<K, V>;

  //  Builds a list from a seed value. Accepts an iterator function, which  returns either nil to stop iteration or two values : the value to add to the list of results and the seed to be used in the next call to the iterator function.
  //  @param f an iterator function
  //  @param seed a seed value
  //  @return an array of values
  public static function unfold<K, V>(f: LuaTable<K, V>, seed: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a version of `f` that runs only once. Successive calls to `f` will keep yielding the same output, no matter what the passed-in arguments are.  It can be used to initialize variables.
  //  @param f a function
  //  @return a new function
  public static function once<K, V>(f: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a version of `f` that will run no more than <em>count</em> times. Next calls will keep yielding the results of the count-th call.
  //  @param f a function
  //  @param count a count
  //  @return a new function
  public static function before<K, V>(f: LuaTable<K, V>, count: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a version of `f` that runs on the `count-th` call. Useful when dealing with asynchronous tasks.
  //  @param f a function
  //  @param count the number of calls before `f` will start running.
  //  @return a new function
  public static function after<K, V>(f: LuaTable<K, V>, count: LuaTable<K, V>): LuaTable<K, V>;

  //  Composes functions. Each passed-in function consumes the return value of the function that follows. In math terms, composing the functions `f`, `g`, and `h` produces the function `f<K, V>(g(h(...)))`.
  //  @param ... a variable number of functions
  //  @return a new function
  public static function compose<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Pipes a value through a series of functions. In math terms,  given some functions `f`, `g`, and `h` in that order, it returns `f(g(h(value)))`.
  //  @param value a value
  //  @param ... a variable number of functions
  //  @return the result of the composition of function calls.
  public static function pipe<K, V>(value: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the logical complement of a given function. For a given input, the returned  function will output `false` if the original function would have returned `true`,  and vice-versa.
  //  @param f a function
  //  @return  the logical complement of the given function `f`.
  public static function complement<K, V>(f: LuaTable<K, V>): LuaTable<K, V>;

  //  Calls a sequence of passed-in functions with the same argument. Returns a sequence of results.  <br/><em>Aliased as `juxt`</em>
  //  @param value a value
  //  @param ... a variable number of functions
  //  @return a list of results
  public static function juxtapose<K, V>(value: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Wraps `f` inside of the `wrapper` function. It passes `f` as the first argument to `wrapper`. This allows the wrapper to execute code before and after `f` runs, adjust the arguments, and execute it conditionally.
  //  @param f a function to be wrapped, prototyped as `f <K, V>(...)`
  //  @param wrapper a wrapper function, prototyped as `wrapper (f, ...)`
  //  @return the results
  public static function wrap<K, V>(f: LuaTable<K, V>, wrapper: LuaTable<K, V>): LuaTable<K, V>;

  //  Runs `iter` function `n` times. Collects the results of each run and returns them in an array.
  //  @param  iter an iterator function, prototyped as `iter (i)`
  //  @param[opt] n the number of times `iter` should be called. Defaults to 1.
  //  @return table an array of results
  public static function times<K, V>(iter: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Binds `v` to be the first argument to `f`. Calling `f (...)` will result to `f (v, ...)`.
  //  @param f a function
  //  @param v a value
  //  @return a function
  public static function bind<K, V>(f: LuaTable<K, V>, v: LuaTable<K, V>): LuaTable<K, V>;

  //  Binds `v` to be the second argument to `f`. Calling `f (a, ...)` will result to `f (a, v, ...)`.
  //  @param f a function
  //  @param v a value
  //  @return a function
  public static function bind2<K, V>(f: LuaTable<K, V>, v: LuaTable<K, V>): LuaTable<K, V>;

  //  Binds `...` to be the N-first arguments to function `f`.  Calling `f (a1, a2, ..., aN)` will result to `f (..., a1, a2, ...,aN)`.
  //  @param f a function
  //  @param ... a variable number of arguments
  //  @return a function
  public static function bindn<K, V>(f: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Binds methods to object. As such, whenever any of these methods is invoked, it  always receives the object as its first argument.
  //  @param obj an abject
  //  @param ... a variable number of method names
  //  @return the passed-in object with all methods bound to the object itself.
  public static function bindall<K, V>(obj: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a function which iterate over a set of conditions. It invokes each predicate, passing it given values. It returns the value of the corresponding function of the first  predicate to return a non-nil value.
  //  @param conds an array list of predicate-function pairs
  //  @return the result of invoking `f<K, V>(...)` of the first predicate to return a non-nil value
  public static function cond<K, V>(conds: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a validation function. Given a set of functions, the validation function evaluates to `true` only when all its funcs returns `true`.
  //  @param ... an array list of functions
  //  @return `true` when all given funcs returns true with input, false otherwise
  public static function both<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a validation function. Given a set of functions, the validation function evaluates to `true` when at least one of its funcs returns `true`.
  //  @param ... an array list of functions
  //  @return `true` when one of the given funcs returns `true` with input, `false` otherwise
  public static function either<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a validation function. Given a set of functions, the validation function evaluates to `true` when neither of its func return `true`.
  //  @param ... an array list of functions
  //  @return `true` when neither of the given funcs returns `true` with input, `false` otherwise
  public static function neither<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Generates an unique ID for the current session. If given a string `template`, it will use this template for output formatting. Otherwise, if `template` is a function, it will evaluate `template (id)`. <br/><em>Aliased as `uid`</em>.
  //  @param[opt] template either a string or a function template to format the ID
  //  @return value an ID
  public static function uniqueId<K, V>(template: LuaTable<K, V>): LuaTable<K, V>;

  //  Produces an iterator which repeatedly apply a function `f` onto an input.  Yields `value`, then `f(value)`, then `f(f(value))`, continuously. <br/><em>Aliased as `iter`</em>.
  //  @param f a function
  //  @param value an initial input to `f`
  //  @param[opt] n the number of times the iterator should run
  //  @return an iterator function
  public static function iterator<K, V>(f: LuaTable<K, V>, value: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Consumes the first `n` values of a iterator then returns it.
  //  @param iter an iterator function
  //  @param[opt] n a number. Defaults to 1.
  //  @return the given iterator
  public static function skip<K, V>(iter: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Iterates over an iterator and returns its values in an array.
  //  @param ... an iterator function (returning a generator, a state and a value)
  //  @return an array of results
  public static function tabulate<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the length of an iterator. It consumes the iterator itself.
  //  @param ... an iterator function (returning a generator, a state and a value)
  //  @return the iterator length
  public static function iterlen<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Casts value as an array if it is not one.
  //  @param value a value
  //  @return an array containing the given value
  public static function castArray<K, V>(value: LuaTable<K, V>): LuaTable<K, V>;

  //  Creates a function of `f` with arguments flipped in reverse order.
  //  @param f a function
  //  @return a function
  public static function flip<K, V>(f: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a function that gets the nth argument.  If n is negative, the nth argument from the end is returned.
  //  @param n a number
  //  @return a function
  public static function nthArg<K, V>(n: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a function which accepts up to one arg. It ignores any additional arguments.
  //  @param f a function
  //  @return a function
  public static function unary<K, V>(f: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a function which accepts up to `n` args. It ignores any additional arguments. <br/><em>Aliased as `nAry`</em>.
  //  @param f a function
  //  @param[opt] n a number. Defaults to 1.
  //  @return a function
  public static function ary<K, V>(f: LuaTable<K, V>, n: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a function with an arity of 0. The new function ignores any arguments passed to it.
  //  @param f a function
  //  @return a new function
  public static function noarg<K, V>(f: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a function which runs with arguments rearranged. Arguments are passed to the  returned function in the order of supplied `indexes` at call-time.
  //  @param f a function
  //  @param indexes an array list of indexes
  //  @return a function
  public static function rearg<K, V>(f: LuaTable<K, V>, indexes: LuaTable<K, V>): LuaTable<K, V>;

  //  Creates a function that runs transforms on all arguments it receives.
  //  @param ... a set of functions which will receive all arguments to the returned function
  //  @return a function
  public static function over<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Creates a validation function. The returned function checks if *all* of the given predicates return  truthy when invoked with the arguments it receives.
  //  @param ... a list of predicate functions
  //  @return a new function
  public static function overEvery<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Creates a validation function. The return function checks if *any* of a given predicates return  truthy when invoked with the arguments it receives.
  //  @param ... a list of predicate functions
  //  @return a new function
  public static function overSome<K, V>(...: LuaTable<K, V>): LuaTable<K, V>;

  //  Creates a function that invokes `f` with its arguments transformed. 1rst arguments will be passed to  the 1rst transform, 2nd arg to the 2nd transform, etc. Remaining arguments will not be transformed.
  //  @param f a function
  //  @param ... a list of transforms funcs prototyped as `f <K, V>(v)`
  //  @return the result of running `f` with its transformed arguments
  public static function overArgs<K, V>(f: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Converges two functions into one.
  //  @param f a function
  //  @param g a function
  //  @param h a function
  //  @return a new version of function f
  public static function converge<K, V>(f: LuaTable<K, V>, g: LuaTable<K, V>, h: LuaTable<K, V>): LuaTable<K, V>;

  //  Partially apply a function by filling in any number of its arguments.  One may pass a string `'M'` as a placeholder in the list of arguments to specify an argument  that should not be pre-filled, but left open to be supplied at call-time.
  //  @param f a function
  //  @param ... a list of partial arguments to `f`
  //  @return a new version of function f having some of it original arguments filled
  public static function partial<K, V>(f: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Similar to @{partial}, but from the right.
  //  @param f a function
  //  @param ... a list of partial arguments to `f`
  //  @return a new version of function f having some of it original arguments filled
  public static function partialRight<K, V>(f: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Curries a function. If the given function `f` takes multiple arguments, it returns another version of  `f` that takes a single argument (the first of the arguments to the original function) and returns a new  function that takes the remainder of the arguments and returns the result.
  //  @param f a function
  //  @param[opt] n_args the number of arguments expected for `f`. Defaults to 2.
  //  @return a curried version of `f`
  public static function curry<K, V>(f: LuaTable<K, V>, n_args: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the execution time of `f (...)` and its returned values.
  //  @param f a function
  //  @param[opt] ... optional args to `f`
  //  @return the execution time and the results of `f (...)`
  public static function time<K, V>(f: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Object functions
  //  @param obj an object
  //  @return an array
  public static function keys<K, V>(obj: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the values of the object properties.
  //  @param obj an object
  //  @return an array of values
  public static function values<K, V>(obj: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns the value at a given path in an object.  Path is given as a vararg list of keys.
  //  @param obj an object
  //  @param ... a vararg list of keys
  //  @return a value or nil
  public static function path<K, V>(obj: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Spreads object under property path onto provided object.  It is similar to @{flattenPath}, but removes object under the property path.
  //  @param obj an object
  //  @param ... a property path given as a vararg list
  //  @return the passed-in object with changes
  public static function spreadPath<K, V>(obj: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Flattens object under property path onto provided object.  It is similar to @{spreadPath}, but preserves object under the property path.
  //  @param obj an object
  //  @param ... a property path given as a vararg list
  //  @return the passed-in object with changes
  public static function flattenPath<K, V>(obj: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Converts key-value pairs to an array-list of `[k, v]` pairs.
  //  @param obj an object
  //  @return an array list of key-value pairs
  public static function kvpairs<K, V>(obj: LuaTable<K, V>): LuaTable<K, V>;

  //  Converts an array list of `[k,v]` pairs to an object. Keys are taken from the 1rst column in the `[k,v]` pairs sequence, associated with values in the 2nd column.
  //  @param kvpairs an array-list of `[k,v]` pairs
  //  @return an object
  public static function toObj<K, V>(kvpairs: LuaTable<K, V>): LuaTable<K, V>;

  //  Swaps keys with values. Produces a new object where previous keys are now values,  while previous values are now keys. <br/><em>Aliased as `mirror`</em>
  //  @param obj a given object
  //  @return a new object
  public static function invert<K, V>(obj: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a function that will return the key property of any passed-in object.
  //  @param key a key property name
  //  @return a function which should accept an object as argument
  public static function property<K, V>(key: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a function which will return the value of an object property.
  //  @param obj an object
  //  @return a function which should accept a key property argument
  public static function propertyOf<K, V>(obj: LuaTable<K, V>): LuaTable<K, V>;

  //  Converts any given value to a boolean
  //  @param value a value. Can be of any type
  //  @return `true` if value is true, `false` otherwise (false or nil).
  public static function toBoolean<K, V>(value: LuaTable<K, V>): LuaTable<K, V>;

  //  Extends an object properties. It copies the properties of extra passed-in objects into the destination object, and returns the destination object. The last objects will override properties of the same name.
  //  @param destObj a destination object
  //  @param ... a list of objects
  //  @return the destination object extended
  public static function extend<K, V>(destObj: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns a sorted list of all methods names found in an object. If the given object has a metatable implementing an `__index` field pointing to another table, will also recurse on this table if `recurseMt` is provided. If `obj` is omitted, it defaults to the library functions. <br/><em>Aliased as `methods`</em>.
  //  @param[opt] obj an object. Defaults to Moses library functions.
  //  @return an array-list of methods names
  public static function functions<K, V>(obj: LuaTable<K, V>): LuaTable<K, V>;

  //  Clones a given object properties. If `shallow` is passed will also clone nested array properties.
  //  @param obj an object
  //  @param[opt] shallow whether or not nested array-properties should be cloned, defaults to false.
  //  @return a copy of the passed-in object
  public static function clone<K, V>(obj: LuaTable<K, V>, shallow: LuaTable<K, V>): LuaTable<K, V>;

  //  Invokes interceptor with the object, and then returns object. The primary purpose of this method is to "tap into" a method chain, in order to perform operations  on intermediate results within the chain.
  //  @param obj an object
  //  @param f an interceptor function, should be prototyped as `f (obj)`
  //  @return the passed-in object
  public static function tap<K, V>(obj: LuaTable<K, V>, f: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if a given object implements a property.
  //  @param obj an object
  //  @param key a key property to be checked
  //  @return `true` or `false`
  public static function has<K, V>(obj: LuaTable<K, V>, key: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns an object copy having white-listed properties. <br/><em>Aliased as `choose`</em>.
  //  @param obj an object
  //  @param ... a variable number of string keys
  //  @return the filtered object
  public static function pick<K, V>(obj: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Returns an object copy without black-listed properties. <br/><em>Aliased as `drop`</em>.
  //  @param obj an object
  //  @param ... a variable number of string keys
  //  @return the filtered object
  public static function omit<K, V>(obj: LuaTable<K, V>, ...: LuaTable<K, V>): LuaTable<K, V>;

  //  Applies a template to an object, preserving non-nil properties. <br/><em>Aliased as `defaults`</em>.
  //  @param obj an object
  //  @param[opt] template a template object. If `nil`, leaves `obj` untouched.
  //  @return the passed-in object filled
  public static function template<K, V>(obj: LuaTable<K, V>, template: LuaTable<K, V>): LuaTable<K, V>;

  //  Performs a deep comparison test between two objects. Can compare strings, functions  (by reference), nil, booleans. Compares tables by reference or by values. If `useMt`  is passed, the equality operator `==` will be used if one of the given objects has a  metatable implementing `__eq`. <br/><em>Aliased as `M.compare`, `M.matches`</em>
  //  @param objA an object
  //  @param objB another object
  //  @param[opt] useMt whether or not `__eq` should be used, defaults to false.
  //  @return `true` or `false`
  public static function isEqual<K, V>(objA: LuaTable<K, V>, objB: LuaTable<K, V>, useMt: LuaTable<K, V>): LuaTable<K, V>;

  //  Invokes an object method. It passes the object itself as the first argument. if `method` is not callable, will return `obj[method]`.
  //  @param obj an object
  //  @param method a string key to index in object `obj`.
  //  @return the returned value of `method (obj)` call
  public static function result<K, V>(obj: LuaTable<K, V>, method: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if the given arg is a table.
  //  @param t a value to be tested
  //  @return `true` or `false`
  public static function isTable<K, V>(t: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if the given argument is callable. Assumes `obj` is callable if it is either a function or a table having a metatable implementing `__call` metamethod.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isCallable<K, V>(obj: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if the given argument is an array. Assumes `obj` is an array if is a table with consecutive integer keys starting at 1.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isArray<K, V>(obj: LuaTable<K, V>): LuaTable<K, V>;

  //  Checks if the given object is iterable with `pairs` (or `ipairs`).
  //  @param obj an object
  //  @return `true` if the object can be iterated with `pairs` (or `ipairs`), `false` otherwise
  public static function isIterable<K, V>(obj: LuaTable<K, V>): LuaTable<K, V>;

  //  Extends Lua's `type` function. It returns the type of the given object and also recognises file userdata
  //  @param obj an object
  //  @return the given object type
  public static function type<K, V>(obj: LuaTable<K, V>): String;

  //  Checks if the given pbject is empty. If `obj` is a string, will return `true` if `#obj == 0`. Otherwise, if `obj` is a table, will return whether or not this table is empty. If `obj` is `nil`, it will return true.
  //  @param[opt] obj an object
  //  @return `true` or `false`
  public static function isEmpty<K, V>(obj: LuaTable<K, V>): Bool;

  //  Checks if the given argument is a string.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isString<K, V>(obj: LuaTable<K, V>): Bool;

  //  Checks if the given argument is a function.
  //  @param obj an object
  //  @return `true` or `false`
    public static function isFunction<K, V>(obj: LuaTable<K, V>): Bool;

  //  Checks if the given argument is nil.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isNil<K, V>(obj: LuaTable<K, V>): Bool;

  //  Checks if the given argument is a number.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isNumber<K, V>(obj: LuaTable<K, V>): Bool;

  //  Checks if the given argument is NaN (see [Not-A-Number](http://en.wikipedia.org/wiki/NaN)).
  //  @param obj an object
  //  @return `true` or `false`
  public static function isNaN<K, V>(obj: LuaTable<K, V>): Bool;

  //  Checks if the given argument is a finite number.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isFinite<K, V>(obj: LuaTable<K, V>): Bool;

  //  Checks if the given argument is a boolean.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isBoolean<K, V>(obj: LuaTable<K, V>): Bool;

  //  Checks if the given argument is an integer.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isInteger<K, V>(obj: LuaTable<K, V>): Bool;

  //  Returns a wrapped object. Calling library functions as methods on this object will continue to return wrapped objects until @{obj:value} is used. Can be aliased as `M(value)`.
  //  @param value a value to be wrapped
  //  @return a wrapped object
  public static function chain<K, V>(value: LuaTable<K, V>): ChainingCalls;
}

extern class ChainingCalls implements LuaTable<K, V> {
  //  Extracts the value of a wrapped object. Must be called on an chained object (see @{chain}).
  //  @return the value previously wrapped
  public function value<K, V>(): LuaTable<K, V>;
}
