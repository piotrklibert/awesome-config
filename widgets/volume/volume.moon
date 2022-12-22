i = require"inspect"
wibox = require("wibox")
watch = require("awful.widget.watch")
spawn = require("awful.spawn")
naughty = require("naughty")
beautiful = require("beautiful")
gears = require("gears")


gfs = require("gears.filesystem")
dpi = require("beautiful").xresources.apply_dpi
ml = require "ml"
str = require "std.string"
mo = require "moses"


make_notification_widget = (txt, geom, wbox_args, txt_args) ->
  args = {ontop: true, opacity: 0.7}
  if is_table(wbox_args)
    merge args, wbox_args
  wb = wibox(args)

  g = if is_table(geom)
    geom
  else
    {x: 1530, y: 32, height: 45, width: 90}

  for attr, value in pairs(g)
    wb[ attr ] = value

  txt = {
    id: "text",
    text: txt
    widget: wibox.widget.textbox,
  }

  if is_table(txt_args)
    merge txt, txt_args

  wb\setup {
    {
      txt,
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

  wb.visible = true
  wb





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

  popup_create: =>
    txt = "#{@volume}%"
    if @is_muted
      txt = "muted"
    @notification_widget = make_notification_widget txt, {x: 1500, y: 32, height: 45, width: 90}


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

    @volume_widget = wibox.widget {
      {
        id: "icon", resize: true,
        image: choose_icon(100),
        widget: wibox.widget.imagebox,
      },
      layout: wibox.container.margin(_, 1, 1, 5, 5),
    }
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
