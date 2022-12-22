package externs.awful;


@:luaRequire("awful.titlebar")
extern class Titlebar {
/** Titlebars for awful.
 * lib/awful/titlebar.lua:63
 */
/**
 * Create a new titlebar for the given client.
 * @see lib/awful/titlebar.lua:613
 * @param c externs.Client  The client the titlebar will be attached to.
 * @param args lua.Table<String, Dynamic>  A table with extra arguments for the titlebar.
 */
static function titlebar(c: externs.Client, args: lua.Table<String, Dynamic>): wibox.drawable;
/**
 * Create a new title widget.
 * @see lib/awful/titlebar.lua:768
 * @param c Dynamic  The client for which a titlewidget should be created.
 */
static function titlewidget(c: Dynamic);
/**
 * Create a new icon widget.
 * @see lib/awful/titlebar.lua:792
 * @param c Dynamic  The client for which an icon widget should be created.
 */
static function iconwidget(c: Dynamic);
/**
 * Create a new button widget.
 * @see lib/awful/titlebar.lua:813
 * @param c Dynamic  The client for which a button is created.
 * @param name String  Name of the button, used for accessing the theme and
   in the tooltip.
 * @param selector Dynamic  A function that selects the image that should be displayed.
 * @param action Dynamic  Function that is called when the button is clicked.
 */
static function button(c: Dynamic, name: String, selector: Dynamic, action: Dynamic);
/**
 * Create a new float button for a client.
 * @see lib/awful/titlebar.lua:901
 * @param c Dynamic  The client for which the button is wanted.
 */
static function floatingbutton(c: Dynamic);
/**
 * Create a new maximize button for a client.
 * @see lib/awful/titlebar.lua:910
 * @param c Dynamic  The client for which the button is wanted.
 */
static function maximizedbutton(c: Dynamic);
/**
 * Create a new minimize button for a client.
 * @see lib/awful/titlebar.lua:923
 * @param c Dynamic  The client for which the button is wanted.
 */
static function minimizebutton(c: Dynamic);
/**
 * Create a new closing button for a client.
 * @see lib/awful/titlebar.lua:934
 * @param c Dynamic  The client for which the button is wanted.
 */
static function closebutton(c: Dynamic);
/**
 * Create a new ontop button for a client.
 * @see lib/awful/titlebar.lua:941
 * @param c Dynamic  The client for which the button is wanted.
 */
static function ontopbutton(c: Dynamic);
/**
 * Create a new sticky button for a client.
 * @see lib/awful/titlebar.lua:952
 * @param c Dynamic  The client for which the button is wanted.
 */
static function stickybutton(c: Dynamic);
/**
 * Set a declarative widget hierarchy description.
 * @see lib/awful/titlebar.lua:504
 * @param args Dynamic  An array containing the widgets disposition
 */
function setup(args: Dynamic);
/**
 * Show the client's titlebar.
 * @see lib/awful/titlebar.lua:681
 * @param c Dynamic  The client whose titlebar is modified
 * @param position String  The position of the titlebar. Must be one of `"left"`,
   `"right"`, `"top"`, `"bottom"`.
 */
static function show(c: Dynamic, position: String);
/**
 * Hide the client's titlebar.
 * @see lib/awful/titlebar.lua:695
 * @param c Dynamic  The client whose titlebar is modified
 * @param position String  The position of the titlebar. Must be one of `"left"`,
   `"right"`, `"top"`, `"bottom"`.
 */
static function hide(c: Dynamic, position: String);
/**
 * Toggle the client's titlebar, hiding it if it is visible, otherwise showing it.
 * @see lib/awful/titlebar.lua:707
 * @param c Dynamic  The client whose titlebar is modified
 * @param position String  The position of the titlebar. Must be one of `"left"`,
   `"right"`, `"top"`, `"bottom"`.
 */
static function toggle(c: Dynamic, position: String);
}
