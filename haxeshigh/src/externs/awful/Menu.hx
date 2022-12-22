package externs.awful;


@:luaRequire("awful.menu")
extern class Menu {
/** A menu for awful.
 * lib/awful/menu.lua:11
 */
/**
 * Build a popup menu with running clients and show it.
 * @see lib/awful/menu.lua:526
 * @param args lua.Table<String, Dynamic>  Menu table, see `new()` for more information.
 * @param item_args lua.Table<String, Dynamic>  Table that will be merged into each item, see
   `new()` for more information.
 * @param filter func  A function taking a client as an argument and
   returning `true` or `false` to indicate whether the client should be
   included in the menu.
 */
static function clients(args: lua.Table<String, Dynamic>, item_args: lua.Table<String, Dynamic>, filter: func);
/**
 * Use menu.clients to build and open the client menu if it isn't already open.
 * @see lib/awful/menu.lua:569
 * @param args lua.Table<String, Dynamic>  Menu table, see `new()` for more information.
 * @param item_args lua.Table<String, Dynamic>  Table that will be merged into each item, see
   `new()` for more information.
 * @param filter func  A function taking a client as an argument and
   returning `true` or `false` to indicate whether the client should be
   included in the menu.
 */
static function client_list(args: lua.Table<String, Dynamic>, item_args: lua.Table<String, Dynamic>, filter: func);
/**
 * Default awful.menu.entry constructor.
 * @see lib/awful/menu.lua:586
 * @param parent Dynamic  The parent menu (TODO: This is apparently unused)
 * @param args Dynamic  the item params
 */
static function entry(parent: Dynamic, args: Dynamic);
/**
 * Create a menu popup.
 * @see lib/awful/menu.lua:709
 * @param args Dynamic  Table containing the menu information.

 * Key items: Table containing the displayed items. Each element is a table by default (when element 'new' is
   awful.menu.entry) containing: item name, triggered action (submenu table or function), item icon (optional).
 * Keys theme.[fg|bg]_[focus|normal], theme.border_color, theme.border_width, theme.submenu_icon, theme.height
   and theme.width override the default display for your menu and/or of your menu entry, each of them are optional.
 * Key auto_expand controls the submenu auto expand behaviour by setting it to true (default) or false.

 * @param parent Dynamic  Specify the parent menu if we want to open a submenu, this value should never be set by the user.
 */
static function menu(args: Dynamic, parent: Dynamic);
/**
 * Show a menu.
 * @see lib/awful/menu.lua:363
 * @param args Dynamic  The arguments
 */
function show(args: Dynamic);
/**
 * Hide a menu popup.
 * @see lib/awful/menu.lua:377
 */
function hide();
/**
 * Toggle menu visibility.
 * @see lib/awful/menu.lua:396
 * @param args Dynamic  The arguments
 */
function toggle(args: Dynamic);
/**
 * Update menu content.
 * @see lib/awful/menu.lua:406
 */
function update();
/**
 * Get the elder parent so for example when you kill it, it will destroy the whole family.
 * @see lib/awful/menu.lua:416
 */
function get_root();
/**
 * Add a new menu entry.
 * @see lib/awful/menu.lua:427
 * @param args Dynamic  The item params
 * @param index Dynamic  The index where the new entry will inserted.
 */
function add(args: Dynamic, index: Dynamic);
/**
 * Delete menu entry at given position.
 * @see lib/awful/menu.lua:484
 * @param num Dynamic  The position in the table of the menu entry to be deleted; can be also the menu entry itself.
 */
function delete(num: Dynamic);
}
