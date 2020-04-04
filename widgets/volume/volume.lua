local i = require("inspect")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local spawn = require("awful.spawn")
local naughty = require("naughty")
local beautiful = require("beautiful")
local notify = require("naughty.notification")
local gears = require("gears")
local gfs = require("gears.filesystem")
local dpi = require("beautiful").xresources.apply_dpi
local ml = require("ml")
local str = require("std.string")
local mo = require("moses")
local make_notification_widget
make_notification_widget = require("util").make_notification_widget
local volume_to_icons = {
  {
    0,
    "audio-volume-muted-symbolic-red"
  },
  {
    25,
    "audio-volume-muted-symbolic"
  },
  {
    50,
    "audio-volume-low-symbolic"
  },
  {
    75,
    "audio-volume-medium-symbolic"
  },
  {
    100,
    "audio-volume-high-symbolic"
  }
}
local path_to_icons = "/home/cji/.config/awesome/icons"
local choose_icon
choose_icon = function(vol)
  if not vol or vol <= 0 then
    return tostring(path_to_icons) .. "/audio-volume-muted-symbolic-red.svg"
  end
  local icon_name = nil
  for _index_0 = 1, #volume_to_icons do
    local _des_0 = volume_to_icons[_index_0]
    local k, v
    k, v = _des_0[1], _des_0[2]
    if vol and (tonumber(vol) <= tonumber(k)) then
      icon_name = v
      break
    end
  end
  if icon_name then
    return tostring(path_to_icons) .. "/" .. tostring(icon_name) .. ".svg"
  else
    return error("Can't find icon for vol " .. tostring(vol))
  end
end
local pamixer = "/usr/local/bin/pamixer"
local GET_VOLUME_CMD = {
  pamixer,
  "--get-volume",
  "--get-mute"
}
local INC_VOLUME_CMD = {
  pamixer,
  "-i",
  "5"
}
local DEC_VOLUME_CMD = {
  pamixer,
  "-d",
  "5"
}
local TOGGLE_MUTE_CMD = {
  pamixer,
  "-t"
}
local cmd_for_button
cmd_for_button = function(btn)
  local _exp_0 = tonumber(btn)
  if 4 == _exp_0 then
    return INC_VOLUME_CMD
  elseif 5 == _exp_0 then
    return DEC_VOLUME_CMD
  elseif 1 == _exp_0 then
    return TOGGLE_MUTE_CMD
  end
end
local make_notification_spec
make_notification_spec = function(attrs)
  local template = {
    icon_size = dpi(22),
    title = "Volume",
    position = "top_right",
    timeout = 0,
    hover_timeout = 0.5,
    width = 200
  }
  return gears.table.join({ }, template, attrs)
end
local state = {
  volume = 100,
  is_muted = false,
  icon = choose_icon(100),
  notification_widget = nil,
  volume_widget = wibox.widget({
    {
      id = "icon",
      resize = true,
      image = choose_icon(100),
      widget = wibox.widget.imagebox
    },
    layout = wibox.container.margin(_, 1, 1, 5, 5)
  }),
  popup_create = function(self)
    local txt = tostring(self.volume) .. "%"
    if self.is_muted then
      txt = "muted"
    end
    self.notification_widget = make_notification_widget(txt, {
      x = 1500,
      y = 32,
      height = 45,
      width = 90
    })
  end,
  popup_destroy = function(self)
    self.notification_widget.visible = false
    self.notification_widget = nil
  end,
  set_volume = function(self, stdout)
    local muted, vol
    do
      local _obj_0 = ml.split(str.trim(stdout), " ")
      muted, vol = _obj_0[1], _obj_0[2]
    end
    self.is_muted = muted == "true"
    self.volume = tonumber(vol)
    self.icon = choose_icon((function()
      if not self.is_muted then
        return self.volume
      else
        return nil
      end
    end)())
  end,
  update_widgets = function(self)
    self.volume_widget.icon.image = self.icon
    if self.notification_widget then
      local txt = tostring(self.volume) .. "%"
      if self.is_muted then
        txt = "muted"
      end
      self.notification_widget:get_children_by_id("text")[1].text = txt
    end
  end,
  handle_mouse = function(self, _, _, _, button)
    do
      spawn.easy_async(cmd_for_button(button), function(_)
        do
          spawn.easy_async(GET_VOLUME_CMD, function(out)
            self:set_volume(out)
            return self:update_widgets()
          end)
        end
      end)
    end
  end,
  init = function(self)
    local this = self
    self.volume_widget:connect_signal("button::press", (function()
      local _base_0 = this
      local _fn_0 = _base_0.handle_mouse
      return function(...)
        return _fn_0(_base_0, ...)
      end
    end)())
    self.volume_widget:connect_signal("mouse::enter", (function()
      local _base_0 = this
      local _fn_0 = _base_0.popup_create
      return function(...)
        return _fn_0(_base_0, ...)
      end
    end)())
    return self.volume_widget:connect_signal("mouse::leave", (function()
      local _base_0 = this
      local _fn_0 = _base_0.popup_destroy
      return function(...)
        return _fn_0(_base_0, ...)
      end
    end)())
  end
}
local check_icons_path
check_icons_path = function()
  if not gfs.dir_readable(path_to_icons) then
    return naughty.notify({
      title = "Volume Widget",
      text = "Folder with icons doesn't exist: " .. tostring(path_to_icons),
      preset = naughty.config.presets.critical
    })
  end
end
_G["vstate"] = state
local make_volume_widget
make_volume_widget = function()
  check_icons_path()
  state:init()
  watch(GET_VOLUME_CMD, 1, function(_widget, out)
    state:set_volume(out)
    return state:update_widgets()
  end)
  return state.volume_widget
end
_G["state"] = state
return make_volume_widget
