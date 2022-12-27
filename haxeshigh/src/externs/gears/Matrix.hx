package externs.gears;


@:luaRequire("gears.matrix")
extern class Matrix {
    /** An implementation of matrices for describing and working with affine
 transformations.
     * @see lib/gears/matrix.lua:9
     */

    /** Create a new matrix instance
     *
     * @see lib/gears/matrix.lua:24
     * @param xx Float  The xx transformation part.
     * @param yx Float  The yx transformation part.
     * @param xy Float  The xy transformation part.
     * @param yy Float  The yy transformation part.
     * @param x0 Float  The x0 transformation part.
     * @param y0 Float  The y0 transformation part.
     */
    @:selfCall function new(xx: Float, yx: Float, xy: Float, yy: Float, x0: Float, y0: Float);

    /** Create a new translation matrix
     *
     * @see lib/gears/matrix.lua:36
     * @param x Float  The translation in x direction.
     * @param y Float  The translation in y direction.
     */
    static function create_translate(x: Float, y: Float): Void;

    /** Create a new scaling matrix
     *
     * @see lib/gears/matrix.lua:45
     * @param sx Float  The scaling in x direction.
     * @param sy Float  The scaling in y direction.
     */
    static function create_scale(sx: Float, sy: Float): Void;

    /** Create a new rotation matrix
     *
     * @see lib/gears/matrix.lua:53
     * @param angle Float  The angle of the rotation in radians.
     */
    static function create_rotate(angle: Float): Void;

    /** Create a new rotation matrix rotating around a custom point
     *
     * @see lib/gears/matrix.lua:64
     * @param x Float  The horizontal rotation point
     * @param y Float  The vertical rotation point
     * @param angle Float  The angle of the rotation in radians.
     */
    static function create_rotate_at(x: Float, y: Float, angle: Float): Void;

    /** Translate this matrix
     *
     * @see lib/gears/matrix.lua:74
     * @param x Float  The translation in x direction.
     * @param y Float  The translation in y direction.
     */
    static function translate(x: Float, y: Float): Void;

    /** Scale this matrix
     *
     * @see lib/gears/matrix.lua:82
     * @param sx Float  The scaling in x direction.
     * @param sy Float  The scaling in y direction.
     */
    static function scale(sx: Float, sy: Float): Void;

    /** Rotate this matrix
     *
     * @see lib/gears/matrix.lua:89
     * @param angle Float  The angle of the rotation in radians.
     */
    static function rotate(angle: Float): Void;

    /** Rotate a shape from a custom point
     *
     * @see lib/gears/matrix.lua:98
     * @param x Float  The horizontal rotation point
     * @param y Float  The vertical rotation point
     * @param angle Float  The angle (in radiant: -2*math.pi to 2*math.pi)
     */
    static function rotate_at(x: Float, y: Float, angle: Float): Void;

    /** Invert this matrix
     *
     * @see lib/gears/matrix.lua:104
     */
    static function invert(): Void;

    /** Multiply this matrix with another matrix.
     *
     * @see lib/gears/matrix.lua:120
     * @param other extype.extern.Mixed.Mixed2<gears.matrix, cairo.Matrix>  The other matrix to multiply with.
     */
    static function multiply(other: extype.extern.Mixed.Mixed2<gears.matrix, cairo.Matrix>): Void;

    /** Check if two matrices are equal.
     *
     * @see lib/gears/matrix.lua:136
     * @param other extype.extern.Mixed.Mixed2<gears.matrix, cairo.Matrix>  The matrix to compare with.
     */
    static function equals(other: extype.extern.Mixed.Mixed2<gears.matrix, cairo.Matrix>): Void;

    /** Get a string representation of this matrix
     *
     * @see lib/gears/matrix.lua:147
     */
    static function tostring(): Void;

    /** Transform a distance by this matrix.
     *
     * @see lib/gears/matrix.lua:160
     * @param x Float  The x coordinate of the point.
     * @param y Float  The y coordinate of the point.
     */
    static function transform_distance(x: Float, y: Float): Float;

    /** Transform a point by this matrix.
     *
     * @see lib/gears/matrix.lua:169
     * @param x Float  The x coordinate of the point.
     * @param y Float  The y coordinate of the point.
     */
    static function transform_point(x: Float, y: Float): Float;

    /** Calculate a bounding rectangle for transforming a rectangle by a matrix.
     *
     * @see lib/gears/matrix.lua:183
     * @param x Float  The x coordinate of the rectangle.
     * @param y Float  The y coordinate of the rectangle.
     * @param width Float  The width of the rectangle.
     * @param height Float  The height of the rectangle.
     */
    static function transform_rectangle(x: Float, y: Float, width: Float, height: Float): Float;

    /** Convert to a cairo matrix
     *
     * @see lib/gears/matrix.lua:200
     */
    static function to_cairo_matrix(): cairo.Matrix;

    /** Convert to a cairo matrix
     *
     * @see lib/gears/matrix.lua:209
     * @param mat cairo.Matrix  A cairo matrix describing the sought transformation
     */
    static function from_cairo_matrix(mat: cairo.Matrix): gears.matrix;
}
