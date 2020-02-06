local filter_in, gtimer
do
  local _obj_0 = require("util")
  filter_in, gtimer = _obj_0.filter_in, _obj_0.gtimer
end
local make_widget
make_widget = function(s, btns)
  return wibox.widget({
    awful.widget.taglist({
      screen = s,
      filter = filter_in({
        1,
        2,
        3
      }, function(x)
        return x.name
      end)
    }),
    awful.widget.taglist({
      screen = s,
      filter = filter_in({
        4,
        5,
        6
      }, function(x)
        return x.name
      end)
    }),
    awful.widget.taglist({
      screen = s,
      filter = filter_in({
        7,
        8,
        9
      }, function(x)
        return x.name
      end)
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
local token = { }
local my_wibox = nil
local get_wb
get_wb = function()
  return my_wibox
end
local set_wb
set_wb = function(val, tok)
  if not (tok == token) then
    return "operation not permited"
  end
  my_wibox = val
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
  wb.visible = true
  set_wb(wb, token)
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
local slide_conf
do
  local init = 1820
  slide_conf = {
    init = init,
    last = init + 75,
    step_time = 0.05
  }
end
local timers = {
  slide_timer = nil,
  blink_timer = nil
}
local blink_borders
blink_borders = function(timer, rep)
  if rep == nil then
    rep = 5
  end
  for _ = 1, rep do
    for _index_0 = 1, #colors do
      local c = colors[_index_0]
      get_wb():get_children_by_id("bg")[1].border_color = c
      yield()
    end
    for x = #colors, 1, -1 do
      local c = colors[x]
      get_wb():get_children_by_id("bg")[1].border_color = c
      yield()
    end
  end
  return timer:stop()
end
local blink_demo
blink_demo = function(wb)
  local ub = coroutine.wrap(blink_borders)
  local timer1 = gtimer(0.05, function()
    return ub(timer1)
  end)
end
local show
show = function()
  if timers.slide_timer then
    timers.slide_timer:stop()
    timers.slide_timer = nil
  end
  return get_wb():geometry({
    x = slide_conf.init
  })
end
local slide_out
slide_out = function(timer)
  local s = copy(slide_conf)
  local init = get_wb():geometry().x
  for x = init, s.last, 2 do
    get_wb():geometry({
      x = x
    })
    yield()
  end
  return timer:stop()
end
local slide_in
slide_in = function(timer)
  local s = copy(slide_conf)
  local last = get_wb():geometry().x
  for x = last, s.init, -2 do
    get_wb():geometry({
      x = x
    })
    yield()
  end
  return timer:stop()
end
slide = function(arg)
  if timers.slide_timer then
    timers.slide_timer:stop()
    timers.slide_timer = nil
  end
  local wrap
  wrap = coro.wrap
  local generator
  if arg == "in" then
    generator = wrap(slide_in)
  else
    generator = wrap(slide_out)
  end
  timers.slide_timer = gtimer(slide_conf.step_time, function()
    return generator(timers.slide_timer)
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
  blink_demo = blink_demo,
  set_wb = set_wb
}
