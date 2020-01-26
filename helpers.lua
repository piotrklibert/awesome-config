local awful = require("awful")
local client = awful.client
local naughty = require("naughty")   -- Notification library

local mod = {}

function mod.run_once(prg,arg_string,pname,screen)
	if not prg then
		do return nil end
	end

	if not pname then
		pname = prg
	end

	if not arg_string then
		awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
	else
		awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. " " .. arg_string .. ")",screen)
	end
end

function mod.dbg(vars)
	local text = ""
	if type(vars) == "table" then
		for i=1, #vars do text = text .. vars[i] .. " | " end
	elseif type(vars) == "string" then
		text = vars
	end
	naughty.notify({ text = text, timeout = 0 })
end

function mod.clean(string)
	s = string.gsub(string, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', ' ')
	return s
end

function mod.file_exists(file)
	local cmd = "/bin/bash -c 'if [ -e " .. file .. " ]; then echo true; fi;'"
	local fh = io.popen(cmd)

	s = clean(fh:read('*a'))

	if s == 'true' then return true else return nil end
end

--% Find the path of an application, return nil of doesn't exist
----@ app (string) Text of the first parameter
----@ return string of app path, or nil (remember, only nil and false is false in lua)
function mod.whereis_app(app)
	local fh = io.popen('which ' .. app)
	s = clean(fh:read('*a'))

	if s == "" then return nil else return s end
	return s
end

function mod.require_safe(lib)
	if file_exists(awful.util.getdir("config") .. '/' .. lib ..'.lua') or
		file_exists(awful.util.getdir("config") .. '/' .. lib) then
			require(lib)
	end
end

mod.client_toggle_titlebar = function ()
  awful.titlebar.toggle(client.focus)
end



-- closures for client_status
-- client_status[client] = {sidelined = <boolean>, geometry= <client geometry>}
local client_status = {}

mod.client_sideline_left = function (c)
    if not c then return end
    local scr = screen[awful.screen.focused()]
    local workarea = scr.workarea
    if client_status[c] == nil then
        client_status[c] = {sidelined=false, geometry=nil}
    end
    if client_status[c].sidelined then
        if client_status[c].geometry then
            c:geometry(client_status[c].geometry)
        end
    else
        client_status[c].geometry = c:geometry()
        workarea.width = math.floor(workarea.width/2)
        c:geometry(workarea)
    end
    client_status[c].sidelined = not client_status[c].sidelined
end

mod.client_sideline_right = function (c)
    local scr = screen[awful.screen.focused()]
    local workarea = scr.workarea
    if client_status[c] == nil then
        client_status[c] = {sidelined=false, geometry=nil}
    end
    if client_status[c].sidelined then
        if client_status[c].geometry then
            c:geometry(client_status[c].geometry)
        end
    else
        client_status[c].geometry = c:geometry()
        workarea.x = workarea.x + math.floor(workarea.width/2)
        workarea.width = math.floor(workarea.width/2)
        c:geometry(workarea)
    end
    client_status[c].sidelined = not client_status[c].sidelined
end

mod.client_sideline_top = function (c)
    local scr = screen[awful.screen.focused()]
    local workarea = scr.workarea
    if client_status[c] == nil then
        client_status[c] = {sidelined=false, geometry=nil}
    end
    if client_status[c].sidelined then
        if client_status[c].geometry then
            c:geometry(client_status[c].geometry)
        end
    else
        client_status[c].geometry = c:geometry()
        workarea.height = math.floor(workarea.height/2)
        c:geometry(workarea)
    end
    client_status[c].sidelined = not client_status[c].sidelined
end

mod.client_sideline_bottom = function (c)
    local scr = screen[awful.screen.focused()]
    local workarea = scr.workarea
    if client_status[c] == nil then
        client_status[c] = {sidelined=false, geometry=nil}
    end
    if client_status[c].sidelined then
        if client_status[c].geometry then
            c:geometry(client_status[c].geometry)
        end
    else
        client_status[c].geometry = c:geometry()
        workarea.y = workarea.y + math.floor(workarea.height/2)
        workarea.height = math.floor(workarea.height/2)
        c:geometry(workarea)
    end
    client_status[c].sidelined = not client_status[c].sidelined
end

mod.client_sideline_extend_left = function (c, by)
    local cg = c:geometry()
    if by then
        cg.x = cg.x - by
        cg.width = cg.width + by
    else -- use heuristics
        local delta = math.floor(cg.x/7)
        if delta ~= 0 then
            cg.x = cg.x - delta
            cg.width = cg.width + delta
        end
    end
    c:geometry(cg)
end

mod.client_sideline_extend_right = function (c, by)
    local cg = c:geometry()
    if by then
        cg.width = cg.width + by
    else
        local workarea = screen[awful.screen.focused()].workarea
        local rmargin = math.max( (workarea.x + workarea.width - cg.x - cg.width), 0)
        local delta = math.floor(rmargin/7)
        if delta ~= 0 then
            cg.width = cg.width + delta
        end
    end
    c:geometry(cg)
end

mod.client_sideline_extend_top = function (c, by)
    local cg = c:geometry()
    if by then
        cg.y = cg.y - by
        cg.height = cg.height + by
    else
        local delta = math.floor(cg.y/7)
        if delta ~= 0 then
            cg.y = cg.y - delta
            cg.height = cg.height + delta
        end
    end
    c:geometry(cg)
end

mod.client_sideline_extend_bottom = function (c, by)
    local cg = c:geometry()
    if by then
        cg.height = cg.height + by
    else
        local workarea = screen[awful.screen.focused()].workarea
        local bmargin = math.max( (workarea.y + workarea.height - cg.y - cg.height), 0)
        local delta = math.floor(bmargin/7)
        if delta ~= 0 then
            cg.height = cg.height + delta
        end
    end
    c:geometry(cg)
end

mod.client_sideline_shrink_left = function (c, by)
    local cg = c:geometry()
    local min = customization.default.property.minimal_client_width
    if by then
        cg.width = math.max(cg.width - by, min)
    else
        local delta = math.floor(cg.width/11)
        if delta ~= 0 and cg.width > min then
            cg.width = cg.width - delta
        end
    end
    c:geometry(cg)
end

mod.client_sideline_shrink_right = function (c, by)
    local cg = c:geometry()
    local min = customization.default.property.minimal_client_width
    if by then
        local t = cg.x + cg.width
        cg.width = math.max(cg.width - by, min)
        cg.x = t - cg.width
    else
        local delta = math.floor(cg.width/11)
        if delta ~= 0 and cg.width > min then
            cg.x = cg.x + delta
            cg.width = cg.width - delta
        end
    end
    c:geometry(cg)
end

mod.client_sideline_shrink_top = function (c, by)
    local cg = c:geometry()
    local min = customization.default.property.minimal_client_height
    if by then
        cg.height = math.max(cg.height - by, min)
    else
        local delta = math.floor(cg.height/11)
        if delta ~= 0 and cg.height > min then
            cg.height = cg.height - delta
        end
    end
    c:geometry(cg)
end

mod.client_sideline_shrink_bottom = function (c, by)
    local cg = c:geometry()
    local min = customization.default.property.minimal_client_height
    if by then
        local t = cg.y + cg.width
        cg.height = math.max(cg.height - by, min)
        cg.y = t - cg.height
    else
        local delta = math.floor(cg.height/11)
        if delta ~= 0 and cg.height > min then
            cg.y = cg.y + delta
            cg.height = cg.height - delta
        end
    end
    c:geometry(cg)
end


mod.client_opaque_less = function (c)
    local opacity = c.opacity - 0.1
    if opacity and opacity >= customization.default.property.min_opacity then
        c.opacity = opacity
    end
end

mod.client_opaque_more = function (c)
    local opacity = c.opacity + 0.1
    if opacity and opacity <= customization.default.property.max_opacity then
        c.opacity = opacity
    end
end

mod.client_opaque_off = function (c)
    awful.util.spawn_with_shell("pkill " .. customization.default.compmgr)
end

mod.client_opaque_on = function (c)
    awful.util.spawn_with_shell(customization.default.compmgr.. " " .. customization.default.compmgr_args)
end

mod.client_swap_with_master = function (c)
    c:swap(awful.client.getmaster())
end

mod.client_toggle_top = function (c)
    c.ontop = not c.ontop
end

mod.client_toggle_sticky = function (c)
    c.sticky = not c.sticky
end

mod.client_kill = function (c)
    c:kill()
end

return mod
