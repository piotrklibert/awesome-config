local filter_in
filter_in = function(set)
  return function(t)
    local tn = t.name
    for _index_0 = 1, #set do
      local n = set[_index_0]
      if tn == tostring(n) then
        return true
      end
    end
    return false
  end
end
local mouse_callback
mouse_callback = function(x)
  return naughty.notification({
    text = gs(x)
  })
end
local taglist_buttons = awful.util.table.join(awful.button({ }, 1, mouse_callback), awful.button({
  modkey
}, 1, mouse_callback), awful.button({ }, 2, mouse_callback), awful.button({
  modkey
}, 2, mouse_callback), awful.button({ }, 3, mouse_callback), awful.button({
  modkey
}, 3, mouse_callback), awful.button({ }, 4, mouse_callback), awful.button({ }, 5, mouse_callback))
local make_widget
make_widget = function(s, btns)
  return wibox.widget({
    awful.widget.taglist({
      screen = s,
      filter = filter_in({
        1,
        2,
        3
      }, {
        buttons = taglist_buttons
      })
    }),
    awful.widget.taglist({
      screen = s,
      filter = filter_in({
        4,
        5,
        6
      }, {
        buttons = taglist_buttons
      })
    }),
    awful.widget.taglist({
      screen = s,
      filter = filter_in({
        7,
        8,
        9
      }, {
        buttons = taglist_buttons
      })
    }),
    spacing = 6,
    id = "grid",
    layout = wibox.layout.fixed.vertical,
    buttons = taglist_buttons
  })
end
local make_wibox_container
make_wibox_container = function()
  local wb = wibox({
    ontop = true
  })
  wb.opacity = 0.7
  wb.x = 1820
  wb.y = 240
  wb.height = 115
  wb.width = 95
  return wb
end
local my_wibox = nil
local get_wb
get_wb = function()
  return my_wibox
end
local slide
local setup
setup = function(wb, widget)
  wb:setup({
    {
      widget,
      margins = 15,
      layout = wibox.container.margin
    },
    id = "bg",
    border_color = "#919191",
    border_width = 1,
    border_strategy = "inner",
    widget = wibox.container.background
  })
  wb:connect_signal("mouse::enter", function()
    return slide("in")
  end)
  wb:connect_signal("mouse::leave", function()
    return slide("out")
  end)
  my_wibox = wb
  wb.visible = true
  return wb
end
local colors = {
  "#919191",
  "#A67E7E",
  "#AE6E6E",
  "#C45C5C",
  "#D84444",
  "#F02020",
  "#F90606"
}
local init = 1820
local state = {
  init = init,
  last = init + 75
}
local timers = {
  slide_timer = nil,
  blink_timer = nil
}
local show
show = function()
  if timers.slide_timer then
    timers.slide_timer:stop()
    timers.slide_timer = nil
  end
  return get_wb():geometry({
    x = state.init
  })
end
local slide_out
slide_out = function()
  local s = copy(state)
  local current_x = get_wb():geometry().x
  init = current_x
  for x = init, s.last, 2 do
    get_wb():geometry({
      x = x
    })
    yield()
  end
end
local slide_in
slide_in = function()
  local s = copy(state)
  local last = get_wb():geometry().x
  for x = last, s.init, -2 do
    get_wb():geometry({
      x = x
    })
    yield()
  end
end
local gtimer
gtimer = function(t, callback, opts)
  local args = merge({
    timeout = t,
    callback = callback,
    call_now = true,
    autostart = true
  }, opts or { })
  return gears.timer(args)
end
slide = function(arg)
  if timers.slide_timer then
    timers.slide_timer:stop()
    timers.slide_timer = nil
  end
  local generator
  if arg == "in" then
    generator = coroutine.wrap(slide_in)
  else
    generator = coroutine.wrap(slide_out)
  end
  timers.slide_timer = gtimer(0.05, function()
    return generator()
  end)
end
return {
  gtimer = gtimer,
  show = show,
  slide = slide,
  make_wibox_container = make_wibox_container,
  make_widget = make_widget,
  setup = setup,
  get_wb = get_wb,
  colors = colors,
  demo = function()
    return start_stepping(get_wb())
  end
}
