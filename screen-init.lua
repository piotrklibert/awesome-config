local net_widgets = require("net_widgets")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local h = require("helpers")
local u = require("util")
local taglist_buttons = awful.util.table.join(awful.button({ }, 1, awful.tag.viewonly), awful.button({
  modkey
}, 1, awful.client.movetotag), awful.button({ }, 2, awful.tag.viewtoggle), awful.button({
  modkey
}, 2, awful.client.toggletag), awful.button({ }, 3, function(t)
  return customization.func.tag_action_menu(t)
end), awful.button({
  modkey
}, 3, awful.tag.delete), awful.button({ }, 4, function(t)
  return awful.tag.viewprev(awful.tag.getscreen(t))
end), awful.button({ }, 5, function(t)
  return awful.tag.viewnext(awful.tag.getscreen(t))
end))
local make_layoutbox
make_layoutbox = function(screen)
  local lb = awful.widget.layoutbox(screen)
  local buttons = {
    awful.button({ }, 1, function()
      return awful.layout.inc(1)
    end),
    awful.button({ }, 3, function()
      return awful.layout.inc(-1)
    end),
    awful.button({ }, 4, function()
      return awful.layout.inc(1)
    end),
    awful.button({ }, 5, function()
      return awful.layout.inc(-1)
    end)
  }
  lb:buttons(gears.table.join(unpack(buttons)))
  return lb
end
local make_sep
make_sep = function(t)
  if t == nil then
    t = 1
  end
  return {
    forced_width = 5,
    forced_height = 24,
    thickness = t,
    color = "#777777",
    widget = wibox.widget.separator
  }
end
local make_tasklist
make_tasklist = function(screen, buttons)
  local highlight_bar_widget = {
    wibox.widget.base.make_widget(),
    forced_height = 5,
    id = "background_role",
    widget = wibox.container.background
  }
  return awful.widget.tasklist({
    screen = screen,
    buttons = buttons,
    filter = awful.widget.tasklist.filter.currenttags,
    layout = {
      spacing_widget = {
        make_sep(),
        valign = "center",
        halign = "center",
        widget = wibox.container.place
      },
      spacing = 35,
      layout = wibox.layout.fixed.horizontal
    },
    widget_template = {
      highlight_bar_widget,
      {
        {
          {
            id = "clienticon",
            widget = awful.widget.clienticon
          },
          margins = 5,
          widget = wibox.container.margin
        },
        {
          id = "title",
          widget = wibox.widget.textbox
        },
        layout = wibox.layout.align.horizontal
      },
      nil,
      create_callback = function(self, c, index, objects)
        self:get_children_by_id("clienticon")[1].client = c
        self:get_children_by_id("title")[1].text = tostring(c.name:sub(1, 40))
      end,
      update_callback = function(self, c, index, objects)
        self:get_children_by_id("clienticon")[1].client = c
        self:get_children_by_id("title")[1].text = tostring(c.name:sub(1, 40))
      end,
      layout = wibox.layout.align.vertical
    }
  })
end
local get_top
get_top = function()
  local f = io.popen("top -b -n1 -w 140")
  return table.concat((function()
    local _accum_0 = { }
    local _len_0 = 1
    for line in f:lines() do
      _accum_0[_len_0] = line
      _len_0 = _len_0 + 1
    end
    return _accum_0
  end)(), "\n")
end
local get_top_mem
get_top_mem = function()
  local f = io.popen("top -b -n1 -w 140 -o RES")
  return table.concat((function()
    local _accum_0 = { }
    local _len_0 = 1
    for line in f:lines() do
      _accum_0[_len_0] = line
      _len_0 = _len_0 + 1
    end
    return _accum_0
  end)(), "\n")
end
local make_mem_widget
make_mem_widget = function()
  local widget = wibox.widget.textbox()
  vicious.register(widget, vicious.widgets.mem, "MEM: $1%")
  local notification = nil
  widget:connect_signal("mouse::enter", function()
    notification = naughty.notify({
      text = get_top_mem(),
      timeout = 0,
      font = "monospace 12",
      screen = mouse.screen,
      position = naughty.config.defaults.position,
      max_width = 1800
    })
  end)
  widget:connect_signal("mouse::leave", function()
    if notification ~= nil then
      naughty.destroy(notification)
      notification = nil
    end
  end)
  return widget
end
local make_cpu_widget
make_cpu_widget = function()
  local widget = wibox.widget.textbox()
  local format
  format = function(w, a)
    return "CPU: " .. string.format("%2s", a[1]) .. "%"
  end
  vicious.register(widget, vicious.widgets.cpu, format, 2)
  local notification = nil
  widget:connect_signal("mouse::enter", function()
    notification = naughty.notify({
      text = get_top(),
      timeout = 0,
      font = "monospace 12",
      screen = mouse.screen,
      position = naughty.config.defaults.position,
      max_width = 1800
    })
  end)
  widget:connect_signal("mouse::leave", function()
    if notification ~= nil then
      naughty.destroy(notification)
      notification = nil
    end
  end)
  return widget
