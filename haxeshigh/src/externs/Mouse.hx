package externs;


@:luaRequire("mouse")
extern class Mouse {
/** awesome mouse API.
 * mouse.c:63
 */
/**
 * The `screen` under the cursor
 * @see mouse.c:80
 */
var screen: Dynamic;
/**
 * Get the client currently under the mouse cursor.
 * @see mouse.c:119
 */
var current_client: Dynamic;
/**
 * Get the wibox currently under the mouse cursor.
 * @see mouse.c:130
 */
var current_wibox: Dynamic;
/**
 * Get the widgets currently under the mouse cursor.
 * @see mouse.c:145
 */
var current_widgets: Null<lua.Table<String, Dynamic>>;
/**
 * Get the topmost widget currently under the mouse cursor.
 * @see mouse.c:169
 */
var current_widget: Null<externs.wibox.Widget>;
/**
 * Get the current widget geometry.
 * @see mouse.c:182
 */
var current_widget_geometry: Dynamic;
/**
 * Get the current widget geometries.
 * @see mouse.c:193
 */
var current_widget_geometries: A;
/**
 * True if the left mouse button is pressed.
 * @see mouse.c:233
 */
var is_left_mouse_button_pressed: Bool;
/**
 * True if the right mouse button is pressed.
 * @see mouse.c:237
 */
var is_right_mouse_button_pressed: Bool;
/**
 * True if the middle mouse button is pressed.
 * @see mouse.c:241
 */
var is_middle_mouse_button_pressed: Bool;
/**
 * Add multiple `awful.button` based mousebindings to the global set.
 * @see mouse.c:266
 * @param buttons lua.Table<String, Dynamic>  A table of `awful.button` objects. Optionally, it can have
  a `group` entry. If set, the `group` property will be set on all `awful.buttons`
  objects.
 */
static function append_global_mousebindings(buttons: lua.Table<String, Dynamic>);
/**
 * Set the resize mode.
 * @see mouse.c:54
 * @param m String  The mode
 */
static function set_mode(m: String);
/**
 * Add an initialization callback.
 * @see mouse.c:64
 * @param cb Function  The callback (or nil)
 * @param context String  The callback context
 */
static function add_enter_callback(cb: Function, context: String);
/**
 * Add a "move" callback.
 * @see mouse.c:76
 * @param cb Function  The callback (or nil)
 * @param context String  The callback context
 */
static function add_move_callback(cb: Function, context: String);
/**
 * Add a "leave" callback This callback is executed just before the `mousegrabber` stop
 * @see mouse.c:87
 * @param cb Function  The callback (or nil)
 * @param context String  The callback context
 */
static function add_leave_callback(cb: Function, context: String);
/**
 * Resize the drawable.
 * @see mouse.c:107
 * @param client externs.Client  A client.
 * @param context String  The resizing context.
 * @param args lua.Table<String, Dynamic>  A set of `awful.placement` arguments.
 */
static function resize(client: externs.Client, context: String, args: lua.Table<String, Dynamic>);
/**
 * Snap a client to the closest client or screen edge.
 * @see mouse.c:201
 * @param c Dynamic  The client to snap.
 * @param snap Dynamic  The pixel to snap clients.
 * @param x Dynamic  The client x coordinate.
 * @param y Dynamic  The client y coordinate.
 * @param fixed_x Dynamic  True if the client isn't allowed to move in the x direction.
 * @param fixed_y Dynamic  True if the client isn't allowed to move in the y direction.
 */
static function snap(c: Dynamic, snap: Dynamic, x: Dynamic, y: Dynamic, fixed_x: Dynamic, fixed_y: Dynamic);
/**
 * Get the client or any object which is under the pointer.
 * @see mouse.c:270
 */
static function object_under_pointer(): client.object|nil;
/**
 * Move a client.
 * @see mouse.c:21
 * @param c Dynamic  The client to move, or the focused one if nil.
 * @param snap Dynamic  The pixel to snap clients.
 * @param finished_cb Dynamic  Deprecated, do not use.
 */
static function move(c: Dynamic, snap: Dynamic, finished_cb: Dynamic);
/**
 * Resize a client.
 * @see mouse.c:106
 * @param c Dynamic  The client to resize, or the focused one by default.
 * @param corner String  The corner to grab on resize. Auto detected by default.
 * @param args lua.Table<String, Dynamic>  A set of `awful.placement` arguments
 */
static function resize(c: Dynamic, corner: String, args: lua.Table<String, Dynamic>): String;
/**
 * Move the wibox under the cursor.
 * @see mouse.c:203
 * @param w wibox  The wibox to move, or none to use that under the pointer
 */
static function move(w: wibox);
/**
 * Add an `awful.button` based mousebinding to the global set.
 * @see mouse.c:251
 * @param button awful.button  The button object.
 */
static function append_global_mousebinding(button: awful.button);
/**
 * Remove a mousebinding from the global set.
 * @see mouse.c:288
 * @param button awful.button  The button object.
 */
static function remove_global_mousebinding(button: awful.button);
/**
 * Add an `awful.button` to the default client buttons.
 * @see mouse.c:303
 * @param button awful.button  The button.
 */
static function append_client_mousebinding(button: awful.button);
/**
 * Add a `awful.button`s to the default client buttons.
 * @see mouse.c:322
 * @param buttons lua.Table<String, Dynamic>  A table containing `awful.button` objects.
 */
static function append_client_mousebindings(buttons: lua.Table<String, Dynamic>);
/**
 * Remove a mousebinding from the default client buttons.
 * @see mouse.c:335
 * @param button awful.button  The button.
 */
static function remove_client_mousebinding(button: awful.button): Bool;
/**
 * Get or set the mouse coords.
 * @see mouse.c:417
 * @param coords_table lua.Table<String, Dynamic>  None or a table with x and y keys as mouse
  coordinates.
 * @param silent Bool  Disable mouse::enter or mouse::leave events that
  could be triggered by the pointer when moving.
 */
static function coords(coords_table: lua.Table<String, Dynamic>, silent: Bool): Int;
}
