i = require"inspect"
wibox = require("wibox")
watch = require("awful.widget.watch")
spawn = require("awful.spawn")
naughty = require("naughty")
beautiful = require("beautiful")
notify = require("naughty.notification")
gears = require("gears")


gfs = require("gears.filesystem")
dpi = require("beautiful").xresources.apply_dpi
ml = require "ml"
str = require "std.string"
mo = require "moses"



wibox = require "wibox"
placement = require("awful.placement")
x = (require("naughty.widget._default"))

notif_margins = () ->
    margins = wibox.container.margin()
    margins\set_margins(beautiful.notification_margin or 4)

    rawset(margins, "set_notification", () ->
        if notif.margin
            margins\set_margins(notif.margin))
    margins



make_notification_widget = (txt) ->
  wb = wibox {ontop: true}
  wb.x = 1450
  wb.y = 32
  wb.height = 45
  wb.width = 120
  wb\setup {
    {
      {
        id: "text",
        text: txt
        widget: wibox.widget.textbox,
      },
      left: 10
      top: 5
      bottom: 5
      widget: wibox.container.margin
    }
    border_color: "#4B6063"
    border_width: 1
    border_strategy: "inner"
    widget: wibox.container.background
  }
  -- placement.next_to(wb, {preferred_positions: "bottom", preferred_anchors: "middle", geometry: capi.screen[1].geometry})
  wb.visible = true
  wb

_G["fff"] = make_notification_widget


volume_to_icons = {
  {0, "audio-volume-muted-symbolic-red"}
  {25, "audio-volume-muted-symbolic"},
  {50, "audio-volume-low-symbolic"},
  {75, "audio-volume-medium-symbolic"},
  {100, "audio-volume-high-symbolic"},
}
path_to_icons = "/home/cji/.config/awesome/icons"
choose_icon = (vol) ->
  if not vol or vol <= 0
    return "#{path_to_icons}/audio-volume-muted-symbolic-red.svg"
  icon_name = nil
  for {k, v} in *volume_to_icons
    if vol and (tonumber(vol) <= tonumber(k))
      icon_name = v
      break
  if icon_name
    "#{path_to_icons}/#{icon_name}.svg"
  else
    error("Can't find icon for vol #{vol}")


pamixer = "/usr/local/bin/pamixer"
GET_VOLUME_CMD  = {pamixer, "--get-volume", "--get-mute"}
INC_VOLUME_CMD  = {pamixer, "-i", "5"}
DEC_VOLUME_CMD  = {pamixer, "-d", "5"}
TOGGLE_MUTE_CMD = {pamixer, "-t"}
cmd_for_button = (btn) ->
  switch tonumber(btn)
    when 4 then INC_VOLUME_CMD
    when 5 then DEC_VOLUME_CMD
    when 1 then TOGGLE_MUTE_CMD



make_notification_spec = (attrs) ->
  template = {
    icon_size: dpi(22),
    title: "Volume",
    position: "top_right",
    timeout: 0,
    hover_timeout: 0.5,
    width: 200,
  }
  gears.table.join({}, template, attrs)



state = {
  volume: 100
  is_muted: false
  icon: choose_icon(100)
  notification_widget: nil
  volume_widget: wibox.widget {
      {
          id: "icon", resize: true,
          image: choose_icon(100),
          widget: wibox.widget.imagebox,
      },
      layout: wibox.container.margin(_, 1, 1, 5, 5),
  }

  popup_create: =>
    txt = "#{@volume}%"
    if @is_muted
      txt = "muted"
    @notification_widget = make_notification_widget txt


  popup_destroy: =>
    @notification_widget.visible = false
    @notification_widget = nil


  set_volume: (stdout) =>
    {muted, vol} = ml.split(str.trim(stdout), " ")
    @is_muted = muted == "true"
    @volume   = tonumber(vol)
    @icon     = choose_icon(if not @is_muted then @volume else nil)


  update_widgets: =>
    @volume_widget.icon.image = @icon
    if @notification_widget
      txt = "#{@volume}%"
      if @is_muted
        txt = "muted"

      @notification_widget\get_children_by_id("text")[1].text = txt

  handle_mouse: (_, _, _, button) =>
    if button == 3
      spawn("pavucontrol", {floating: true})
      return
    _   <- spawn.easy_async(cmd_for_button(button))
    out <- spawn.easy_async(GET_VOLUME_CMD)
    @set_volume(out)
    @update_widgets!

  init: =>
    this = @
    @volume_widget\connect_signal("button::press", this\handle_mouse)
    @volume_widget\connect_signal("mouse::enter",  this\popup_create)
    @volume_widget\connect_signal("mouse::leave",  this\popup_destroy)
}


check_icons_path = () ->
  if not gfs.dir_readable(path_to_icons)
    naughty.notify {
      title: "Volume Widget",
      text: "Folder with icons doesn't exist: #{path_to_icons}",
      preset: naughty.config.presets.critical
    }

_G["vstate"] = state
make_volume_widget = () ->
  check_icons_path!

  state\init!

  watch GET_VOLUME_CMD, 1, (_widget, out) ->
    state\set_volume(out)
    state\update_widgets!

  state.volume_widget

_G["state"] = state

return make_volume_widget
