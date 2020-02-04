local gears = require("gears")
local timer = require("gears.timer")
local awful = require("awful")
local client = awful.client
local spawn = awful.spawn
local mouse = require("awful.mouse")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local vicious = require("vicious")
local net_widgets = require("net_widgets")
local helpers = require("helpers")
local mod = { }
mod.run_nmtui = function()
  return spawn.with_shell("urxvt256c-ml -e nmtui")
end
mod.bat_tooltip_fun = function()
  local state, percent, time, wear, curpower = unpack(vicious.widgets.bat("$1", "BAT0"))
  return "State:      " .. tostring(i(state)) .. "\nPercent:    " .. tostring(percent) .. "\nRemaining:  " .. tostring(time)
end
mod.dbg = function(...)
  return helpers.dbg(...)
end
mod.wup = function()
  return mouse.object.get_current_widget()
end
mod.show_widget_under_pointer = function()
  return naughty.notify({
    text = tostring(mouse.object.get_current_widget() or "<none>") .. "\n",
    title = "Widget Under Pointer\n"
  })
end
mod.mypop = nil
mod.pop = function()
  local widget = wibox.widget.imagebox("/home/cji/Downloads/Nightingale.png")
  mod.mypop = awful.popup({
    widget = wibox.container.constraint(widget, "max", 400, 400),
    border_color = '#777777',
    border_width = 2,
    ontop = true,
    placement = awful.placement.centered,
    shape = gears.shape.rounded_rect
  })
  return mod.mypop
end
mod.start = function()
  local t = timer({
    timeout = 20,
    autostart = true,
    call_now = false,
    callback = function()
      mod.mypop.visible = false
      mod.mypop = nil
    end
  })
  t:start()
  return t
end
mod.find_topbar_widget = function(wb, wdg)
  if wb == nil then
    wb = screen[1].mywibox
  end
  local traverse
  traverse = function(hi)
    if hi:get_widget() == wdg then
      return hi
    end
    for n, child in ipairs(hi:get_children()) do
      log("child " .. tostring(n))
      do
        local r = traverse(child)
        if r then
          return r
        end
      end
    end
    return nil
  end
  local res = traverse(wb._drawable._widget_hierarchy)
  local x, y, w, h = gears.matrix.transform_rectangle(res:get_matrix_to_device(), 0, 0, res:get_size())
  return x, y, w, h
end
return mod
