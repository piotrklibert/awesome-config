-- TODO:
--
-- 1. make mouse click switch the tag!
-- 2. make it hidden, just show after desktop change - DONE
-- 3. make it partially hidden, show fully on mouseover - DONE
-- 4. make showing and hiding animated (sliding) - DONE
-- 5. cleanups and refactoring
-- 6. finishing writing a post for the blog
--

{:filter_in, :gtimer} = require "util"


-- TODO: doesn't work, I think it's because the background widget is on top?
-- mouse_callback = (x) ->
--   log "callback", x
--   naughty.notification {text: gs(x)}
-- taglist_buttons = awful.util.table.join(
--   awful.button({ }, 1, awful.tag.viewonly),
--   awful.button({ modkey }, 1, awful.client.movetotag),
--   awful.button({ }, 2, awful.tag.viewtoggle),
--   awful.button({ modkey }, 2, awful.client.toggletag),
--   awful.button({ }, 3, (t) -> customization.func.tag_action_menu(t)),
--   awful.button({ modkey }, 3, awful.tag.delete),
--   awful.button({ }, 4, (t) -> awful.tag.viewprev(awful.tag.getscreen(t))),
--   awful.button({ }, 5, (t) -> awful.tag.viewnext(awful.tag.getscreen(t)))
-- )


make_widget = (s, btns) ->
  wibox.widget {
    awful.widget.taglist {screen: s, filter: filter_in {1, 2, 3}, (x) -> x.name} -- buttons: taglist_buttons
    awful.widget.taglist {screen: s, filter: filter_in {4, 5, 6}, (x) -> x.name} -- buttons: taglist_buttons
    awful.widget.taglist {screen: s, filter: filter_in {7, 8, 9}, (x) -> x.name} -- buttons: taglist_buttons
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


token = {}
my_wibox = nil


get_wb = () ->
  my_wibox

set_wb = (val, tok) ->
  -- doesn't really serve any purpose, I just had an idea and wanted test it out
  unless tok == token
    return "operation not permited"
  my_wibox = val


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
  wb.visible = true
  set_wb(wb, token)
  wb


-- Animations
--------------------------------------------------------------------------------

colors = {"#919191", "#A67E7E", "#AE6E6E", "#C45C5C", "#D84444", "#F02020", "#F90606"}

slide_conf = do
  init = 1820
  {
    init: init
    last: init + 75
    step_time: 0.05
  }

timers = {
  slide_timer: nil
  blink_timer: nil
}

-----

-- just to get a feel of how to use coros within awsome for animation
blink_borders = (timer, rep = 5) ->
  for _ = 1, rep
    for c in *colors
      get_wb()\get_children_by_id("bg")[1].border_color = c
      yield()

    for x = #colors,1,-1
      c = colors[x]
      get_wb()\get_children_by_id("bg")[1].border_color = c
      yield()
  timer\stop()

blink_demo = (wb) ->
  ub = coroutine.wrap(blink_borders)
  timer1 = gtimer 0.05, -> ub(timer1)

--------------------------------------------------------------------------------

-- cancel any sliding animation and display widget fully on screen
show = () ->
  if timers.slide_timer
    timers.slide_timer\stop!
    timers.slide_timer = nil
  get_wb()\geometry({x: slide_conf.init})


-- slide_in and slide_out will act as coroutines bodies, see slide
slide_out = (timer) ->
  s = copy(slide_conf)
  init = get_wb()\geometry().x
  for x = init,s.last,2
    get_wb()\geometry({x: x})
    yield()
  timer\stop!

slide_in = (timer) ->
  s = copy(slide_conf)
  last = get_wb()\geometry().x
  for x = last,s.init,-2
    get_wb()\geometry({x: x})
    yield()
  timer\stop!


-- stop and clear the timer if it's stepping, then create a fresh coroutine for
-- sliding in or out and register it with Awsome event loop (via `gears.timer`)
slide = (arg) ->
  if timers.slide_timer
    timers.slide_timer\stop!
    timers.slide_timer = nil
  {:wrap} = coro
  generator = if arg == "in" then wrap(slide_in) else wrap(slide_out)
  timers.slide_timer = gtimer slide_conf.step_time, ->
    generator(timers.slide_timer)



{
  :gtimer, :show, :slide, :make_wibox_container, :make_widget, :setup, :get_wb, :colors, :blink_demo, :set_wb
}
