-- Switching tags - IOW cycling through virtual desktops - ordered in a 3x3 grid
awful = require "awful"
tag = require "awful.tag"

-- TODO: dedup
filter_in = (set) ->
  (tn) ->
    for n in *set
      if tostring(tn) == tostring(n)
        return true
    return false


get_tags = -> screen[1].tags

slide_out_timer = nil
wrap_show_taglist = (f) ->
  (...) ->
    {:show, :slide, :gtimer} = require("widgets.mytaglist")
    show()
    f(...)
    if slide_out_timer
      slide_out_timer\stop()
      slide_out_timer = nil

    slide_out_timer = gtimer 4, (-> slide("out")), {call_now: false}

-- defaults work in up and down directions, ie. calling tag_up on tag with label 2 will move to 8
tag_up   = wrap_show_taglist (t) -> tag.viewidx(-3)
tag_down = wrap_show_taglist (t) -> tag.viewidx(3)

tag_left = wrap_show_taglist (t, ...) ->
  n = tonumber tag.selected().name
  if filter_in({1, 4, 7})(n)
    tag.viewidx(2)
  else
    tag.viewidx(-1)

tag_right = wrap_show_taglist (t) ->
  n = tonumber tag.selected().name
  if filter_in({3, 6, 9})(n)
    tag.viewidx(-2)
  else
    tag.viewidx(1)


{
  :tag_up
  :tag_down
  :tag_left
  :tag_right
}
