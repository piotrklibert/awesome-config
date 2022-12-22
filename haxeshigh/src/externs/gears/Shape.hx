package externs.gears;


@:luaRequire("gears.shape")
extern class Shape {
/** Module dedicated to gather common shape painters.
 * lib/gears/shape.lua:44
 */
/**
 * Add a squircle shape with only some of the corner are "circled" to the current path.
 * @see lib/gears/shape.lua:86
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param tl Bool  If the top left corner is rounded
 * @param tr Bool  If the top right corner is rounded
 * @param br Bool  If the bottom right corner is rounded
 * @param bl Bool  If the bottom left corner is rounded
 * @param rate Int  The "squareness" of the squircle, should be greater than 1
 * @param delta Int  The "smoothness" of the shape, delta must be greater than 0.01 and will be reset to 0.01 if not
 */
static function partial_squircle(cr: Dynamic, width: Int, height: Int, tl: Bool, tr: Bool, br: Bool, bl: Bool, rate: Int, delta: Int);
/**
 * Add a squircle shape to the current path.
 * @see lib/gears/shape.lua:186
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param rate Int  The "squareness" of the squircle, should be greater than 1
 * @param delta Int  The "smoothness" of the shape, delta must be greater than 0.01 and will be reset to 0.01 if not
 */
static function squircle(cr: Dynamic, width: Int, height: Int, rate: Int, delta: Int);
/**
 * Add a star shape to the current path.
 * @see lib/gears/shape.lua:209
 * @param cr Dynamic  A cairo context
 * @param width Int  The width constraint
 * @param height Int  The height constraint
 * @param n Int  Number of grams (default n = 5 -> pentagram)
 */
static function star(cr: Dynamic, width: Int, height: Int, n: Int);
/**
 * Add a rounded rectangle to the current path.
 * @see lib/gears/shape.lua:250
 * @param cr Dynamic  A cairo content
 * @param width Int  The rectangle width
 * @param height Int  The rectangle height
 * @param radius Int  the corner radius
 */
static function rounded_rect(cr: Dynamic, width: Int, height: Int, radius: Int);
/**
 * Add a rectangle delimited by 2 180 degree arcs to the path.
 * @see lib/gears/shape.lua:287
 * @param cr Dynamic  A cairo content
 * @param width Dynamic  The rectangle width
 * @param height Dynamic  The rectangle height.
 */
static function rounded_bar(cr: Dynamic, width: Dynamic, height: Dynamic);
/**
 * A rounded rect with only some of the corners rounded.
 * @see lib/gears/shape.lua:311
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param tl Bool  If the top left corner is rounded
 * @param tr Bool  If the top right corner is rounded
 * @param br Bool  If the bottom right corner is rounded
 * @param bl Bool  If the bottom left corner is rounded
 * @param rad Int  The corner radius
 */
static function partially_rounded_rect(cr: Dynamic, width: Int, height: Int, tl: Bool, tr: Bool, br: Bool, bl: Bool, rad: Int);
/**
 * A rounded rectangle with a triangle at the top.
 * @see lib/gears/shape.lua:376
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param corner_radius Int  The corner radius
 * @param arrow_size Int  The width and height of the arrow
 * @param arrow_position Int  The position of the arrow
 */
static function infobubble(cr: Dynamic, width: Int, height: Int, corner_radius: Int, arrow_size: Int, arrow_position: Int);
/**
 * A rectangle terminated by an arrow.
 * @see lib/gears/shape.lua:417
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param arrow_length Int  The length of the arrow part
 */
static function rectangular_tag(cr: Dynamic, width: Int, height: Int, arrow_length: Int);
/**
 * A simple arrow shape.
 * @see lib/gears/shape.lua:454
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param head_width Int  The width of the head (/\) of the arrow
 * @param shaft_width Int  The width of the shaft of the arrow
 * @param shaft_length Int  The head_length of the shaft (the rest is the head)
 */
static function arrow(cr: Dynamic, width: Int, height: Int, head_width: Int, shaft_width: Int, shaft_length: Int);
/**
 * A squeezed hexagon filling the rectangle.
 * @see lib/gears/shape.lua:486
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 */
static function hexagon(cr: Dynamic, width: Int, height: Int);
/**
 * Double arrow popularized by the vim-powerline module.
 * @see lib/gears/shape.lua:513
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param arrow_depth Int  The width of the arrow part of the shape
 */
static function powerline(cr: Dynamic, width: Int, height: Int, arrow_depth: Int);
/**
 * An isosceles triangle.
 * @see lib/gears/shape.lua:548
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 */
static function isosceles_triangle(cr: Dynamic, width: Int, height: Int);
/**
 * A cross (**+**) symbol.
 * @see lib/gears/shape.lua:571
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param thickness Int  The cross section thickness
 */
static function cross(cr: Dynamic, width: Int, height: Int, thickness: Int);
/**
 * A similar shape to the `rounded_rect`, but with sharp corners.
 * @see lib/gears/shape.lua:606
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param corner_radius Int 
 */
static function octogon(cr: Dynamic, width: Int, height: Int, corner_radius: Int);
/**
 * A circle shape.
 * @see lib/gears/shape.lua:637
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param radius Int  The radius
 */
static function circle(cr: Dynamic, width: Int, height: Int, radius: Int);
/**
 * A simple rectangle.
 * @see lib/gears/shape.lua:659
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 */
static function rectangle(cr: Dynamic, width: Int, height: Int);
/**
 * A diagonal parallelogram with the bottom left corner at x=0 and top right at x=width.
 * @see lib/gears/shape.lua:680
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param base_width Int  The parallelogram base width
 */
static function parallelogram(cr: Dynamic, width: Int, height: Int, base_width: Int);
/**
 * A losange.
 * @see lib/gears/shape.lua:704
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 */
static function losange(cr: Dynamic, width: Int, height: Int);
/**
 * A pie.
 * @see lib/gears/shape.lua:732
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param start_angle Int  The start angle (in radian)
 * @param end_angle Int  The end angle (in radian)
 * @param radius Int  The shape height
 */
static function pie(cr: Dynamic, width: Int, height: Int, start_angle: Int, end_angle: Int, radius: Int);
/**
 * A rounded arc.
 * @see lib/gears/shape.lua:777
 * @param cr Dynamic  A cairo context
 * @param width Int  The shape width
 * @param height Int  The shape height
 * @param thickness Int  The arc thickness
 * @param start_angle Int  The start angle (in radian)
 * @param end_angle Int  The end angle (in radian)
 * @param start_rounded Bool  if the arc start rounded
 * @param end_rounded Bool  if the arc end rounded
 */
static function arc(cr: Dynamic, width: Int, height: Int, thickness: Int, start_angle: Int, end_angle: Int, start_rounded: Bool, end_rounded: Bool);
/**
 * A partial rounded bar.
 * @see lib/gears/shape.lua:907
 * @param cr Dynamic  A cairo context
 * @param w Int  The shape width
 * @param h Int  The shape height
 * @param percent Int  The progressbar percent
 * @param hide_left Bool  Do not draw the left side of the shape
 */
static function radial_progress(cr: Dynamic, w: Int, h: Int, percent: Int, hide_left: Bool);
/**
 * Adjust the shape using a transformation object
 * @see lib/gears/shape.lua:974
 * @param shape Dynamic  A shape function
 */
static function transform(shape: Dynamic);
}
