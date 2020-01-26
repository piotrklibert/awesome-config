net_widgets = require("net_widgets")

awful = require "awful"
wibox = require "wibox"
naughty = require "naughty"

h = require "helpers"
u = require "util"



taglist_buttons = awful.util.table.join(
  awful.button({ }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({ }, 2, awful.tag.viewtoggle),
  awful.button({ modkey }, 2, awful.client.toggletag),
  awful.button({ }, 3, (t) -> customization.func.tag_action_menu(t)),
  awful.button({ modkey }, 3, awful.tag.delete),
  awful.button({ }, 4, (t) -> awful.tag.viewprev(awful.tag.getscreen(t))),
  awful.button({ }, 5, (t) -> awful.tag.viewnext(awful.tag.getscreen(t)))
)



make_layoutbox = (screen) ->
  lb = awful.widget.layoutbox(screen)
  buttons = {
    awful.button { }, 1, () -> awful.layout.inc( 1),
    awful.button { }, 3, () -> awful.layout.inc(-1),
    awful.button { }, 4, () -> awful.layout.inc( 1),
    awful.button { }, 5, () -> awful.layout.inc(-1)
  }
  lb\buttons gears.table.join(unpack(buttons))
  lb


make_sep = (t = 1) ->
  {
    forced_width: 5,
    forced_height: 24,
    thickness: t,
    color: "#777777",
    widget: wibox.widget.separator
  }


make_tasklist = (screen, buttons) ->

  highlight_bar_widget = {
    wibox.widget.base.make_widget(),
    forced_height: 5,
    id: "background_role",
    widget: wibox.container.background,
  }
  awful.widget.tasklist {
    screen: screen,
    buttons: buttons,
    filter: awful.widget.tasklist.filter.currenttags,
    layout: {
      spacing_widget: {
        make_sep!,
        valign: "center", halign: "center",
        widget: wibox.container.place,
      },
      spacing: 35,
      layout: wibox.layout.fixed.horizontal
    },
    widget_template: {
      highlight_bar_widget,
      {
        {{id: "clienticon", widget: awful.widget.clienticon},
          margins: 5, widget: wibox.container.margin},
        {id: "title", widget: wibox.widget.textbox},
        layout: wibox.layout.align.horizontal
      },
      nil,
      create_callback: (c, index, objects) =>
        @get_children_by_id("clienticon")[1].client = c
        @get_children_by_id("title")[1].text = tostring(c.name\sub(1, 40))
      update_callback: (c, index, objects) =>
        self\get_children_by_id("clienticon")[1].client = c
        self\get_children_by_id("title")[1].text = tostring(c.name\sub(1, 40))
      layout: wibox.layout.align.vertical,
    },
  }


get_top = () ->
  f = io.popen("top -b -n1 -w 140")
  table.concat [line for line in f\lines()], "\n"

get_top_mem = () ->
  f = io.popen("top -b -n1 -w 140 -o RES")
  table.concat [line for line in f\lines()], "\n"


make_mem_widget = () ->
  widget = wibox.widget.textbox()
  vicious.register(widget, vicious.widgets.mem, "MEM: $1%")

  notification = nil
  widget\connect_signal "mouse::enter", () ->
    notification = naughty.notify {
      text: get_top_mem()
      timeout: 0,
      font: "monospace 12"
      screen: mouse.screen,
      position: naughty.config.defaults.position
      max_width: 1800
      -- width: 1800
    }
  widget\connect_signal "mouse::leave", () ->
    if notification ~= nil
      naughty.destroy(notification)
      notification = nil

  widget



make_cpu_widget = ->
  widget = wibox.widget.textbox()
  format = (w, a) -> "CPU: " .. string.format("%2s", a[1]) .. "%"
  vicious.register widget, vicious.widgets.cpu, format, 2

  notification = nil
  widget\connect_signal "mouse::enter", () ->
    notification = naughty.notify {
      text: get_top()
      timeout: 0,
      font: "monospace 12"
      screen: mouse.screen,
      position: naughty.config.defaults.position
      max_width: 1800
      -- width: 1800
    }
  widget\connect_signal "mouse::leave", () ->
    if notification ~= nil
      naughty.destroy(notification)
      notification = nil

  widget


get_sensors = () ->
  f = io.popen("sensors")
  table.concat [line for line in f\lines()], "\n"


make_therm_widget = ->
  widget = wibox.widget.textbox()
  vicious.register(widget, vicious.widgets.thermal, "T: $1℃", 2, "thermal_zone0")

  notification = nil
  widget\connect_signal "mouse::enter", () ->
    notification = naughty.notify {
      text: get_sensors(),
      timeout: 0,
      font: "monospace 12"
      screen: mouse.screen,
      position: naughty.config.defaults.position
      max_width: 1800
      -- width: 1800
    }
  widget\connect_signal "mouse::leave", () ->
    if notification ~= nil
      naughty.destroy(notification)
      notification = nil

  widget


-- Theme handling library
beautiful = require("beautiful")
gears = require("gears")

set_wallpaper = (screen) ->
  if beautiful.wallpaper
    wallpaper = beautiful.wallpaper
  wallpaper = wallpaper(screen) if type(wallpaper) == "function"
  gears.wallpaper.maximized(wallpaper, screen, true)


initialize = ->
  -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
  screen.connect_signal("property::geometry", set_wallpaper)
  awful.screen.connect_for_each_screen (s) ->
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox\buttons(
      gears.table.join(
        awful.button({ }, 1, () -> awful.layout.inc( 1)),
        awful.button({ }, 3, () -> awful.layout.inc(-1)),
        awful.button({ }, 4, () -> awful.layout.inc( 1)),
        awful.button({ }, 5, () -> awful.layout.inc(-1))
      )
    )
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen: s,
        filter: awful.widget.taglist.filter.all,
        buttons: taglist_buttons
    }

    -- local www = wibox.widget.textbox()
    -- www.create_callback = function () util.dbg("adasd") end

    -- tasklist
    s.mytasklist = make_tasklist(s, tasklist_buttons)

    -- CPU usage
    s.cpuwidget = make_cpu_widget()
    ---

    s.batwidget = wibox.widget.progressbar()
    s.batwidget\set_width(50)
    s.batwidget\set_height(3)

    batbox = wibox.layout.constraint(
        wibox.widget {
            {
                max_value: 1,
                widget: s.batwidget,
                border_width: 0.5, border_color: "#000000",
                color: {type: "linear", from: {0, 0}, to: {0, 30}, stops: {{0, "#AECF96"}, {1, "#FF5656"}}},
            },
             direction: "east", color: beautiful.fg_widget,
            layout: wibox.container.place
        },
        "min", 2, 3)

    pbar = wibox.widget {
        max_value: 1,
        -- value: 0.2,
        color: "#AECF96", -- {type: "linear", from: {0, 0}, to: {0, 30}, stops: {{0, "#AECF96"}, {0.3, "#f0f"}, {0.6, "#FF5656"}}},
        forced_height: 10,
        forced_width: 60,
        shape: gears.shape.rounded_bar,
        border_width: 2,
        border_color: beautiful.border_color,
        widget: wibox.widget.progressbar,
        point: {x: 0, y: 10}
    }

    s.batwidget = wibox.widget {
        pbar ,
        forced_width: 40,
        layout: wibox.layout.manual
    }

    s.batwidget_tooltip = awful.tooltip {
        objects: { s.batwidget },
        timer_function: util.bat_tooltip_fun,
        font: "mono 14"
    }


    vicious.register(pbar, vicious.widgets.bat, "$2", 61, "BAT0")
    --


    -- Create the wibox
    s.mywibox = awful.wibar({ position: "top", screen: s, height: 30  })

    month_calendar = awful.widget.calendar_popup.month()
    month_calendar\attach( mytextclock, "tr" )

    -- Add widgets to the wibox
    s.mywibox\setup {
        layout: wibox.layout.align.horizontal,
        { -- Left widgets
            layout: wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout: wibox.layout.fixed.horizontal,
            spacing: 15,
            spacing_widget: {
                make_sep(),
                valign: "center", halign: "center",
                widget: wibox.container.place,
            },
            wibox.widget {
                forced_width:15,
                make_sep(10),
                valign: "center", halign: "center",
                widget: wibox.container.place
            },
            wibox.widget {
                s.cpuwidget,
                wibox.widget {forced_width:30},
                make_mem_widget(),
                layout: wibox.layout.align.horizontal,
                forced_width: 215
            },
            make_therm_widget(),
            -- mykeyboardlayout,
            wibox.widget.systray(),
            s.batwidget,
            net_widgets.wireless({interface:"wlp5s0", onclick: util.run_nmtui}),
            require("volume")(),
            require("brightness")(),
            mytextclock,
            s.mylayoutbox,
        },
    }


{
  :make_layoutbox,
  :make_tasklist,
  :make_cpu_widget,
  :get_top,
  :make_sep,
  :initialize,
  :set_wallpaper
}
