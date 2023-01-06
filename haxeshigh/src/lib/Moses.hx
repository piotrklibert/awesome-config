package lib;


extern class Ops {
  //  Returns a + b. <em>Aliased as `op.add`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a + b
  public static function add(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns a - b. <em>Aliased as `op.sub`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a - b
  public static function sub(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns a * b. <em>Aliased as `op.mul`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a * b
  public static function mul(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns a / b. <em>Aliased as `op.div`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a / b
  public static function div(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns a % b. <em>Aliased as `op.mod`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a % b
  public static function mod(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns a ^ b. <em>Aliased as `op.exp`, `op.pow`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a ^ b
  public static function exp(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns -a. <em>Aliased as `op.unm`, `op.neg`</em>.
  //  @param a a value
  //  @return -a
  public static function unm(a: Dynamic): Dynamic;

  //  Performs floor division (//) between `a` and `b`. It rounds the quotient towards minus infinity. <em>Aliased as `op.floordiv`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a // b
  public static function floordiv(a: Dynamic, b: Dynamic): Dynamic;

  //  Performs integer division between `a` and `b`. <em>Aliased as `op.intdiv`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a / b
  public static function intdiv(a: Dynamic, b: Dynamic): Dynamic;

  //  Checks if a equals b. <em>Aliased as `op.eq`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a == b
  public static function eq(a: Dynamic, b: Dynamic): Dynamic;

  //  Checks if a not equals b. <em>Aliased as `op.neq`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a ~= b
  public static function neq(a: Dynamic, b: Dynamic): Dynamic;

  //  Checks if a is strictly less than b. <em>Aliased as `op.lt`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a < b
  public static function lt(a: Dynamic, b: Dynamic): Dynamic;

  //  Checks if a is strictly greater than b. <em>Aliased as `op.gt`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a > b
  public static function gt(a: Dynamic, b: Dynamic): Dynamic;

  //  Checks if a is less or equal to b. <em>Aliased as `op.le`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a <= b
  public static function le(a: Dynamic, b: Dynamic): Dynamic;

  //  Checks if a is greater or equal to b. <em>Aliased as `op.ge`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a >= b
  public static function ge(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns logical a and b. <em>Aliased as `op.land`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a and b
  public static function land(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns logical a or b. <em>Aliased as `op.lor`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a or b
  public static function lor(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns logical not a. <em>Aliased as `op.lnot`</em>.
  //  @param a a value
  //  @return not a
  public static function lnot(a: Dynamic): Dynamic;

  //  Returns concatenation of a and b. <em>Aliased as `op.concat`</em>.
  //  @param a a value
  //  @param b a value
  //  @return a .. b
  public static function concat(a: Dynamic, b: Dynamic): Dynamic;

  //  Returns the length of a. <em>Aliased as `op.len`</em>.
  //  @param a a value
  //  @return #a
  public static function length(a: Dynamic): Dynamic;
}


@:luaRequire("moses")
extern class Moses {

  //  Table functions
  //  @param t a table
  //  @return the given table, cleared.
  public static function clear(t: Dynamic): Dynamic;

  //  Iterates on key-value pairs, calling `f (v, k)` at every step. <br/><em>Aliased as `forEach`</em>.
  //  @param t a table
  //  @param f a function, prototyped as `f (v, k)`
  //
  public static function each(t: Dynamic, f: Dynamic): Dynamic;

  //  Iterates on integer key-value pairs, calling `f(v, k)` every step.  Only applies to values located at integer keys. The table can be a sparse array.  Iteration will start from the lowest integer key found to the highest one. <br/><em>Aliased as `forEachi`</em>.
  //  @param t a table
  //  @param f a function, prototyped as `f (v, k)`
  //
  public static function eachi(t: Dynamic, f: Dynamic): Dynamic;

  //  Collects values at given keys and return them wrapped in an array.
  //  @param t a table
  //  @param ... A variable number of keys to collect values
  //  @return an array-list of values
  public static function at(t: Dynamic, ks: Rest<Dynamic>): Dynamic;

  //  Adjusts the value at a given key using a function or a value. In case `f` is a function,  it should be prototyped `f(v)`. It does not mutate the given table, but rather returns a new array. In case the given `key` does not exist in `t`, it throws an error.
  //  @param t a table
  //  @param key a key
  //  @param f a function, prototyped as `f(v)` or a value
  //
  public static function (t: Dynamic, key: Dynamic, f: Dynamic): Dynamic;

  //  Counts occurrences of a given value in a table. Uses @{isEqual} to compare values.
  //  @param t a table
  //  @param[opt] val a value to be searched in the table. If not given, the @{size} of the table will be returned
  //  @return the count of occurrences of the given value
  public static function count(t: Dynamic, val: Dynamic): Dynamic;

  //  Counts the number of values passing a predicate test. Same as @{count}, but uses an iterator.  Returns the count for values passing the test `f (v, k)`
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (v, k)`
  //  @return the count of values validating the predicate
  public static function countf(t: Dynamic, f: Dynamic): Dynamic;

  //  Checks if all values in a collection are equal. Uses an optional `comp` function which is used to compare values and defaults to @{isEqual} when not given. <br/><em>Aliased as `alleq`</em>.
  //  @param t a table
  //  @param[opt] comp a comparison function. Defaults to `isEqual`
  //  @return `true` when all values in `t` are equal, `false` otherwise.
  public static function allEqual(t: Dynamic, comp: Dynamic): Dynamic;

  //  Loops `n` times through a table. In case `n` is omitted, it will loop forever. In case `n` is lower or equal to 0, it returns an empty function. <br/><em>Aliased as `loop`</em>.
  //  @param t a table
  //  @param[opt] n the number of loops
  //  @return an iterator function yielding value-key pairs from the passed-in table.
  public static function cycle(t: Dynamic, n: Dynamic): Dynamic;

  //  Maps `f (v, k)` on value-key pairs, collects and returns the results.  Uses `pairs` to iterate over elements in `t`. <br/><em>Aliased as `collect`</em>.
  //  @param t a table
  //  @param f  an iterator function, prototyped as `f (v, k)`
  //  @return a table of results
  public static function map(t: Dynamic, f: Dynamic): Dynamic;

  //  Maps `f (v, k)` on value-key pairs, collects and returns the results.  Uses `ipairs` to iterate over elements in `t`.
  //  @param t a table
  //  @param f  an iterator function, prototyped as `f (v, k)`
  //  @return a table of results
  public static function mapi(t: Dynamic, f: Dynamic): Dynamic;

  //  Reduces a table, left-to-right. Folds the table from the first element to the last element to a single value, using a given iterator and an initial state. The iterator takes a state and a value and returns a new state. <br/><em>Aliased as `inject`, `foldl`</em>.
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param[opt] state an initial state of reduction. Defaults to the first value in the table.
  //  @return the final state of reduction
  public static function reduce(t: Dynamic, f: Dynamic, state: Dynamic): Dynamic;

  //  Returns the best value passing a selector function. Acts as a special case of
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @return the final state of reduction
  public static function best(t: Dynamic, f: Dynamic): Dynamic;

  //  Reduces values in a table passing a given predicate. Folds the table left-to-right, considering only values validating a given predicate.
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param pred a predicate function `pred (v, k)` to select values to be considered for reduction
  //  @param[opt] state an initial state of reduction. Defaults to the first value in the table of selected values.
  //  @param[optchain] ... optional args to be passed to `pred`
  //  @return the final state of reduction
  public static function reduceBy(t: Dynamic, f: Dynamic, pred: Dynamic, state: Dynamic, ...: Dynamic): Dynamic;

  //  Reduces a table, right-to-left. Folds the table from the last element to the first element  to single value, using a given iterator and an initial state. The iterator takes a state and a value, and returns a new state. <br/><em>Aliased as `injectr`, `foldr`</em>.
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param[opt] state an initial state of reduction. Defaults to the last value in the table.
  //  @return the final state of reduction
  public static function reduceRight(t: Dynamic, f: Dynamic, state: Dynamic): Dynamic;

  //  Reduces a table while saving intermediate states. Folds the table left-to-right using a given iterator and an initial state. The iterator takes a state and a value,  and returns a new state. The result is an array of intermediate states. <br/><em>Aliased as `mapr`</em>
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param[opt] state an initial state of reduction. Defaults to the first value in the table.
  //  @return an array of states
  public static function mapReduce(t: Dynamic, f: Dynamic, state: Dynamic): Dynamic;

  //  Reduces a table while saving intermediate states. Folds the table right-to-left using a given iterator and an initial state. The iterator takes a state and a value,  and returns a new state. The result is an array of intermediate states. <br/><em>Aliased as `maprr`</em>
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (state, value)`
  //  @param[opt] state an initial state of reduction. Defaults to the last value in the table.
  //  @return an array of states
  public static function mapReduceRight(t: Dynamic, f: Dynamic, state: Dynamic): Dynamic;

  //  Performs a linear search for a value in a table. It does not work for nested tables. The given value can be a function prototyped as `f (v, value)` which should return true when any v in the table equals the value being searched.  <br/><em>Aliased as `any`, `some`, `contains`</em>
  //  @param t a table
  //  @param value a value to search for
  //  @return a boolean : `true` when found, `false` otherwise
  public static function include(t: Dynamic, value: Dynamic): Dynamic;

  //  Performs a linear search for a value in a table. Returns the key of the value if found. The given value can be a function prototyped as `f (v, value)` which should return true when any v in the table equals the value being searched. This function is similar to @{find},  which is mostly meant to work with array.
  //  @param t a table
  //  @param value a value to search for
  //  @return the key of the value when found or __nil__
  public static function detect(t: Dynamic, value: Dynamic): Dynamic;

  //  Returns all values having specified keys `props`.
  //  @param t a table
  //  @param props a set of keys
  //  @return an array of values from the passed-in table
  public static function where(t: Dynamic, props: Dynamic): Dynamic;

  //  Returns the first value having specified keys `props`.
  //  @param t a table
  //  @param props a set of keys
  //  @return a value from the passed-in table
  public static function findWhere(t: Dynamic, props: Dynamic): Dynamic;

  //  Selects and returns values passing an iterator test. <br/><em>Aliased as `filter`</em>.
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (v, k)`
  //  @return the selected values
  public static function select(t: Dynamic, f: Dynamic): Dynamic;

  //  Clones a table while dropping values passing an iterator test. <br/><em>Aliased as `discard`</em>
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (v, k)`
  //  @return the remaining values
  public static function reject(t: Dynamic, f: Dynamic): Dynamic;

  //  Checks if all values in a table are passing an iterator test. <br/><em>Aliased as `every`</em>
  //  @param t a table
  //  @param f an iterator function, prototyped as `f (v, k)`
  //  @return `true` if all values passes the predicate, `false` otherwise
  public static function all(t: Dynamic, f: Dynamic): Dynamic;

  //  Invokes a method on each value in a table.
  //  @param t a table
  //  @param method a function, prototyped as `f (v, k)`
  //  @return the result of the call `f (v, k)`
  public static function invoke(t: Dynamic, method: Dynamic): Dynamic;

  //  Extracts values in a table having a given key.
  //  @param t a table
  //  @param key a key, will be used to index in each value: `value[key]`
  //  @return an array of values having the given key
  public static function pluck(t: Dynamic, key: Dynamic): Dynamic;

  //  Returns the max value in a collection. If a `transform` function is passed, it will be used to evaluate values by which all objects will be sorted.
  //  @param t a table
  //  @param[opt] transform a transformation function, prototyped as `transform (v, k)`, defaults to @{identity}
  //  @return the max value found
  public static function max(t: Dynamic, transform: Dynamic): Dynamic;

  //  Returns the min value in a collection. If a `transform` function is passed, it will be used to evaluate values by which all objects will be sorted.
  //  @param t a table
  //  @param[opt] transform a transformation function, prototyped as `transform (v, k)`, defaults to @{identity}
  //  @return the min value found
  public static function min(t: Dynamic, transform: Dynamic): Dynamic;

  //  Checks if two tables are the same. It compares if both tables features the same values, but not necessarily at the same keys.
  //  @param a a table
  //  @param b another table
  //  @return `true` or `false`
  public static function same(a: Dynamic, b: Dynamic): Dynamic;

  //  Sorts a table, in-place. If a comparison function is given, it will be used to sort values.
  //  @param t a table
  //  @param[opt] comp a comparison function prototyped as `comp (a, b)`, defaults to <tt><</tt>
  //  @return the given table, sorted.
  public static function sort(t: Dynamic, comp: Dynamic): Dynamic;

  //  Iterates on values with respect to key order. Keys are sorted using `comp` function which defaults to `math.min`. It returns upon each call a `key, value` pair.
  //  @param t a table
  //  @param[opt] comp a comparison function. Defaults to `<` operator
  //  @return an iterator function
  public static function sortedk(t: Dynamic, comp: Dynamic): Dynamic;

  //  Iterates on values with respect to values order. Values are sorted using `comp` function which defaults to `math.min`. It returns upon each call a `key, value` pair.
  //  @param t a table
  //  @param[opt] comp a comparison function. Defaults to `<` operator
  //  @return an iterator function
  public static function sortedv(t: Dynamic, comp: Dynamic): Dynamic;

  //  Sorts a table in-place using a transform. Values are ranked in a custom order of the results of running `transform (v)` on all values. `transform` may also be a string name property  sort by.  `comp` is a comparison function.
  //  @param t a table
  //  @param[opt] transform a `transform` function to sort elements prototyped as `transform (v)`. Defaults to @{identity}
  //  @param[optchain] comp a comparison function, defaults to the `<` operator
  //  @return a new array of sorted values
  public static function sortBy(t: Dynamic, transform: Dynamic, comp: Dynamic): Dynamic;

  //  Splits a table into subsets groups.
  //  @param t a table
  //  @param iter an iterator function, prototyped as `iter (v, k)`
  //  @return a table of subsets groups
  public static function groupBy(t: Dynamic, iter: Dynamic): Dynamic;

  //  Groups values in a collection and counts them.
  //  @param t a table
  //  @param iter an iterator function, prototyped as `iter (v, k)`
  //  @return a table of subsets groups names paired with their count
  public static function countBy(t: Dynamic, iter: Dynamic): Dynamic;

  //  Counts the number of values in a collection. If being passed more than one argument it will return the count of all passed-in arguments.
  //  @param[opt] ... Optional variable number of arguments
  //  @return a count
  public static function size(...: Dynamic): Dynamic;

  //  Checks if all the keys of `other` table exists in table `t`. It does not compares values. The test is not commutative, i.e table `t` may contains keys not existing in `other`.
  //  @param t a table
  //  @param other another table
  //  @return `true` or `false`
  public static function containsKeys(t: Dynamic, other: Dynamic): Dynamic;

  //  Checks if both given tables have the same keys. It does not compares values.
  //  @param tA a table
  //  @param tB another table
  //  @return `true` or `false`
  public static function sameKeys(tA: Dynamic, tB: Dynamic): Dynamic;

  //  Array functions
  //  @param array an array
  //  @param[opt] n a number of elements to be sampled. Defaults to 1.
  //  @param[optchain] seed an optional seed for shuffling
  //  @return an array of selected values
  public static function sample(array: Dynamic, n: Dynamic, seed: Dynamic): Dynamic;

  //  Return elements from a sequence with a given probability. It considers each value independently.  Providing a seed will result in deterministic sampling. Given the same seed it will return the same sample every time.
  //  @param array an array
  //  @param prob a probability for each element in array to be selected
  //  @param[opt] seed an optional seed for deterministic sampling
  //  @return an array of selected values
  public static function sampleProb(array: Dynamic, prob: Dynamic, seed: Dynamic): Dynamic;

  //  Returns the n-top values satisfying a predicate. It takes a comparison function `comp` used to sort array values, and then picks the top n-values. It leaves the original array untouched.
  //  @param array an array
  //  @param[opt] n a number of values to retrieve. Defaults to 1.
  //  @param[optchain] comp a comparison function. Defaults to `<`
  //  @return an array of top n values
  public static function nsorted(array: Dynamic, n: Dynamic, comp: Dynamic): Dynamic;

  //  Returns a shuffled copy of a given array. If a seed is provided, it will be used to init the built-in pseudo random number generator (using `math.randomseed`).
  //  @param array an array
  //  @param[opt] seed a seed
  //  @return a shuffled copy of the given array
  public static function shuffle(array: Dynamic, seed: Dynamic): Dynamic;

  //  Converts a list of arguments to an array.
  //  @param ... a list of arguments
  //  @return an array of all passed-in args
  public static function pack(...: Dynamic): Dynamic;

  //  Looks for the first occurrence of a given value in an array. Returns the value index if found. Uses @{isEqual} to compare values.
  //  @param array an array of values
  //  @param value a value to lookup for
  //  @param[opt] from the index from where the search will start. Defaults to 1.
  //  @return the index of the value if found in the array, `nil` otherwise.
  public static function find(array: Dynamic, value: Dynamic, from: Dynamic): Dynamic;

  //  Returns an array where values are in reverse order. The passed-in array should not be sparse.
  //  @param array an array
  //  @return a reversed array
  public static function reverse(array: Dynamic): Dynamic;

  //  Replaces elements in a given array with a given value. In case `i` and `j` are given it will only replaces values at indexes between `[i,j]`. In case `j` is greater than the array size, it will append new values, increasing the array size.
  //  @param array an array
  //  @param value a value
  //  @param[opt] i the index from which to start replacing values. Defaults to 1.
  //  @param[optchain] j the index where to stop replacing values. Defaults to the array size.
  //  @return the original array with values changed
  public static function fill(array: Dynamic, value: Dynamic, i: Dynamic, j: Dynamic): Dynamic;

  //  Returns an array of `n` zeros.
  //  @param n a number
  //  @return an array
  public static function zeros(n: Dynamic): Dynamic;

  //  Returns an array of `n` 1's.
  //  @param n a number
  //  @return an array
  public static function ones(n: Dynamic): Dynamic;

  //  Returns an array of `n` times a given value.
  //  @param value a value
  //  @param n a number
  //  @return an array
  public static function vector(value: Dynamic, n: Dynamic): Dynamic;

  //  Collects values from a given array. The passed-in array should not be sparse. This function collects values as long as they satisfy a given predicate and returns on the first falsy test. <br/><em>Aliased as `takeWhile`</em>
  //  @param array an array
  //  @param f an iterator function prototyped as `f (v, k)`
  //  @return a new table containing all values collected
  public static function selectWhile(array: Dynamic, f: Dynamic): Dynamic;

  //  Collects values from a given array. The passed-in array should not be sparse. This function collects values as long as they do not satisfy a given predicate and returns on the first truthy test. <br/><em>Aliased as `rejectWhile`</em>
  //  @param array an array
  //  @param f an iterator function prototyped as `f (v, k)`
  //  @return a new table containing all values collected
  public static function dropWhile(array: Dynamic, f: Dynamic): Dynamic;

  //  Returns the index at which a value should be inserted. This index is evaluated so  that it maintains the sort. If a comparison function is passed, it will be used to sort values.
  //  @param array an array
  //  @param the value to be inserted
  //  @param[opt] comp an comparison function prototyped as `f (a, b)`, defaults to <tt><</tt>
  //  @param[optchain] sort whether or not the passed-in array should be sorted
  //  @return number the index at which the passed-in value should be inserted
  public static function sortedIndex(array: Dynamic, the: Dynamic, comp: Dynamic, sort: Dynamic): Dynamic;

  //  Returns the index of the first occurrence of value in an array.
  //  @param array an array
  //  @param value the value to search for
  //  @return the index of the passed-in value
  public static function indexOf(array: Dynamic, value: Dynamic): Dynamic;

  //  Returns the index of the last occurrence of value in an array.
  //  @param array an array
  //  @param value the value to search for
  //  @return the index of the last occurrence of the passed-in value or __nil__
  public static function lastIndexOf(array: Dynamic, value: Dynamic): Dynamic;

  //  Returns the first index at which a predicate returns true.
  //  @param array an array
  //  @param pred a predicate function prototyped as `pred (v, k)`
  //  @return the index found or __nil__
  public static function findIndex(array: Dynamic, pred: Dynamic): Dynamic;

  //  Returns the last index at which a predicate returns true.
  //  @param array an array
  //  @param pred a predicate function prototyped as `pred (k, v)`
  //  @return the index found or __nil__
  public static function findLastIndex(array: Dynamic, pred: Dynamic): Dynamic;

  //  Adds all passed-in values at the top of an array. The last elements will bubble to the top of the given array.
  //  @param array an array
  //  @param ... a variable number of arguments
  //  @return the passed-in array with new values added
  public static function addTop(array: Dynamic, ...: Dynamic): Dynamic;

  //  Adds all passed-in values at the top of an array. As opposed to @{addTop}, it preserves the order of the passed-in elements.
  //  @param array an array
  //  @param ... a variable number of arguments
  //  @return the passed-in array with new values added
  public static function prepend(array: Dynamic, ...: Dynamic): Dynamic;

  //  Pushes all passed-in values at the end of an array.
  //  @param array an array
  //  @param ... a variable number of arguments
  //  @return the passed-in array with new added values
  public static function push(array: Dynamic, ...: Dynamic): Dynamic;

  //  Removes and returns the values at the top of a given array. <br/><em>Aliased as `pop`</em>
  //  @param array an array
  //  @param[opt] n the number of values to be popped. Defaults to 1.
  //  @return the popped values
  public static function shift(array: Dynamic, n: Dynamic): Dynamic;

  //  Removes and returns the values at the end of a given array.
  //  @param array an array
  //  @param[opt] n the number of values to be unshifted. Defaults to 1.
  //  @return the values
  public static function unshift(array: Dynamic, n: Dynamic): Dynamic;

  //  Removes all provided values in a given array. <br/><em>Aliased as `remove`</em>
  //  @param array an array
  //  @param ... a variable number of values to be removed from the array
  //  @return the passed-in array with values removed
  public static function pull(array: Dynamic, ...: Dynamic): Dynamic;

  //  Removes values at an index within the range `[start, finish]`. <br/><em>Aliased as `rmRange`, `chop`</em>
  //  @param array an array
  //  @param[opt] start the lower bound index, defaults to the first index in the array.
  //  @param[optchain] finish the upper bound index, defaults to the array length.
  //  @return the passed-in array with values removed
  public static function removeRange(array: Dynamic, start: Dynamic, finish: Dynamic): Dynamic;

  //  Chunks together consecutive values. Values are chunked on the basis of the return value of a provided predicate `f (v, k)`. Consecutive elements which return  the same value are chunked together. Leaves the first argument untouched if it is not an array.
  //  @param array an array
  //  @param f an iterator function prototyped as `f (v, k)`. Defaults to @{identity}.
  //  @return a table of chunks (arrays)
  public static function chunk(array: Dynamic, f: Dynamic): Dynamic;

  //  Slices values indexed within `[start, finish]` range. <br/><em>Aliased as `M.sub`</em>
  //  @param array an array
  //  @param[opt] start the lower bound index, defaults to the first index in the array.
  //  @param[optchain] finish the upper bound index, defaults to the array length.
  //  @return a new array of sliced values
  public static function slice(array: Dynamic, start: Dynamic, finish: Dynamic): Dynamic;

  //  Returns the first N values in an array. <br/><em>Aliased as `head`, `take` </em>
  //  @param array an array
  //  @param[opt] n the number of values to be collected, defaults to 1.
  //  @return a new array
  public static function first(array: Dynamic, n: Dynamic): Dynamic;

  //  Returns all values in an array excluding the last N values.
  //  @param array an array
  //  @param[opt] n the number of values to be left, defaults to the array length.
  //  @return a new array
  public static function initial(array: Dynamic, n: Dynamic): Dynamic;

  //  Returns the last N values in an array.
  //  @param array an array
  //  @param[opt] n the number of values to be collected, defaults to the array length.
  //  @return a new array
  public static function last(array: Dynamic, n: Dynamic): Dynamic;

  //  Returns all values after index. <br/><em>Aliased as `tail`</em>
  //  @param array an array
  //  @param[opt] index an index, defaults to 1
  //  @return a new array
  public static function rest(array: Dynamic, index: Dynamic): Dynamic;

  //  Returns the value at a given index.
  //  @param array an array
  //  @param index an index
  //  @return the value at the given index
  public static function nth(array: Dynamic, index: Dynamic): Dynamic;

  //  Returns all truthy values (removes `falses` and `nils`).
  //  @param array an array
  //  @return a new array
  public static function compact(array: Dynamic): Dynamic;

  //  Flattens a nested array. Passing `shallow` will only flatten at the first level.
  //  @param array an array
  //  @param[opt] shallow specifies the flattening depth. Defaults to `false`.`
  //  @return a flattened array
  public static function flatten(array: Dynamic, shallow: Dynamic): Dynamic;

  //  Returns values from an array not present in all passed-in args. <br/><em>Aliased as `without` and `diff`</em>
  //  @param array an array
  //  @param another array
  //  @return a new array
  public static function difference(array: Dynamic, another: Dynamic): Dynamic;

  //  Returns the duplicate-free union of all passed in arrays.
  //  @param ... a variable number of arrays arguments
  //  @return a new array
  public static function union(...: Dynamic): Dynamic;

  //  Returns the  intersection of all passed-in arrays. Each value in the result is present in each of the passed-in arrays.
  //  @param ... a variable number of array arguments
  //  @return a new array
  public static function intersection(...: Dynamic): Dynamic;

  //  Checks if all passed in arrays are disjunct.
  //  @param ... a variable number of arrays
  //  @return `true` if the intersection of all arrays is not empty, `false` otherwise.
  public static function disjoint(...: Dynamic): Dynamic;

  //  Performs a symmetric difference. Returns values from `array` not present in `array2` and also values from `array2` not present in `array`. <br/><em>Aliased as `symdiff`</em>
  //  @param array an array
  //  @param array2 another array
  //  @return a new array
  public static function symmetricDifference(array: Dynamic, array2: Dynamic): Dynamic;

  //  Produces a duplicate-free version of a given array. <br/><em>Aliased as `uniq`</em>
  //  @param array an array
  //  @return a new array, duplicate-free
  public static function unique(array: Dynamic): Dynamic;

  //  Checks if a given array contains distinct values. Such an array is made of distinct elements, which only occur once in this array. <br/><em>Aliased as `isuniq`</em>
  //  @param array an array
  //  @return `true` if the given array is unique, `false` otherwise.
  public static function isunique(array: Dynamic): Dynamic;

  //  Returns an array list of all duplicates in array.
  //  @param array an array
  //  @return an array-list of duplicates
  public static function duplicates(array: Dynamic): Dynamic;

  //  Merges values of each of the passed-in arrays in subsets. Only values indexed with the same key in the given arrays are merged in the same subset. <br/><em>Aliased as `transpose`</em>
  //  @param ... a variable number of array arguments
  //  @return a new array
  public static function zip(...: Dynamic): Dynamic;

  //  Merges values using a given function. Only values indexed with the same key in the given arrays are merged in the same subset. Function `f` is used to combine values. <br/><em>Aliased as `transposeWith`</em>
  //  @param f a function
  //  @param ... a variable number of array arguments
  //  @return a flat array of results
  public static function zipWith(f: Dynamic, ...: Dynamic): Dynamic;

  //  Clones array and appends values from another array.
  //  @param array an array
  //  @param other an array
  //  @return a new array
  public static function append(array: Dynamic, other: Dynamic): Dynamic;

  //  Interleaves arrays. It returns a single array made of values from all passed in arrays in their given order, interleaved.
  //  @param ... a variable list of arrays
  //  @return a new array
  public static function interleave(...: Dynamic): Dynamic;

  //  Interposes value in-between consecutive pair of values in array. <br/><em>Aliased as `intersperse`</em>
  //  @param array an array
  //  @param value a value
  //  @return a new array
  public static function interpose(array: Dynamic, value: Dynamic): Dynamic;

  //  Produces a flexible list of numbers. If one value is passed, will count from 1 to that value, with a default step of 1 (or -1). If two values are passed, will count from the first one to the second one, using a default step of 1 (or -1). A third value passed will be considered a step value.
  //  @param[opt] from the initial value of the range
  //  @param[optchain] to the final value of the range
  //  @param[optchain] step the step of count. Defaults to 1 or -1.
  //  @return a new array of numbers
  public static function range(from: Dynamic, to: Dynamic, step: Dynamic): Dynamic;

  //  Creates an array list of `n` values, repeated.
  //  @param value a value to be repeated
  //  @param n the number of repetitions of value.
  //  @return a new array of `n` values
  public static function rep(value: Dynamic, n: Dynamic): Dynamic;

  //  Returns the powerset of array values. For instance, when given the set {1,2,3}, returns `{{},{1},{2},{3},{1,2},{2,3},{1,3},{1,2,3}}`.
  //  @param array an array
  //  @return an array
  public static function powerset(array: Dynamic): Dynamic;

  //  Iterator returning partitions of an array. It returns arrays of length `n`  made of values from the given array. If the last partition has lower elements than `n` and  `pad` is supplied, it will be adjusted to `n` of elements with `pad` value.
  //  @param array an array
  //  @param[opt] n the size of partitions. Defaults to 1.
  //  @param[optchain] pads a value to adjust the last subsequence to the `n` elements
  //  @return an iterator function
  public static function partition(array: Dynamic, n: Dynamic, pads: Dynamic): Dynamic;

  //  Iterator returning overlapping partitions of an array.  If the last subsequence has lower elements than `n` and `pad` is  supplied, it will be adjusted to `n` elements with `pad` value.
  //  @param array an array
  //  @param[opt] n the size of partitions. Defaults to 2.
  //  @param[optchain] pads a value to adjust the last subsequence to the `n` elements
  //  @return an iterator function
  public static function overlapping(array: Dynamic, n: Dynamic, pads: Dynamic): Dynamic;

  //  Iterator returning sliding partitions of an array. <br/><em>Aliased as `sliding`</em>
  //  @param array an array
  //  @param[opt] n the size of partitions. Defaults to 2 (and then behaves like @{pairwise})
  //  @return an iterator function
  public static function aperture(array: Dynamic, n: Dynamic): Dynamic;

  //  Iterator returning sliding pairs of an array.
  //  @param array an array
  //  @return an iterator function
  public static function pairwise(array: Dynamic): Dynamic;

  //  Iterator returning the permutations of an array. It returns arrays made of all values from the passed-in array, with values permuted.
  //  @param array an array
  //  @return an iterator function
  public static function permutation(array: Dynamic): Dynamic;

  //  Concatenates values in a given array. Handles booleans as well. If `sep` string is passed, it will be used as a separator. Passing `i` and `j` will result in concatenating only values within `[i, j]` range. <br/><em>Aliased as `join`</em>
  //  @param array a given array
  //  @param[opt] sep a separator string, defaults to the empty string `''`.
  //  @param[optchain] i the starting index, defaults to 1.
  //  @param[optchain] j the final index, defaults to the array length.
  //  @return a string
  public static function concat(array: Dynamic, sep: Dynamic, i: Dynamic, j: Dynamic): Dynamic;

  //  Returns all possible pairs built from given arrays.
  //  @param array a first array
  //  @param array2 a second array
  //  @return an array list of all pairs
  public static function xprod(array: Dynamic, array2: Dynamic): Dynamic;

  //  Creates pairs from value and array. Value is always prepended to the pair.
  //  @param valua a value
  //  @param array an array
  //  @return an array list of all pairs
  public static function xpairs(valua: Dynamic, array: Dynamic): Dynamic;

  //  Creates pairs from value and array. Value is always appended as the last item to the pair.
  //  @param valua a value
  //  @param array an array
  //  @return an array list of all pairs
  public static function xpairsRight(valua: Dynamic, array: Dynamic): Dynamic;

  //  Returns the sum of array values.
  //  @param array a given array
  //  @return the sum of array values
  public static function sum(array: Dynamic): Dynamic;

  //  Returns the product of array values.
  //  @param array a given array
  //  @return the product of array values
  public static function product(array: Dynamic): Dynamic;

  //  Returns the mean of an array of numbers. <br/><em>Aliased as `average`</em>
  //  @param array an array of numbers
  //  @return a number
  public static function mean(array: Dynamic): Dynamic;

  //  Returns the median of an array of numbers.
  //  @param array an array of numbers
  //  @return a number
  public static function median(array: Dynamic): Dynamic;

  //  Utility functions

  //  @return nothing
  public static function noop(): Dynamic;

  //  Returns the passed-in value. This function is used internally as a default iterator.
  //  @param value a value
  //  @return the passed-in value
  public static function identity(value: Dynamic): Dynamic;

  //  Calls `f` with the supplied arguments. Returns the results of `f(...)`.
  //  @param f a function
  //  @param[opt] ... a vararg list of args to `f`
  //  @return the result of `f(...)` call.
  public static function call(f: Dynamic, ...: Dynamic): Dynamic;

  //  Creates a constant function which returns the same output on every call. <br/><em>Aliased as `always`</em>
  //  @param value a constant value
  //  @return a constant function
  public static function constant(value: Dynamic): Dynamic;

  //  Returns a function which applies `specs` on args. This function produces an object having the same structure than `specs` by mapping each property to the result of calling its  associated function with the supplied arguments
  //  @param specs a table
  //  @return a function
  public static function applySpec(specs: Dynamic): Dynamic;

  //  Threads `value` through a series of functions. If a function expects more than one args, it can be specified using an array list, where the first item is the function and the following are the remaining args neeeded. The value is used as the first input.
  //  @param value a value
  //  @param ... a vararg list of functions or arrays
  //  @return a value
  public static function thread(value: Dynamic, ...: Dynamic): Dynamic;

  //  Threads `value` through a series of functions. If a function expects more than one args, it can be specified using an array list, where the first item is the function and the following are the remaining args neeeded. The value is used as the last input.
  //  @param value a value
  //  @param ... a vararg list of functions or arrays
  //  @return a value
  public static function threadRight(value: Dynamic, ...: Dynamic): Dynamic;

  //  Returns a dispatching function. When called with arguments, this function invokes each of its functions in the passed-in order and returns the results of the first non-nil evaluation.
  //  @param ... a vararg list of functions
  //  @return a dispatch function
  public static function dispatch(...: Dynamic): Dynamic;

  //  Memoizes a given function by caching the computed result. Useful for speeding-up slow-running functions. <br/><em>Aliased as `cache`</em>
  //  @param f a function
  //  @return a new function
  public static function memoize(f: Dynamic): Dynamic;

  //  Builds a list from a seed value. Accepts an iterator function, which  returns either nil to stop iteration or two values : the value to add to the list of results and the seed to be used in the next call to the iterator function.
  //  @param f an iterator function
  //  @param seed a seed value
  //  @return an array of values
  public static function unfold(f: Dynamic, seed: Dynamic): Dynamic;

  //  Returns a version of `f` that runs only once. Successive calls to `f` will keep yielding the same output, no matter what the passed-in arguments are.  It can be used to initialize variables.
  //  @param f a function
  //  @return a new function
  public static function once(f: Dynamic): Dynamic;

  //  Returns a version of `f` that will run no more than <em>count</em> times. Next calls will keep yielding the results of the count-th call.
  //  @param f a function
  //  @param count a count
  //  @return a new function
  public static function before(f: Dynamic, count: Dynamic): Dynamic;

  //  Returns a version of `f` that runs on the `count-th` call. Useful when dealing with asynchronous tasks.
  //  @param f a function
  //  @param count the number of calls before `f` will start running.
  //  @return a new function
  public static function after(f: Dynamic, count: Dynamic): Dynamic;

  //  Composes functions. Each passed-in function consumes the return value of the function that follows. In math terms, composing the functions `f`, `g`, and `h` produces the function `f(g(h(...)))`.
  //  @param ... a variable number of functions
  //  @return a new function
  public static function compose(...: Dynamic): Dynamic;

  //  Pipes a value through a series of functions. In math terms,  given some functions `f`, `g`, and `h` in that order, it returns `f(g(h(value)))`.
  //  @param value a value
  //  @param ... a variable number of functions
  //  @return the result of the composition of function calls.
  public static function pipe(value: Dynamic, ...: Dynamic): Dynamic;

  //  Returns the logical complement of a given function. For a given input, the returned  function will output `false` if the original function would have returned `true`,  and vice-versa.
  //  @param f a function
  //  @return  the logical complement of the given function `f`.
  public static function complement(f: Dynamic): Dynamic;

  //  Calls a sequence of passed-in functions with the same argument. Returns a sequence of results.  <br/><em>Aliased as `juxt`</em>
  //  @param value a value
  //  @param ... a variable number of functions
  //  @return a list of results
  public static function juxtapose(value: Dynamic, ...: Dynamic): Dynamic;

  //  Wraps `f` inside of the `wrapper` function. It passes `f` as the first argument to `wrapper`. This allows the wrapper to execute code before and after `f` runs, adjust the arguments, and execute it conditionally.
  //  @param f a function to be wrapped, prototyped as `f (...)`
  //  @param wrapper a wrapper function, prototyped as `wrapper (f, ...)`
  //  @return the results
  public static function wrap(f: Dynamic, wrapper: Dynamic): Dynamic;

  //  Runs `iter` function `n` times. Collects the results of each run and returns them in an array.
  //  @param  iter an iterator function, prototyped as `iter (i)`
  //  @param[opt] n the number of times `iter` should be called. Defaults to 1.
  //  @return table an array of results
  public static function times(iter: Dynamic, n: Dynamic): Dynamic;

  //  Binds `v` to be the first argument to `f`. Calling `f (...)` will result to `f (v, ...)`.
  //  @param f a function
  //  @param v a value
  //  @return a function
  public static function bind(f: Dynamic, v: Dynamic): Dynamic;

  //  Binds `v` to be the second argument to `f`. Calling `f (a, ...)` will result to `f (a, v, ...)`.
  //  @param f a function
  //  @param v a value
  //  @return a function
  public static function bind2(f: Dynamic, v: Dynamic): Dynamic;

  //  Binds `...` to be the N-first arguments to function `f`.  Calling `f (a1, a2, ..., aN)` will result to `f (..., a1, a2, ...,aN)`.
  //  @param f a function
  //  @param ... a variable number of arguments
  //  @return a function
  public static function bindn(f: Dynamic, ...: Dynamic): Dynamic;

  //  Binds methods to object. As such, whenever any of these methods is invoked, it  always receives the object as its first argument.
  //  @param obj an abject
  //  @param ... a variable number of method names
  //  @return the passed-in object with all methods bound to the object itself.
  public static function bindall(obj: Dynamic, ...: Dynamic): Dynamic;

  //  Returns a function which iterate over a set of conditions. It invokes each predicate, passing it given values. It returns the value of the corresponding function of the first  predicate to return a non-nil value.
  //  @param conds an array list of predicate-function pairs
  //  @return the result of invoking `f(...)` of the first predicate to return a non-nil value
  public static function cond(conds: Dynamic): Dynamic;

  //  Returns a validation function. Given a set of functions, the validation function evaluates to `true` only when all its funcs returns `true`.
  //  @param ... an array list of functions
  //  @return `true` when all given funcs returns true with input, false otherwise
  public static function both(...: Dynamic): Dynamic;

  //  Returns a validation function. Given a set of functions, the validation function evaluates to `true` when at least one of its funcs returns `true`.
  //  @param ... an array list of functions
  //  @return `true` when one of the given funcs returns `true` with input, `false` otherwise
  public static function either(...: Dynamic): Dynamic;

  //  Returns a validation function. Given a set of functions, the validation function evaluates to `true` when neither of its func return `true`.
  //  @param ... an array list of functions
  //  @return `true` when neither of the given funcs returns `true` with input, `false` otherwise
  public static function neither(...: Dynamic): Dynamic;

  //  Generates an unique ID for the current session. If given a string `template`, it will use this template for output formatting. Otherwise, if `template` is a function, it will evaluate `template (id)`. <br/><em>Aliased as `uid`</em>.
  //  @param[opt] template either a string or a function template to format the ID
  //  @return value an ID
  public static function uniqueId(template: Dynamic): Dynamic;

  //  Produces an iterator which repeatedly apply a function `f` onto an input.  Yields `value`, then `f(value)`, then `f(f(value))`, continuously. <br/><em>Aliased as `iter`</em>.
  //  @param f a function
  //  @param value an initial input to `f`
  //  @param[opt] n the number of times the iterator should run
  //  @return an iterator function
  public static function iterator(f: Dynamic, value: Dynamic, n: Dynamic): Dynamic;

  //  Consumes the first `n` values of a iterator then returns it.
  //  @param iter an iterator function
  //  @param[opt] n a number. Defaults to 1.
  //  @return the given iterator
  public static function skip(iter: Dynamic, n: Dynamic): Dynamic;

  //  Iterates over an iterator and returns its values in an array.
  //  @param ... an iterator function (returning a generator, a state and a value)
  //  @return an array of results
  public static function tabulate(...: Dynamic): Dynamic;

  //  Returns the length of an iterator. It consumes the iterator itself.
  //  @param ... an iterator function (returning a generator, a state and a value)
  //  @return the iterator length
  public static function iterlen(...: Dynamic): Dynamic;

  //  Casts value as an array if it is not one.
  //  @param value a value
  //  @return an array containing the given value
  public static function castArray(value: Dynamic): Dynamic;

  //  Creates a function of `f` with arguments flipped in reverse order.
  //  @param f a function
  //  @return a function
  public static function flip(f: Dynamic): Dynamic;

  //  Returns a function that gets the nth argument.  If n is negative, the nth argument from the end is returned.
  //  @param n a number
  //  @return a function
  public static function nthArg(n: Dynamic): Dynamic;

  //  Returns a function which accepts up to one arg. It ignores any additional arguments.
  //  @param f a function
  //  @return a function
  public static function unary(f: Dynamic): Dynamic;

  //  Returns a function which accepts up to `n` args. It ignores any additional arguments. <br/><em>Aliased as `nAry`</em>.
  //  @param f a function
  //  @param[opt] n a number. Defaults to 1.
  //  @return a function
  public static function ary(f: Dynamic, n: Dynamic): Dynamic;

  //  Returns a function with an arity of 0. The new function ignores any arguments passed to it.
  //  @param f a function
  //  @return a new function
  public static function noarg(f: Dynamic): Dynamic;

  //  Returns a function which runs with arguments rearranged. Arguments are passed to the  returned function in the order of supplied `indexes` at call-time.
  //  @param f a function
  //  @param indexes an array list of indexes
  //  @return a function
  public static function rearg(f: Dynamic, indexes: Dynamic): Dynamic;

  //  Creates a function that runs transforms on all arguments it receives.
  //  @param ... a set of functions which will receive all arguments to the returned function
  //  @return a function
  public static function over(...: Dynamic): Dynamic;

  //  Creates a validation function. The returned function checks if *all* of the given predicates return  truthy when invoked with the arguments it receives.
  //  @param ... a list of predicate functions
  //  @return a new function
  public static function overEvery(...: Dynamic): Dynamic;

  //  Creates a validation function. The return function checks if *any* of a given predicates return  truthy when invoked with the arguments it receives.
  //  @param ... a list of predicate functions
  //  @return a new function
  public static function overSome(...: Dynamic): Dynamic;

  //  Creates a function that invokes `f` with its arguments transformed. 1rst arguments will be passed to  the 1rst transform, 2nd arg to the 2nd transform, etc. Remaining arguments will not be transformed.
  //  @param f a function
  //  @param ... a list of transforms funcs prototyped as `f (v)`
  //  @return the result of running `f` with its transformed arguments
  public static function overArgs(f: Dynamic, ...: Dynamic): Dynamic;

  //  Converges two functions into one.
  //  @param f a function
  //  @param g a function
  //  @param h a function
  //  @return a new version of function f
  public static function converge(f: Dynamic, g: Dynamic, h: Dynamic): Dynamic;

  //  Partially apply a function by filling in any number of its arguments.  One may pass a string `'M'` as a placeholder in the list of arguments to specify an argument  that should not be pre-filled, but left open to be supplied at call-time.
  //  @param f a function
  //  @param ... a list of partial arguments to `f`
  //  @return a new version of function f having some of it original arguments filled
  public static function partial(f: Dynamic, ...: Dynamic): Dynamic;

  //  Similar to @{partial}, but from the right.
  //  @param f a function
  //  @param ... a list of partial arguments to `f`
  //  @return a new version of function f having some of it original arguments filled
  public static function partialRight(f: Dynamic, ...: Dynamic): Dynamic;

  //  Curries a function. If the given function `f` takes multiple arguments, it returns another version of  `f` that takes a single argument (the first of the arguments to the original function) and returns a new  function that takes the remainder of the arguments and returns the result.
  //  @param f a function
  //  @param[opt] n_args the number of arguments expected for `f`. Defaults to 2.
  //  @return a curried version of `f`
  public static function curry(f: Dynamic, n_args: Dynamic): Dynamic;

  //  Returns the execution time of `f (...)` and its returned values.
  //  @param f a function
  //  @param[opt] ... optional args to `f`
  //  @return the execution time and the results of `f (...)`
  public static function time(f: Dynamic, ...: Dynamic): Dynamic;

  //  Object functions
  //  @param obj an object
  //  @return an array
  public static function keys(obj: Dynamic): Dynamic;

  //  Returns the values of the object properties.
  //  @param obj an object
  //  @return an array of values
  public static function values(obj: Dynamic): Dynamic;

  //  Returns the value at a given path in an object.  Path is given as a vararg list of keys.
  //  @param obj an object
  //  @param ... a vararg list of keys
  //  @return a value or nil
  public static function path(obj: Dynamic, ...: Dynamic): Dynamic;

  //  Spreads object under property path onto provided object.  It is similar to @{flattenPath}, but removes object under the property path.
  //  @param obj an object
  //  @param ... a property path given as a vararg list
  //  @return the passed-in object with changes
  public static function spreadPath(obj: Dynamic, ...: Dynamic): Dynamic;

  //  Flattens object under property path onto provided object.  It is similar to @{spreadPath}, but preserves object under the property path.
  //  @param obj an object
  //  @param ... a property path given as a vararg list
  //  @return the passed-in object with changes
  public static function flattenPath(obj: Dynamic, ...: Dynamic): Dynamic;

  //  Converts key-value pairs to an array-list of `[k, v]` pairs.
  //  @param obj an object
  //  @return an array list of key-value pairs
  public static function kvpairs(obj: Dynamic): Dynamic;

  //  Converts an array list of `[k,v]` pairs to an object. Keys are taken from the 1rst column in the `[k,v]` pairs sequence, associated with values in the 2nd column.
  //  @param kvpairs an array-list of `[k,v]` pairs
  //  @return an object
  public static function toObj(kvpairs: Dynamic): Dynamic;

  //  Swaps keys with values. Produces a new object where previous keys are now values,  while previous values are now keys. <br/><em>Aliased as `mirror`</em>
  //  @param obj a given object
  //  @return a new object
  public static function invert(obj: Dynamic): Dynamic;

  //  Returns a function that will return the key property of any passed-in object.
  //  @param key a key property name
  //  @return a function which should accept an object as argument
  public static function property(key: Dynamic): Dynamic;

  //  Returns a function which will return the value of an object property.
  //  @param obj an object
  //  @return a function which should accept a key property argument
  public static function propertyOf(obj: Dynamic): Dynamic;

  //  Converts any given value to a boolean
  //  @param value a value. Can be of any type
  //  @return `true` if value is true, `false` otherwise (false or nil).
  public static function toBoolean(value: Dynamic): Dynamic;

  //  Extends an object properties. It copies the properties of extra passed-in objects into the destination object, and returns the destination object. The last objects will override properties of the same name.
  //  @param destObj a destination object
  //  @param ... a list of objects
  //  @return the destination object extended
  public static function extend(destObj: Dynamic, ...: Dynamic): Dynamic;

  //  Returns a sorted list of all methods names found in an object. If the given object has a metatable implementing an `__index` field pointing to another table, will also recurse on this table if `recurseMt` is provided. If `obj` is omitted, it defaults to the library functions. <br/><em>Aliased as `methods`</em>.
  //  @param[opt] obj an object. Defaults to Moses library functions.
  //  @return an array-list of methods names
  public static function functions(obj: Dynamic): Dynamic;

  //  Clones a given object properties. If `shallow` is passed will also clone nested array properties.
  //  @param obj an object
  //  @param[opt] shallow whether or not nested array-properties should be cloned, defaults to false.
  //  @return a copy of the passed-in object
  public static function clone(obj: Dynamic, shallow: Dynamic): Dynamic;

  //  Invokes interceptor with the object, and then returns object. The primary purpose of this method is to "tap into" a method chain, in order to perform operations  on intermediate results within the chain.
  //  @param obj an object
  //  @param f an interceptor function, should be prototyped as `f (obj)`
  //  @return the passed-in object
  public static function tap(obj: Dynamic, f: Dynamic): Dynamic;

  //  Checks if a given object implements a property.
  //  @param obj an object
  //  @param key a key property to be checked
  //  @return `true` or `false`
  public static function has(obj: Dynamic, key: Dynamic): Dynamic;

  //  Returns an object copy having white-listed properties. <br/><em>Aliased as `choose`</em>.
  //  @param obj an object
  //  @param ... a variable number of string keys
  //  @return the filtered object
  public static function pick(obj: Dynamic, ...: Dynamic): Dynamic;

  //  Returns an object copy without black-listed properties. <br/><em>Aliased as `drop`</em>.
  //  @param obj an object
  //  @param ... a variable number of string keys
  //  @return the filtered object
  public static function omit(obj: Dynamic, ...: Dynamic): Dynamic;

  //  Applies a template to an object, preserving non-nil properties. <br/><em>Aliased as `defaults`</em>.
  //  @param obj an object
  //  @param[opt] template a template object. If `nil`, leaves `obj` untouched.
  //  @return the passed-in object filled
  public static function template(obj: Dynamic, template: Dynamic): Dynamic;

  //  Performs a deep comparison test between two objects. Can compare strings, functions  (by reference), nil, booleans. Compares tables by reference or by values. If `useMt`  is passed, the equality operator `==` will be used if one of the given objects has a  metatable implementing `__eq`. <br/><em>Aliased as `M.compare`, `M.matches`</em>
  //  @param objA an object
  //  @param objB another object
  //  @param[opt] useMt whether or not `__eq` should be used, defaults to false.
  //  @return `true` or `false`
  public static function isEqual(objA: Dynamic, objB: Dynamic, useMt: Dynamic): Dynamic;

  //  Invokes an object method. It passes the object itself as the first argument. if `method` is not callable, will return `obj[method]`.
  //  @param obj an object
  //  @param method a string key to index in object `obj`.
  //  @return the returned value of `method (obj)` call
  public static function result(obj: Dynamic, method: Dynamic): Dynamic;

  //  Checks if the given arg is a table.
  //  @param t a value to be tested
  //  @return `true` or `false`
  public static function isTable(t: Dynamic): Dynamic;

  //  Checks if the given argument is callable. Assumes `obj` is callable if it is either a function or a table having a metatable implementing `__call` metamethod.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isCallable(obj: Dynamic): Dynamic;

  //  Checks if the given argument is an array. Assumes `obj` is an array if is a table with consecutive integer keys starting at 1.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isArray(obj: Dynamic): Dynamic;

  //  Checks if the given object is iterable with `pairs` (or `ipairs`).
  //  @param obj an object
  //  @return `true` if the object can be iterated with `pairs` (or `ipairs`), `false` otherwise
  public static function isIterable(obj: Dynamic): Dynamic;

  //  Extends Lua's `type` function. It returns the type of the given object and also recognises file userdata
  //  @param obj an object
  //  @return the given object type
  public static function type(obj: Dynamic): String;

  //  Checks if the given pbject is empty. If `obj` is a string, will return `true` if `#obj == 0`. Otherwise, if `obj` is a table, will return whether or not this table is empty. If `obj` is `nil`, it will return true.
  //  @param[opt] obj an object
  //  @return `true` or `false`
  public static function isEmpty(obj: Dynamic): Bool;

  //  Checks if the given argument is a string.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isString(obj: Dynamic): Bool;

  //  Checks if the given argument is a function.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isFunction(obj: Dynamic): Bool;

  //  Checks if the given argument is nil.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isNil(obj: Dynamic): Bool;

  //  Checks if the given argument is a number.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isNumber(obj: Dynamic): Bool;

  //  Checks if the given argument is NaN (see [Not-A-Number](http://en.wikipedia.org/wiki/NaN)).
  //  @param obj an object
  //  @return `true` or `false`
  public static function isNaN(obj: Dynamic): Bool;

  //  Checks if the given argument is a finite number.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isFinite(obj: Dynamic): Bool;

  //  Checks if the given argument is a boolean.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isBoolean(obj: Dynamic): Bool;

  //  Checks if the given argument is an integer.
  //  @param obj an object
  //  @return `true` or `false`
  public static function isInteger(obj: Dynamic): Bool;

  //  Returns a wrapped object. Calling library functions as methods on this object will continue to return wrapped objects until @{obj:value} is used. Can be aliased as `M(value)`.
  //  @param value a value to be wrapped
  //  @return a wrapped object
  public static function chain(value: Dynamic): ChainingCalls;
}

extern class ChainingCalls implements Dynamic {
  //  Extracts the value of a wrapped object. Must be called on an chained object (see @{chain}).
  //  @return the value previously wrapped
  public function value(): Dynamic;
}
