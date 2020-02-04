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

-- _G["find_widget"]find_topbar_widget

filter_in = (set) ->
  (t) ->
    tn = t.name
    for n in *set
      if tn == tostring(n)
        return true
    return false




{
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
