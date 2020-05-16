package awful;
import lua.Table;


typedef NaughtyOptions = {
  var ?actions: AnyTable;     // Mapping that maps a: String = to a callback when this action is selected. (optional)
  var ?bg: String;            // `beautiful.notification_fg` or `beautiful.bg_focus` or `'#535d6c'` Background color. (default)
  var ?border_color: String;  // `beautiful.notification_border_color` or `beautiful.border_focus` or `'#535d6c'` Border color. (default)
  var ?border_width: Int;     // `beautiful.notification_border_width` or 1 Border width. (default)
  var ?callback: Dynamic;     // Function that will be called with all arguments. The notification will only be displayed if the function returns true. Note: this = function is only relevant to notifications sent via dbus. (optional)
  var ?destroy: Dynamic;      // Function to run when notification is destroyed. (optional)
  var ?fg: String;            // `beautiful.notification_fg` or `beautiful.fg_focus` or `'#ffffff'` Foreground color. (default)
  var ?font: String;          // `beautiful.notification_font` or `beautiful.font` or `awesome.font` Notification font. (default)
  var ?height: Int;           // `beautiful.notification_height` or auto Popup height. (default)
  var ?hover_timeout: Float;    // Delay in seconds after which hovered popup disappears. (optional)
  var ?icon: String;          // Path to icon. (optional)
  var ?icon_size: Int;        // Desired icon size in px. (optional)
  var ?ignore_suspend: Bool;  // false If set to true this notification will be shown even if notifications are suspended via naughty.suspend. (default)
  var ?margin: Dynamic;       // `beautiful.notification_margin` gears.margin Widget margin. (default)
  var ?max_height: Int;       // `beautiful.notification_max_height` or auto Popup maximum height. (default)
  var ?max_width: Int;        // `beautiful.notification_max_width` or auto Popup maximum width. (default)
  var ?ontop: Bool;           // true Boolean forcing popups to display on top. (default)
  var ?opacity: Dynamic;      // `beautiful.notification_opacity` gears.opacity Widget opacity. (default)
  var ?position: String;      // "top_right" Corner of the workarea displaying the popups. Values: "top_right =", "top_left", "bottom_left", "bottom_right", "top_middle", "bottom_middle". (default)
  var ?preset: AnyTable;      // Table with any of the above parameters. Note: Any  parameters specified directly in args will override ones defined in the preset. (optional)
  var ?replaces_id: Int;      // Replace the notification with the given ID. (optional)
  var ?run: Dynamic;          // func Function to run on left click. The notification object will be passed to it as an argument. You need to call e.g. notification.die(naughty.notificationClosedReason.dismissedByUser) from there to dismiss the notification yourself. (optional)
  var ?screen: Int;           // or screen Target screen for the notification. (default focused)
  var ?shape: Dynamic;        // `beautiful.notification_shape` gears.shape Widget shape. (default)
  var ?text: String;          // "" Text of the notification. (default)
  var ?timeout: Int;          // 5 Time in seconds after which popup expires. Set 0 for no timeout. (default)
  var ?title: String;         // Title of the notification. (optional)
  var ?width: Int;            // `beautiful.notification_width` or auto Popup width. (default)
}


@:luaRequire("naughty")
extern class Naughty {
  static function is_suspended(): Bool;
  static function suspend(): Void;
  static function resume(): Void;
  static function toggle(): Void;
  static function destroy(notification: AnyTable, reason: String, ?keep_visible: Bool): Bool;
  static function destroy_all_notifications(screens: Dynamic, reason: String): Bool;
  static function getById(id: Int): AnyTable;
  static function get_next_notification_id(): Int;
  static function reset_timeout(notification: AnyTable, new_timeout: Int): Void;
  static function replace_text(notification: AnyTable, new_title: String, new_text: String): Void;

  @:overload(function (o: AnyTable): AnyTable {})
  static function notify(args: NaughtyOptions): AnyTable;

  static var notifications: Array<Dynamic>;
}


// beautiful.notification_font
// beautiful.notification_bg
// beautiful.notification_fg
// beautiful.notification_border_width
// beautiful.notification_border_color
// beautiful.notification_shape
// beautiful.notification_opacity
// beautiful.notification_margin
// beautiful.notification_width
// beautiful.notification_height
// beautiful.notification_max_width
// beautiful.notification_max_height
// beautiful.notification_icon_size
