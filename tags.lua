local awful = require("awful")
local tag = require("awful.tag")
local gtimer, filter_in
do
  local _obj_0 = require("util")
  gtimer, filter_in = _obj_0.gtimer, _obj_0.filter_in
end
local get_tags
get_tags = function()
  return screen[1].tags
end
local slide_out_timer = nil
local wrap_show_taglist
wrap_show_taglist = function(f)
  return function(...)
    do
      local a = _G.Taglist
      if a then
        a:show()
      end
    end
    f(...)
    do
      local a = _G.Taglist
      if a then
        return a:autoHide(4)
      end
    end
  end
end
local tag_up = wrap_show_taglist(function(t)
  return tag.viewidx(-3)
end)
local tag_down = wrap_show_taglist(function(t)
  return tag.viewidx(3)
end)
local tag_left = wrap_show_taglist(function(t)
  local n = tonumber(screen[1].selected_tag.name)
  if filter_in({
    1,
    4,
    7
  })(n) then
    return tag.viewidx(2)
  else
    return tag.viewidx(-1)
  end
end)
local dbg
dbg = require("util").dbg
local tag_right = wrap_show_taglist(function(t)
  local n = tonumber(screen[1].selected_tag.name)
  if filter_in({
    3,
    6,
    9
  })(n) then
    return tag.viewidx(-2)
  else
    return tag.viewidx(1)
  end
end)
return {
  tag_up = tag_up,
  tag_down = tag_down,
  tag_left = tag_left,
  tag_right = tag_right
}
