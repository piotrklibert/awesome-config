-------------------------------------------------
-- Brightness Widget for Awesome Window Manager
-- Shows the brightness level of the laptop display
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/brightness-widget

-- @author Pavel Makhov
-- @copyright 2017-2019 Pavel Makhov
-------------------------------------------------
import min, max, modf from math
wibox = require("wibox")
watch = require("awful.widget.watch")
spawn = require("awful.spawn")
naughty = require "naughty"

Promise = require "promise"

mo = require "moses"
str = require "std.string"
ml = require "ml"

FONT = "mono 14"
PATH_TO_ICON = "/home/cji/.config/awesome/widgets/brightness/br-wid-1.png"

PATH = "/sys/class/backlight/intel_backlight/brightness"


state = {
  widget: nil
  in_progress: nil
  brightness: nil
  set_brightness: (@brightness) =>
  setter_promise: nil
  setting_start: () =>
    -- naughty.notify({text: "1"})
    @in_progress = true
  setting_end: () =>
    -- naughty.notify({text: "0"})
    @in_progress = false
}


pspawn = (cmd) ->
  p = Promise.new()
  state.setter_promise = p
  spawn.easy_async cmd, (_out, _err, _, _ret) ->
    -- naughty.notify {text: "resolved"}
    p\resolve()
    state.in_progress = false
  p


get_brightness = () ->
  brightness_level = str.trim(io.open(PATH, "r")\read("*all"))
  modf(tonumber(brightness_level) / 19200 * 100)


set_brightness = (percent) ->
  bval, _ = modf(tonumber(percent) / 100 * 19200)
  cmd = "sudo bash -c 'echo #{bval} >#{PATH}'"
  -- naughty.notify {text: "#{cmd}"}
  state\setting_start!
  end_fun = () -> state\setting_end()
  pspawn(cmd)--\next(end_fun)\catch(end_fun)


worker = () ->
    brightness_text = wibox.widget.textbox()
    brightness_text\set_font(font)

    brightness_icon = wibox.widget {
        {
            image: PATH_TO_ICON,
            resize: false,
            widget: wibox.widget.imagebox,
            forced_width: 25
        },
        top: 5,
        widget: wibox.container.margin
    }

    state.widget = wibox.widget {
      brightness_icon,
      brightness_text,
      layout: wibox.layout.fixed.horizontal,
    }

    update_widget = () ->
      -- state.in_progress = false
      brightness_text\set_text(" " .. get_brightness! .. "%")

    handle_mouse = (_, _, _, button) ->
      if state.in_progress
        state.setter_promise\next(() ->
          update_widget!
          handle_mouse(_, _, _, button))
        return
      percent = get_brightness!
      promise = switch button
        when 4
          brightness_text\set_text(" " .. (percent + 5) .. "%")
          set_brightness min(percent + 5, 100)
        when 5
          brightness_text\set_text(" " .. (percent - 5) .. "%")
          set_brightness max(percent - 5, 0)
        else
          return
      promise\next(() ->
        state.brightness = get_brightness!
        state.in_progress = false
      )
    state.widget\connect_signal "button::press", handle_mouse

    gears.timer {timeout: 1, call_now: true, autostart: true, callback: update_widget}

    return state.widget



worker