end
local get_sensors
get_sensors = function()
  local f = io.popen("sensors")
  return table.concat((function()
    local _accum_0 = { }
    local _len_0 = 1
    for line in f:lines() do
      _accum_0[_len_0] = line
      _len_0 = _len_0 + 1
    end
    return _accum_0
  end)(), "\n")
end
local make_therm_widget
make_therm_widget = function()
  local widget = wibox.widget.textbox()
  vicious.register(widget, vicious.widgets.thermal, "T: $1℃", 2, "thermal_zone0")
  local notification = nil
  widget:connect_signal("mouse::enter", function()
    notification = naughty.notify({
      text = get_sensors(),
      timeout = 0,
      font = "monospace 12",
      screen = mouse.screen,
      position = naughty.config.defaults.position,
      max_width = 1800
    })
  end)
  widget:connect_signal("mouse::leave", function()
    if notification ~= nil then
      naughty.destroy(notification)
      notification = nil
    end
  end)
  return widget
end
local beautiful = require("beautiful")
local gears = require("gears")
local set_wallpaper
set_wallpaper = function(screen)
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
  end
  local wallpaper
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(screen)
  end
  return gears.wallpaper.maximized(wallpaper, screen, true)
end
local initialize
initialize = function()
  screen.connect_signal("property::geometry", set_wallpaper)
  return awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
    awful.tag({
      "1",
      "2",
      "3",
      "4"
    }, s, awful.layout.layouts[1])
    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(awful.button({ }, 1, function()
      return awful.layout.inc(1)
    end), awful.button({ }, 3, function()
      return awful.layout.inc(-1)
    end), awful.button({ }, 4, function()
      return awful.layout.inc(1)
    end), awful.button({ }, 5, function()
      return awful.layout.inc(-1)
    end)))
    s.mytaglist = awful.widget.taglist({
      screen = s,
      filter = awful.widget.taglist.filter.all,
      buttons = taglist_buttons
    })
    s.mytasklist = make_tasklist(s, tasklist_buttons)
    s.cpuwidget = make_cpu_widget()
    s.batwidget = wibox.widget.progressbar()
    s.batwidget:set_width(50)
    s.batwidget:set_height(3)
    local batbox = wibox.layout.constraint(wibox.widget({
      {
        max_value = 1,
        widget = s.batwidget,
        border_width = 0.5,
        border_color = "#000000",
        color = {
          type = "linear",
          from = {
            0,
            0
          },
          to = {
            0,
            30
          },
          stops = {
            {
              0,
              "#AECF96"
            },
            {
              1,
              "#FF5656"
            }
          }
        }
      },
      direction = "east",
      color = beautiful.fg_widget,
      layout = wibox.container.place
    }, "min", 2, 3))
    local pbar = wibox.widget({
      max_value = 1,
      color = "#AECF96",
      forced_height = 10,
      forced_width = 60,
      shape = gears.shape.rounded_bar,
      border_width = 2,
      border_color = beautiful.border_color,
      widget = wibox.widget.progressbar,
      point = {
        x = 0,
        y = 10
      }
    })
    s.batwidget = wibox.widget({
      pbar,
      forced_width = 40,
      layout = wibox.layout.manual
    })
    s.batwidget_tooltip = awful.tooltip({
      objects = {
        s.batwidget
      },
      timer_function = util.bat_tooltip_fun,
      font = "mono 14"
    })
    vicious.register(pbar, vicious.widgets.bat, "$2", 61, "BAT0")
    s.mywibox = awful.wibar({
      position = "top",
      screen = s,
      height = 30
    })
    local month_calendar = awful.widget.calendar_popup.month()
    month_calendar:attach(mytextclock, "tr")
    return s.mywibox:setup({
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        mylauncher,
        s.mytaglist,
        s.mypromptbox
      },
      s.mytasklist,
      {
        layout = wibox.layout.fixed.horizontal,
        spacing = 15,
        spacing_widget = {
          make_sep(),
          valign = "center",
          halign = "center",
          widget = wibox.container.place
        },
        wibox.widget({
          forced_width = 15,
          make_sep(10),
          valign = "center",
          halign = "center",
          widget = wibox.container.place
        }),
        wibox.widget({
          s.cpuwidget,
          wibox.widget({
            forced_width = 30
          }),
          make_mem_widget(),
          layout = wibox.layout.align.horizontal,
          forced_width = 215
        }),
        make_therm_widget(),
        wibox.widget.systray(),
        s.batwidget,
        net_widgets.wireless({
          interface = "wlp5s0",
          onclick = util.run_nmtui
        }),
        require("volume")(),
        require("brightness")(),
        mytextclock,
        s.mylayoutbox
      }
    })
  end)
end
return {
  make_layoutbox = make_layoutbox,
  make_tasklist = make_tasklist,
  make_cpu_widget = make_cpu_widget,
  get_top = get_top,
  make_sep = make_sep,
  initialize = initialize,
  set_wallpaper = set_wallpaper
}
