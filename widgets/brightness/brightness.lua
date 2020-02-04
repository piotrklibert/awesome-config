local min, max, modf
do
  local _obj_0 = math
  min, max, modf = _obj_0.min, _obj_0.max, _obj_0.modf
end
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local spawn = require("awful.spawn")
local naughty = require("naughty")
local Promise = require("promise")
local mo = require("moses")
local str = require("std.string")
local ml = require("ml")
local FONT = "mono 14"
local PATH_TO_ICON = "/home/cji/.config/awesome/widgets/brightness/br-wid-1.png"
local PATH = "/sys/class/backlight/intel_backlight/brightness"
local state = {
  widget = nil,
  in_progress = nil,
  brightness = nil,
  set_brightness = function(self, brightness)
    self.brightness = brightness
  end,
  setter_promise = nil,
  setting_start = function(self)
    self.in_progress = true
  end,
  setting_end = function(self)
    self.in_progress = false
  end
}
local pspawn
pspawn = function(cmd)
  local p = Promise.new()
  state.setter_promise = p
  spawn.easy_async(cmd, function(_out, _err, _, _ret)
    p:resolve()
    state.in_progress = false
  end)
  return p
end
local get_brightness
get_brightness = function()
  local brightness_level = str.trim(io.open(PATH, "r"):read("*all"))
  return modf(tonumber(brightness_level) / 19200 * 100)
end
local set_brightness
set_brightness = function(percent)
  local bval, _ = modf(tonumber(percent) / 100 * 19200)
  local cmd = "sudo bash -c 'echo " .. tostring(bval) .. " >" .. tostring(PATH) .. "'"
  state:setting_start()
  local end_fun
  end_fun = function()
    return state:setting_end()
  end
  return pspawn(cmd)
end
local worker
worker = function()
  local brightness_text = wibox.widget.textbox()
  brightness_text:set_font(font)
  local brightness_icon = wibox.widget({
    {
      image = PATH_TO_ICON,
      resize = false,
      widget = wibox.widget.imagebox,
      forced_width = 25
    },
    top = 5,
    widget = wibox.container.margin
  })
  state.widget = wibox.widget({
    brightness_icon,
    layout = wibox.layout.fixed.horizontal
  })
  local update_widget
  update_widget = function()
    return brightness_text:set_text(" " .. get_brightness() .. "%")
  end
  local handle_mouse
  handle_mouse = function(_, _, _, button)
    if state.in_progress then
      state.setter_promise:next(function()
        update_widget()
        return handle_mouse(_, _, _, button)
      end)
      return 
    end
    local percent = get_brightness()
    local promise
    local _exp_0 = button
    if 4 == _exp_0 then
      brightness_text:set_text(" " .. (percent + 5) .. "%")
      promise = set_brightness(min(percent + 5, 100))
    elseif 5 == _exp_0 then
      brightness_text:set_text(" " .. (percent - 5) .. "%")
      promise = set_brightness(max(percent - 5, 0))
    else
      return 
    end
    return promise:next(function()
      state.brightness = get_brightness()
      state.in_progress = false
    end)
  end
  state.widget:connect_signal("button::press", handle_mouse)
  gears.timer({
    timeout = 1,
    call_now = true,
    autostart = true,
    callback = update_widget
  })
  return state.widget
end
return worker
