-- TODO:
--
-- 1. make mouse click switch the tag
-- 2. make it hidden, just show after desktop change
-- 3. make it partially hidden, show fully on mouseover
-- 4. make showing and hiding animated (sliding)
--

-- TODO: dedup
filter_in = (set) ->
  (t) ->
    tn = t.name
    for n in *set
      if tn == tostring(n)
        return true
    return false


-- TODO: doesn't work, I think it's because the background widget is on top?
mouse_callback = (x) ->
  naughty.notification {text: gs(x)}
  -- log "callback", ...


taglist_buttons = awful.util.table.join(
  awful.button({ }, 1, mouse_callback),
  awful.button({ modkey }, 1, mouse_callback),
  awful.button({ }, 2, mouse_callback),
  awful.button({ modkey }, 2, mouse_callback),
  awful.button({ }, 3, mouse_callback),
  awful.button({ modkey }, 3, mouse_callback),
  awful.button({ }, 4, mouse_callback),
  awful.button({ }, 5, mouse_callback)
)


make_widget = (s, btns) ->
  wibox.widget {
    awful.widget.taglist {screen: s, filter: filter_in {1, 2, 3}, buttons: taglist_buttons}
    awful.widget.taglist {screen: s, filter: filter_in {4, 5, 6}, buttons: taglist_buttons}
    awful.widget.taglist {screen: s, filter: filter_in {7, 8, 9}, buttons: taglist_buttons}
    spacing: 6
    id: "grid"
    layout: wibox.layout.fixed.vertical
    buttons: taglist_buttons
  }


make_wibox_container = () ->    -- Create a taglist widget
  wb = wibox {ontop: true}
  wb.opacity = 0.7
  wb.x = 1820
  wb.y = 240
  wb.height = 115
  wb.width = 95
  wb


my_wibox = nil

get_wb = () ->
  my_wibox


local slide

setup = (wb, widget) ->
  wb\setup {
    {
      widget
      margins: 15
      layout: wibox.container.margin
    }
    id: "bg"
    border_color: "#919191"
    border_width: 1
    border_strategy: "inner"
    widget: wibox.container.background
  }
  wb\connect_signal "mouse::enter", -> slide("in")
  wb\connect_signal "mouse::leave", -> slide("out")
  my_wibox = wb
  wb.visible = true
  wb


-- Animations
--------------------------------------------------------------------------------

colors = {
  "#919191", "#A67E7E", "#AE6E6E", "#C45C5C", "#D84444", "#F02020", "#F90606"
}


-- blink_borders = (timer) ->
--   for _ = 1, 15
--     for c in *colors
--       get_wb()\get_children_by_id("bg")[1].border_color = c
--       coroutine.yield()

--     for x = #colors,1,-1
--       c = colors[x]
--       get_wb()\get_children_by_id("bg")[1].border_color = c
--       coroutine.yield()

--   timer\stop()
--   return
init = 1820
state = {
  init: init
  last: init + 75
}

timers = {
  slide_timer: nil
  blink_timer: nil
}

show = () ->
  if timers.slide_timer
    timers.slide_timer\stop!
    timers.slide_timer = nil
  get_wb()\geometry({x: state.init})

slide_out = () ->
  s = copy(state)
  current_x = get_wb()\geometry().x
  init = current_x
  for x = init,s.last,2
    get_wb()\geometry({x: x})
    -- naughty.notification {text: "out #{last}, #{init}, 2"}
    yield()

slide_in = () ->
  s = copy(state)
  last = get_wb()\geometry().x
  for x = last,s.init,-2
    get_wb()\geometry({x: x})
    -- naughty.notification {text: "in #{last}, #{init}, -2"}
    yield()


-- TODO: move to utils
gtimer = (t, callback, opts) ->
  args = merge {
    timeout: t, callback: callback
    call_now: true, autostart: true,
  }, opts or {}
  gears.timer args


slide = (arg) ->
  if timers.slide_timer
    timers.slide_timer\stop!
    timers.slide_timer = nil

  generator = if arg == "in"
    coroutine.wrap(slide_in)
  else
    coroutine.wrap(slide_out)

  timers.slide_timer = gtimer 0.05, -> generator()


-- start_stepping = (wb) ->
--   ub = coroutine.wrap(blink_borders)
--   up = coroutine.wrap(slide_animation)
--   timer1 = gtimer 0.05, -> ub(timer1)
--   timer2 = gtimer 0.05, -> up(timer2)


{
  :gtimer, :show, :slide, :make_wibox_container, :make_widget, :setup, :get_wb, :colors, demo: -> start_stepping(get_wb())
}
