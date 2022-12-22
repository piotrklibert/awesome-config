-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
require("luarocks.loader")
package.cpath = "/home/cji/portless/hx-lua-simdjson/?.so;" .. package.cpath
package.cpath = "/usr/local/lib/lua/5.1/lgi/?.so;" .. package.cpath
package.cpath = "/home/cji/portless/lrexlib/?.so;" .. package.cpath
package.cpath = "/home/cji/portless/awesome/?.so;" .. package.cpath
-- package.cpath = package.cpath .. ";/home/cji/portless/lua/?.so"
package.cpath = package.cpath .. ";/home/cji/.luarocks/lib/lua/5.1/?.so"
package.cpath = package.cpath .. ";/home/cji/.luarocks/lib/lua/5.1/lgi/?.so"


package.path = "/usr/local/share/awesome/lib/?.lua"
package.path = package.path .. ";/usr/local/share/awesome/lib/?/init.lua"
package.path = package.path .. ";/usr/local/share/lua/5.1/?.lua"
package.path = package.path .. ";/usr/local/share/lua/5.1/?/init.lua"
package.path = package.path .. ";/usr/local/share/luajit-2.1.0-beta3/?.lua"
package.path = package.path .. ";./?.lua"
package.path = package.path .. ";/etc/xdg/awesome/?.lua"
package.path = package.path .. ";/etc/xdg/awesome/?/init.lua"
package.path = package.path .. ";/home/cji/.config/awesome/?.lua"
package.path = package.path .. ";/home/cji/.config/awesome/?/init.lua"
package.path = package.path .. ";/home/cji/.config/awesome/widgets/?/?.lua"
package.path = package.path .. ";/home/cji/.config/awesome/widgets/?/init.lua"
package.path = package.path .. ";/home/cji/.luarocks/share/lua/5.1/?.lua"
package.path = package.path .. ";/home/cji/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";/home/cji/portless/lua/?.lua"
package.path = package.path .. ";/home/cji/portless/lua/?/?.lua"
package.path = package.path .. ";/home/cji/portless/lua/?/init.lua"
package.path = package.path .. ";/home/cji/portless/lua/Microlight/?.lua"
package.path = package.path .. ";/home/cji/portless/lua/Penlight/lua/?/"
package.path = package.path .. ";/home/cji/portless/lua/Penlight/lua/?/init.lua"
package.path = package.path .. ";/home/cji/priv/awesomescripts/haxeshigh/output/?.lua"
package.path = package.path .. ";/home/cji/priv/moonscript/awesomescript/?.lua"
package.path = package.path .. ";/home/cji/priv/moonscript/awesomescript/?.lua"
package.path = package.path .. ";/home/cji/priv/moonscript/awesomescript/vendor/?.lua"
package.path = package.path .. ";/home/cji/priv/moonscript/awesomescript/vendor/?/init.lua"
package.path = package.path .. ";/home/cji/priv/moonscript/awesomescript/vendor/readline/?.lua"

dofile("/home/cji/priv/moonscript/awesomescript/runtime/init.lua")

function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

pwd = script_path()
print(pwd)

-- _log = require "log".new(
--   -- maximum log level
--   "trace",
--   -- Writer
--   require 'log.writer.list'.new(               -- multi writers:
--     -- require 'log.writer.console.color'.new(),  -- * console color
--     require 'log.writer.file.roll'.new(        -- * roll files
--         script_path() .. '/logs/',                                --   log dir
--       'events.log',                            --   current log name
--       10,                                      --   count files
--       10*1024*1024*1024                             --   max file size in bytes
--     )
--   ),
--   -- Formatter
--   require "log.formatter.concat".new()
-- )


function __log(...)
    -- _log.debug(...)
end


_G["_log"] = _log
_G["log"] = setmetatable({}, {
    __call = function (t, ...) return __log(...) end,
    __index = function (t, k) return _log[k] end
})


log(script_path())


capi = {
    client = client,
    screen = screen,
    mouse = mouse,
    dbus = dbus,
    event = event,
    ewmh = ewmh,
    mousegrabber = mousegrabber,
    property = property,
    root = root,
    selection = selection,
    spawn = spawn,
    stack = stack,
    strut = strut,
    systray = systray,
    xkb = xkb
}


-- Standard awesome library
gears = require("gears")
awful = require("awful")
require("awful.autofocus")

Promise = require "promise"
--Promise.async = gears.timer.delayed_call

wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
naughty = require("naughty")

local menubar = require("menubar")

local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

i = require "inspect"

helpers = require("helpers")
vicious = require("vicious")
-- mouse = require("awful.mouse")

local net_widgets = require("net_widgets")

---

util = require("util")
screen_init = require("screen-init")

---

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = inspect(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/cji/.config/awesome/default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt256c-ml"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor


modkey = "Mod4"
altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts =  {
    -- awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.right,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit .max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({
    items = {
        { "awesome", myawesomemenu, beautiful.awesome_icon },
        { "EmacsND", "emacs --no-desktop" },
        { "Firefox", "firefox" },
        { "open terminal", terminal },
        { "restart", awesome.restart },
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- -- do not use letters, which shadow access key to menu entry
awful.menu.menu_keys.down  = { "Down", ".", ">", "'", "\"", }
awful.menu.menu_keys.up    = {  "Up", ",", "<", ";", ":", }
awful.menu.menu_keys.enter = { "Right", "]", "}", "=", "+", }
awful.menu.menu_keys.back  = { "Left", "[", "{", "-", "_", }
awful.menu.menu_keys.exec  = { "Return", "Space", }
awful.menu.menu_keys.close = { "Escape", "BackSpace", }

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock("%b %d, %H:%M:%S", 1)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)


dofile("/home/cji/priv/awesomescripts/haxeshigh/output/hx_pkg.lua")

screen_init.initialize()


-- }}}
-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}
        -- awful.key({                   }, "XF86AudioRaiseVolume", function() awful.util.spawn("pamixer -i 5") end),
        -- awful.key({                   }, "XF86AudioLowerVolume", function() awful.util.spawn("pamixer -d 5") end),
        -- awful.key({         "Shift"   }, "XF86AudioRaiseVolume", function() awful.util.spawn("pavolume volup --nolimit") end),
        -- awful.key({         "Shift"   }, "XF86AudioLowerVolume", function() awful.util.spawn("pavolume voldown") end),
        -- awful.key({                   }, "XF86AudioMute", function() awful.util.spawn("pamixer -t") end),


