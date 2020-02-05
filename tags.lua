local awful = require("awful")
local tag = require("awful.tag")
local filter_in
filter_in = function(set)
  return function(tn)
    for _index_0 = 1, #set do
      local n = set[_index_0]
      if tostring(tn) == tostring(n) then
        return true
      end
    end
    return false
  end
end
local get_tags
get_tags = function()
  return screen[1].tags
end
local slide_out_timer = nil
local wrap_show_taglist
wrap_show_taglist = function(f)
  return function(...)
    local show, slide, gtimer
    do
      local _obj_0 = require("widgets.mytaglist")
      show, slide, gtimer = _obj_0.show, _obj_0.slide, _obj_0.gtimer
    end
    show()
    f(...)
    if slide_out_timer then
      slide_out_timer:stop()
      slide_out_timer = nil
    end
    slide_out_timer = gtimer(4, (function()
      return slide("out")
    end), {
      call_now = false,
      single_shot = true
    })
  end
end
local tag_up = wrap_show_taglist(function(t)
  return tag.viewidx(-3)
end)
local tag_down = wrap_show_taglist(function(t)
  return tag.viewidx(3)
end)
local tag_left = wrap_show_taglist(function(t, ...)
  local n = tonumber(tag.selected().name)
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
local tag_right = wrap_show_taglist(function(t)
  local n = tonumber(tag.selected().name)
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
