package externs;


@:luaRequire("selection")
extern class Selection {
/** awesome selection (clipboard) API
 * selection.c:29
 */
/**
 * Get the selection (clipboard) content.
 * @see selection.c:37
 */
static function selection();
}
