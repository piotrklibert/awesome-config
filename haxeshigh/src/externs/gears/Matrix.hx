package externs.gears;


@:luaRequire("gears.matrix")
extern class Matrix {
/** An implementation of matrices for describing and working with affine
 transformations.
 * lib/gears/matrix.lua:9
 */
/**
 * Create a new matrix instance
 * @see lib/gears/matrix.lua:24
 * @param xx Int  The xx transformation part.
 * @param yx Int  The yx transformation part.
 * @param xy Int  The xy transformation part.
 * @param yy Int  The yy transformation part.
 * @param x0 Int  The x0 transformation part.
 * @param y0 Int  The y0 transformation part.
 */
static function create(xx: Int, yx: Int, xy: Int, yy: Int, x0: Int, y0: Int);
/**
 * Create a new translation matrix
 * @see lib/gears/matrix.lua:36
 * @param x Int  The translation in x direction.
 * @param y Int  The translation in y direction.
 */
static function create_translate(x: Int, y: Int);
/**
 * Create a new scaling matrix
 * @see lib/gears/matrix.lua:45
 * @param sx Int  The scaling in x direction.
 * @param sy Int  The scaling in y direction.
 */
static function create_scale(sx: Int, sy: Int);
/**
 * Create a new rotation matrix
 * @see lib/gears/matrix.lua:53
 * @param angle Int  The angle of the rotation in radians.
 */
static function create_rotate(angle: Int);
/**
 * Create a new rotation matrix rotating around a custom point
 * @see lib/gears/matrix.lua:64
 * @param x Int  The horizontal rotation point
 * @param y Int  The vertical rotation point
 * @param angle Int  The angle of the rotation in radians.
 */
static function create_rotate_at(x: Int, y: Int, angle: Int);
/**
 * Translate this matrix
 * @see lib/gears/matrix.lua:74
 * @param x Int  The translation in x direction.
 * @param y Int  The translation in y direction.
 */
static function matrix:translate(x: Int, y: Int);
/**
 * Scale this matrix
 * @see lib/gears/matrix.lua:82
 * @param sx Int  The scaling in x direction.
 * @param sy Int  The scaling in y direction.
 */
static function matrix:scale(sx: Int, sy: Int);
/**
 * Rotate this matrix
 * @see lib/gears/matrix.lua:89
 * @param angle Int  The angle of the rotation in radians.
 */
static function matrix:rotate(angle: Int);
/**
 * Rotate a shape from a custom point
 * @see lib/gears/matrix.lua:98
 * @param x Int  The horizontal rotation point
 * @param y Int  The vertical rotation point
 * @param angle Int  The angle (in radiant: -2*math.pi to 2*math.pi)
 */
static function matrix:rotate_at(x: Int, y: Int, angle: Int);
/**
 * Invert this matrix
 * @see lib/gears/matrix.lua:104
 */
static function matrix:invert();
/**
 * Multiply this matrix with another matrix.
 * @see lib/gears/matrix.lua:120
 * @param other haxe.extern.EitherType<gears.matrix, cairo.Matrix>  The other matrix to multiply with.
 */
static function matrix:multiply(other: haxe.extern.EitherType<gears.matrix, cairo.Matrix>);
/**
 * Check if two matrices are equal.
 * @see lib/gears/matrix.lua:136
 * @param other haxe.extern.EitherType<gears.matrix, cairo.Matrix>  The matrix to compare with.
 */
static function matrix:equals(other: haxe.extern.EitherType<gears.matrix, cairo.Matrix>);
/**
 * Get a string representation of this matrix
 * @see lib/gears/matrix.lua:147
 */
static function matrix:tostring();
/**
 * Transform a distance by this matrix.
 * @see lib/gears/matrix.lua:160
 * @param x Int  The x coordinate of the point.
 * @param y Int  The y coordinate of the point.
 */
static function matrix:transform_distance(x: Int, y: Int): Int;
/**
 * Transform a point by this matrix.
 * @see lib/gears/matrix.lua:169
 * @param x Int  The x coordinate of the point.
 * @param y Int  The y coordinate of the point.
 */
static function matrix:transform_point(x: Int, y: Int): Int;
/**
 * Calculate a bounding rectangle for transforming a rectangle by a matrix.
 * @see lib/gears/matrix.lua:183
 * @param x Int  The x coordinate of the rectangle.
 * @param y Int  The y coordinate of the rectangle.
 * @param width Int  The width of the rectangle.
 * @param height Int  The height of the rectangle.
 */
static function matrix:transform_rectangle(x: Int, y: Int, width: Int, height: Int): Int;
/**
 * Convert to a cairo matrix
 * @see lib/gears/matrix.lua:200
 */
static function matrix:to_cairo_matrix(): cairo.Matrix;
/**
 * Convert to a cairo matrix
 * @see lib/gears/matrix.lua:209
 * @param mat cairo.Matrix  A cairo matrix describing the sought transformation
 */
static function matrix:from_cairo_matrix(mat: cairo.Matrix): gears.matrix;
}