-- tags = require "tags"

local function run_rxvt()
    awful.spawn.spawn("urxvt256c-ml")
end

local function screenshot()
    awful.spawn.with_shell("import $(date +screenshot_%Y-%m-%d_%H%M.png)")
end

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey, "Shift" }, "p", function () naughty.notify{text=inspect(capi.mouse.coords())} end, {description="", group="awesome"}),
    awful.key({ modkey,         }, "s", hotkeys_popup.show_help, {description="show help", group="awesome"}),
    awful.key({ modkey,         }, "q", run_rxvt, {description="open terminal", group="system"}),
    awful.key({ }, "Print", screenshot, {description="screenshot", group="system"}),

    awful.key({altkey, "Control"}, "Up",    function () Switcher.tag_up() end, {description = "view previous", group = "tag"}),
    awful.key({altkey, "Control"}, "Down",  function () Switcher.tag_down() end, {description = "view next", group = "tag"}),
    awful.key({altkey, "Control"}, "Left",  function () Switcher.tag_left() end, {description = "view previous", group = "tag"}),
    awful.key({altkey, "Control"}, "Right", function () Switcher.tag_right() end, {description = "view next", group = "tag"}),

    awful.key({altkey, "Control"}, "q", function () MyPopup:toggle() end, {description = "view next", group = "tag"}),

    -- awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    --           {description = "view previous", group = "tag"}),
    -- awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    --           {description = "view next", group = "tag"}),

    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ altkey,           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ altkey, "Shift"   }, "Tab",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    -- awful.key({ modkey,           }, "j",
    --     function ()
    --         awful.client.focus.history.previous()
    --         if client.focus then
    --             client.focus:raise()
    --         end
    --     end,
    --     {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)
clientkeys = gears.table.join(
    awful.key({ modkey,           }, "Left",   helpers.client_sideline_left,
              {description = "sideline left", group = "tag"}),
    awful.key({ modkey,           }, "Right",  helpers.client_sideline_right,
              {description = "sideline right", group = "tag"}),
    awful.key({ modkey, altkey    }, "Up",   helpers.client_sideline_top,
              {description = "sideline up", group = "tag"}),
    awful.key({ modkey, altkey    }, "Down",  helpers.client_sideline_bottom,
              {description = "sideline down", group = "tag"}),

    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ altkey,           }, "F4",      function (c) c:kill()                        end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),

    awful.key({ modkey,           }, "Down",
        function (c) c.minimized = true end ,
        {description = "minimize", group = "client"}),

    awful.key({ modkey,           }, "Up",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),

    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),

    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

local keypad = {
    [7] = 79,
    [8] = 80,
    [9] = 81,
    [4] = 83,
    [5] = 84,
    [6] = 85,
    [1] = 87,
    [2] = 88,
    [3] = 89,
}

for i, key in pairs(keypad) do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. key,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. key,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. key,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. key,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end


clientbuttons = gears.table.join(
    awful.button({ modkey, "Shift" }, 3, function ()
            naughty = require"naughty";
            local props = io.popen("bash -c 'xprop -len 25 -id $(xdotool getactivewindow)'");
            naughty.notify({text = props:read("*a"), timeout = 10})
    end),

    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}


-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).

default_rules = {
    border_width = beautiful.border_width,
    border_color = beautiful.border_normal,
    focus = awful.client.focus.filter,
    raise = true,
    keys = clientkeys,
    buttons = clientbuttons,
    screen = awful.screen.preferred,
    placement = awful.placement.no_overlap+awful.placement.no_offscreen
}

awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { }, properties = default_rules },
    { rule_any = { class = {"slack", "Slack"}}, properties = { tag = "3", floating = true } },
    { rule_any = { class = {"discord"}, name = {"Discord"}}, properties = { tag = "4", floating = true } },
    { rule = { name = "fuck"}, properties = { floating = true, x = 350, y=320 } },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {"Arandr", "xtightvncviewer"},
        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {"Event Tester"},
        role = {"pop-up"}
      }, properties = { floating = true } },

    -- TODO: see if we can do this for non-maximized windows only
    -- { rule = {floating = true}, properties = { titlebars_enabled = true } },

    { rule = { class = "emacs" }, properties = { tag = "5" } },
    { rule = { class = "URxvt" }, properties = { maximized = true } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
                          log(i(c))

    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    local tb = awful.titlebar(c, {font="10"})
    local title_text = awful.titlebar.widget.titlewidget(c)
    title_text.font = 'sans 12'
    tb:setup({
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = title_text
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal,
    })
    return tb
end)

-- client.connect_signal("property::floating", function (c) log("prop floating", c,
--                           c.floating) if c.floating then
--                           c:emit_signal("request::titlebar") else c.titlebars_enabled = nil end end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)
-- }}}

dofile("/home/cji/priv/awesomescripts/haxeshigh/output/loader.lua")
