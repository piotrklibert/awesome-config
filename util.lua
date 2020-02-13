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
local run_nmtui
run_nmtui = function()
  return spawn.with_shell("urxvt256c-ml -e nmtui")
end
local bat_tooltip_fun
bat_tooltip_fun = function()
  local state, percent, time, wear, curpower = unpack(vicious.widgets.bat("$1", "BAT0"))
  return "State:      " .. tostring(i(state)) .. "\nPercent:    " .. tostring(percent) .. "\nRemaining:  " .. tostring(time)
end
local dbg
dbg = function(...)
  return helpers.dbg(...)
end
local wup
wup = function()
  return mouse.object.get_current_widget()
end
local show_widget_under_pointer
show_widget_under_pointer = function()
  return naughty.notify({
    text = tostring(mouse.object.get_current_widget() or "<none>") .. "\n",
    title = "Widget Under Pointer\n"
  })
end
local mypop = nil
local pop
pop = function()
  local widget = wibox.widget.imagebox("/home/cji/Downloads/Nightingale.png")
  mypop = awful.popup({
    widget = wibox.container.constraint(widget, "max", 400, 400),
    border_color = '#777777',
    border_width = 2,
    ontop = true,
    placement = awful.placement.centered,
    shape = gears.shape.rounded_rect
  })
  return mypop
end
local start
start = function()
  local t = timer({
    timeout = 20,
    autostart = true,
    call_now = false,
    callback = function()
      mypop.visible = false
      mypop = nil
    end
  })
  t:start()
  return t
end
local gtimer
gtimer = function(t, callback, opts)
  local args = merge({
    timeout = t,
    callback = callback,
    call_now = true,
    autostart = true
  }, opts or { })
  return require("gears.timer")(args)
end
local find_topbar_widget
find_topbar_widget = function(wb, wdg)
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
local filter_in
filter_in = function(set, trans)
  if trans == nil then
    trans = ident
  end
  return function(t)
    local tn = trans(t)
    for _index_0 = 1, #set do
      local n = set[_index_0]
      if tostring(tn) == tostring(n) then
        return true
      end
    end
    return false
  end
end
return {
  run_nmtui = run_nmtui,
  dbg = dbg,
  bat_tooltip_fun = bat_tooltip_fun,
  wup = wup,
  show_widget_under_pointer = show_widget_under_pointer,
  mypop = mypop,
  pop = pop,
  start = start,
  gtimer = gtimer,
  find_topbar_widget = find_topbar_widget,
  filter_in = filter_in
}
