gears = require "gears"
timer = require "gears.timer"
awful = require "awful"
client = awful.client
spawn = awful.spawn
mouse = require "awful.mouse"

wibox     = require "wibox"     -- Widget and layout library
beautiful = require "beautiful" -- Theme handling library
naughty   = require "naughty"   -- Notification library

---

vicious = require "vicious"
net_widgets = require "net_widgets"

---

helpers = require "helpers"



run_nmtui = ->
  spawn.with_shell("urxvt256c-ml -e nmtui")


bat_tooltip_fun = ->
  state, percent, time, wear, curpower = unpack(vicious.widgets.bat("$1", "BAT0"))
  "State:      #{i(state)}
Percent:    #{percent}
Remaining:  #{time}"


dbg = (...) -> helpers.dbg(...)

wup = -> mouse.object.get_current_widget!


show_widget_under_pointer = ->
  naughty.notify {
    text: tostring(mouse.object.get_current_widget! or "<none>") .. "\n",
    title: "Widget Under Pointer\n"
  }


mypop = nil

pop = ->
  -- widget = wibox.widget.textbox()
  -- widget\set_text("dafdsfsfd")
  widget = wibox.widget.imagebox("/home/cji/Downloads/Nightingale.png")
  -- widget = {}

  mypop = awful.popup {
      widget: wibox.container.constraint(widget, "max", 400, 400),
      border_color: '#777777',
      border_width: 2,
      ontop: true,
      placement: awful.placement.centered,
      shape: gears.shape.rounded_rect
  }

  mypop

start = ->
  t = timer {
    timeout: 20
    autostart: true
    call_now: false
    callback: ->
      mypop.visible = false
      mypop = nil
  }
  t\start!
  t
  -- ->
  -- memwidget.visible = false
  -- memwidget = nil


gtimer = (t, callback, opts) ->
  args = merge {
    timeout: t, callback: callback
    call_now: true, autostart: true,
  }, opts or {}
  require("gears.timer")(args)



-- find_topbar_widget(vstate.volume_widget)
find_topbar_widget = (wb = screen[1].mywibox, wdg) ->
  traverse = (hi) ->
    if hi\get_widget() == wdg
      return hi

    for n, child in ipairs(hi\get_children()) do
      log "child #{n}"
      if r = traverse(child)
        return r
    return nil

  res = traverse(wb._drawable._widget_hierarchy)
  x, y, w, h = gears.matrix.transform_rectangle(res\get_matrix_to_device(), 0, 0, res\get_size())
  x, y, w, h


filter_in = (set, trans = ident) ->
  (t) ->
    tn = trans(t)
    for n in *set
      if tostring(tn) == tostring(n)
        return true
    return false


wibox = require "wibox"
placement = require("awful.placement")
-- x = (require("naughty.widget._default"))

notif_margins = () ->
    margins = wibox.container.margin()
    margins\set_margins(beautiful.notification_margin or 4)

    rawset(margins, "set_notification", () ->
        if notif.margin
            margins\set_margins(notif.margin))
    margins



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

_G["fff"] = make_notification_widget


{
  :make_notification_widget,
  :run_nmtui,
  :dbg,
  :bat_tooltip_fun,
  :wup,
  :show_widget_under_pointer,
  :mypop,
  :pop,
  :start,
  :gtimer,
  :find_topbar_widget,
  :filter_in
}
