package externs.wibox.container;


@:luaRequire("wibox.container.tile")
extern class Tile extends externs.wibox.container.Place {
/** Replicate the content of the widget over and over.
 * lib/wibox/container/tile.lua:15
 */
/**
 * The horizontal spacing between the tiled.
 * @see lib/wibox/container/tile.lua:120
 */
var horizontal_spacing: Int;
/**
 * The vertical spacing between the tiled.
 * @see lib/wibox/container/tile.lua:147
 */
var vertical_spacing: Int;
/**
 * Avoid painting incomplete horizontal tiles.
 * @see lib/wibox/container/tile.lua:175
 */
var horizontal_crop: Bool;
/**
 * Avoid painting incomplete vertical tiles.
 * @see lib/wibox/container/tile.lua:203
 */
var vertical_crop: Bool;
/**
 * Enable or disable the tiling.
 * @see lib/wibox/container/tile.lua:229
 */
var tiled: Bool;
/**
 * Create a new tile container.
 * @see lib/wibox/container/tile.lua:301
 * @param args lua.Table<String, Dynamic> 
 * @param widget wibox.widget  args.widget The widget to tile.
 */
@:selfCall function new(args: lua.Table<String, Dynamic>, widget: wibox.widget);
}
