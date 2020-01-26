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


mod = {}

mod.run_nmtui = ->
  spawn.with_shell("urxvt256c-ml -e nmtui")



mod.bat_tooltip_fun = ->
  state, percent, time, wear, curpower = unpack(vicious.widgets.bat("$1", "BAT0"))
  "State:      #{_i(state)}
Percent:    #{percent}
Remaining:  #{time}"


mod.dbg = (...) -> helpers.dbg(...)

mod.wup = -> mouse.object.get_current_widget!

mod.show_widget_under_pointer = ->
  naughty.notify {
    text: tostring(mouse.object.get_current_widget! or "<none>") .. "\n",
    title: "Widget Under Pointer\n"
  }


mod.mypop = nil

mod.pop = ->
  -- widget = wibox.widget.textbox()
  -- widget\set_text("dafdsfsfd")
  widget = wibox.widget.imagebox("/home/cji/Downloads/Nightingale.png")
  -- widget = {}

  mod.mypop = awful.popup {
      widget: wibox.container.constraint(widget, "max", 400, 400),
      border_color: '#777777',
      border_width: 2,
      ontop: true,
      placement: awful.placement.centered,
      shape: gears.shape.rounded_rect
  }

  mod.mypop

mod.start = ->
  t = timer {
    timeout: 20
    autostart: true
    call_now: false
    callback: ->
      mod.mypop.visible = false
      mod.mypop = nil
  }
  t\start!
  t
  -- ->
  -- memwidget.visible = false
  -- memwidget = nil

mod
