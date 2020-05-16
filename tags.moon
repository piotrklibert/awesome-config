-- Switching tags - IOW cycling through virtual desktops - ordered in a 3x3 grid
awful = require "awful"
tag = require "awful.tag"

{:gtimer, :filter_in} = require("util")


get_tags = -> screen[1].tags


slide_out_timer = nil

wrap_show_taglist = (f) ->
  (...) ->
    if a = _G.Taglist
      a\show()
    f(...)
    if a = _G.Taglist
      a\autoHide(4)



-- Note: we're working with a 3x3 grid (think tic-tac-toe board):
--   1 2 3
--   4 5 6
--   7 8 9
-- We need to implement a wrap-around both vertically and horizontally.

-- Defaults work in up and down directions, ie. calling tag_up on a tag with
-- label 2 will move to 8 and tag_down on 8 will move to 2
tag_up   = wrap_show_taglist (t) ->
  tag.viewidx(-3)

tag_down = wrap_show_taglist (t) ->
  tag.viewidx(3)

tag_left = wrap_show_taglist (t) ->
  n = tonumber screen[1].selected_tag.name
  if filter_in({1, 4, 7})(n)
    tag.viewidx(2)
  else
    tag.viewidx(-1)
{:dbg} = require"util"

tag_right = wrap_show_taglist (t) ->
  n = tonumber screen[1].selected_tag.name
  -- dbg("#{n} #{type(n)} #{filter_in({3, 6, 9})(n)}")
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
