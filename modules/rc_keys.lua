local gears = require("gears")
local awful = require("awful")
local vars = require("modules.vars")
local hotkeys_popup = require("awful.hotkeys_popup")
local naughty = require("naughty")

local modkey = vars.modkey

local keys = {}

keys.globalkeys = gears.table.join( --
-- Standard programs -----------------------------------------------------
awful.key({modkey}, "Return", function()
    awful.spawn(vars.terminal)
end, {
    description = "Open Terminal",
    group = "programs"
}), awful.key({modkey, "Control"}, "Return", function()
    awful.spawn(vars.terminal, {
        floating = true,
        placement = awful.placement.centered,
        ontop = true
    })
end, {
    description = "Open Terminal",
    group = "programs"
}), awful.key({modkey}, "f", function()
    awful.spawn(vars.cmd_browser)
end, {
    description = "Open Web browser",
    group = "programs"
}), awful.key({modkey, "Shift"}, "f", function()
    awful.spawn(vars.cmd_browser .. " -P Privacy+")
end, {
    description = "Open Web browser",
    group = "programs"
}), awful.key({modkey}, "e", function()
    awful.spawn(vars.cmd_file_explorer)
end, {
    description = "Open File explorer",
    group = "programs"
}), awful.key({modkey}, "s", function()
    awful.spawn(vars.cmd_spotify)
end, {
    description = "Open Spotify",
    group = "programs"
}), awful.key({modkey}, "d", function()
    awful.spawn(vars.cmd_discord)
end, {
    description = "Open Discord",
    group = "programs"
}), awful.key({modkey}, "v", function()
    awful.spawn("code")
end, {
    description = "Open VS Code",
    group = "programs"
}), awful.key({modkey, "Shift"}, "r", function()
    awful.spawn("openrgb -p Huntsman")
end, {
    description = "Set the keyboard properly",
    group = "programs"
}), awful.key({modkey}, "b", function()
    awful.spawn("kitty -e btop", {
        floating = true
    })
end, {
    description = "Open btop in a kitty term",
    group = "programs"
}), --
-- Rofi -----------------------------------------------------
awful.key({modkey}, "r", function()
    awful.spawn.with_shell(vars.cmd_rofi)
end, {
    description = "Run rofi",
    group = "rofi"
}), awful.key({modkey, "Shift"}, "Return", function()
    awful.spawn.with_shell(vars.cmd_rofi_combi)
end, {
    description = "Run rofi-multi",
    group = "rofi"
}), awful.key({modkey}, "e", function()
    awful.spawn.with_shell({
        cmd = vars.cmd_rofi_filebrowser
    })
end, {
    description = "Run fofi file explorer",
    group = "rofi"
}), awful.key({modkey, "Control"}, "c", function()
    awful.spawn.with_shell(vars.cmd_rofi_code)
end, {
    description = "Open a Code folder in VS Code",
    group = "rofi"
}), --
-- Tag toggling -----------------------------------------------------
awful.key({modkey}, "Left", awful.tag.viewprev, {
    description = "Move to next tab",
    group = "tag"
}), awful.key({modkey}, "Right", awful.tag.viewnext, {
    description = "Move to prev tab",
    group = "tag"
}), awful.key({modkey}, "Escape", awful.tag.history.restore, {
    description = "Go to prev tab",
    group = "tag"
}), --
-- Client focus -----------------------------------------------------
awful.key({modkey, "Mod1"}, "Left", function()
    awful.client.focus.bydirection("left", client.focus)
end, {
    description = "Focus left client",
    group = "focus"
}), awful.key({modkey, "Mod1"}, "h", function()
    awful.client.focus.bydirection("left", client.focus)
end, {
    description = "Focus left client",
    group = "focus"
}), awful.key({modkey, "Mod1"}, "Up", function()
    awful.client.focus.bydirection("up", client.focus)
end, {
    description = "Focus top client",
    group = "focus"
}), awful.key({modkey, "Mod1"}, "j", function()
    awful.client.focus.bydirection("up", client.focus)
end, {
    description = "Focus top client",
    group = "focus"
}), awful.key({modkey, "Mod1"}, "Down", function()
    awful.client.focus.bydirection("down", client.focus)
end, {
    description = "Focus bottom client",
    group = "focus"
}), awful.key({modkey, "Mod1"}, "k", function()
    awful.client.focus.bydirection("down", client.focus)
end, {
    description = "Focus bottom client",
    group = "focus"
}), awful.key({modkey, "Mod1"}, "Right", function()
    awful.client.focus.bydirection("right", client.focus)
end, {
    description = "Focus right client",
    group = "focus"
}), awful.key({modkey, "Mod1"}, "l", function()
    awful.client.focus.bydirection("right", client.focus)
end, {
    description = "Focus right client",
    group = "focus"
}), awful.key({"Mod1"}, "Tab", function()
    awful.client.focus.byidx(1)
end, {
    description = "Cycle through clients",
    group = "focus"
}), --
-- Layout manipulation -----------------------------------------------------
awful.key({modkey, "Control"}, "Left", function()
    awful.client.swap.bydirection("left", client.focus)
end, {
    description = "Swap client with left one",
    group = "client"
}), awful.key({modkey, "Control"}, "h", function()
    awful.client.swap.bydirection("left", client.focus)
end, {
    description = "Swap client with left one",
    group = "client"
}), awful.key({modkey, "Control"}, "Up", function()
    awful.client.swap.bydirection("up", client.focus)
end, {
    description = "Swap client with top one",
    group = "client"
}), awful.key({modkey, "Control"}, "j", function()
    awful.client.swap.bydirection("up", client.focus)
end, {
    description = "Swap client with top one",
    group = "client"
}), awful.key({modkey, "Control"}, "Down", function()
    awful.client.swap.bydirection("down", client.focus)
end, {
    description = "Swap client with bottom one",
    group = "client"
}), awful.key({modkey, "Control"}, "k", function()
    awful.client.swap.bydirection("down", client.focus)
end, {
    description = "Swap client with bottom one",
    group = "client"
}), awful.key({modkey, "Control"}, "Right", function()
    awful.client.swap.bydirection("right", client.focus)
end, {
    description = "Swap client with right one",
    group = "client"
}), awful.key({modkey, "Control"}, "l", function()
    awful.client.swap.bydirection("right", client.focus)
end, {
    description = "Swap client with right one",
    group = "client"
}), awful.key({modkey}, "space", function()
    awful.layout.inc(1)
end, {
    description = "Change layout",
    group = "client"
}), awful.key({modkey}, "u", function()
    awful.client.urgent:jumpto()
end, {
    description = "Jump to urgent client",
    group = "client"
}), awful.key({modkey, "Control", "Shift"}, "n", function()
    local c = awful.client.restore()
    if c then
        c:emit_signal("request::activate", "key.unminimize", {
            raise = true
        })
    end
end, {
    description = "Restore minimized",
    group = "client"
}), --
-- Move client to prev tag and switch
awful.key({modkey, "Shift"}, "Left", function()
    local t = client.focus and client.focus.first_tag or nil
    if t == nil then
        return
    end
    -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
    local tag = client.focus.screen.tags[(t.index - 2) % 5 + 1]
    awful.client.movetotag(tag)
    awful.tag.viewprev()
end, {
    description = "Move client to prev tag and switch",
    group = "client"
}), --
-- Move client to next tag and switch
awful.key({modkey, "Shift"}, "Right", function()
    -- get current tag
    local t = client.focus and client.focus.first_tag or nil
    if t == nil then
        return
    end
    -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
    local tag = client.focus.screen.tags[(t.index % 5) + 1]
    awful.client.movetotag(tag)
    awful.tag.viewnext()
end, {
    description = "Move client to next tag and switch",
    group = "client"
}), --
-- Awesome -----------------------------------------------------
awful.key({modkey, "Shift"}, "x", function()
    awful.spawn("systemctl suspend")
end, {
    description = "Suspend pc",
    group = "awesome"
}), awful.key({modkey, "Control"}, "r", awesome.restart, {
    description = "Reload awesome",
    group = "awesome"
}), awful.key({modkey, "Shift", "Control"}, "c", awesome.quit, {
    description = "Quit awesome",
    group = "awesome"
}), awful.key({modkey}, "x", function()
    awful.prompt.run {
        prompt = "Run Lua code: ",
        textbox = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
    }
end, {
    description = "lua execute prompt",
    group = "awesome"
}), awful.key({modkey, "Control"}, "s", hotkeys_popup.show_help, {
    description = "Show help",
    group = "awesome"
}), --
-- Screen -----------------------------------------------------
awful.key({modkey}, ",", function()
    awful.screen.focus_relative(1)
end, {
    description = "Toggle focused screen",
    group = "screen"
}), awful.key({modkey}, "l", function()
    naughty.notify {
        title = "Locking screen",
        text = "Locking screen in 5 seconds",
        timeout = 5,
        position = "top_middle"
    }
    awful.spawn("lock")
end, {
    description = "Lock screen",
    group = "screen"
}), awful.key({modkey, "Shift"}, "l", function()
    awful.spawn("qlock")
end, {
    description = "Quickly lock screen",
    group = "screen"
}), awful.key({modkey, "Shift"}, "s", function()
    awful.spawn("flameshot gui")
end, {
    description = "Region screenshot using flameshot's GUI",
    group = "screen"
}), awful.key({}, "Print", function()
    awful.spawn("flameshot gui")
end, {
    description = "Region screenshot using flameshot's GUI",
    group = "screen"
}), awful.key({modkey}, "Print", function()
    awful.spawn("flameshot full")
end, {
    description = "Screenshot the full desktop",
    group = "screen"
}), --
-- Music controls -----------------------------------------------------
awful.key({}, "XF86AudioPlay", function()
    awful.util.spawn(vars.spotify_control .. "PlayPause", false)
end, {
    description = "Play/Pause - Spotify",
    group = "media"
}), awful.key({}, "XF86AudioNext", function()
    awful.util.spawn(vars.spotify_control .. "Next", false)
end, {
    description = "Next song - Spotify",
    group = "media"
}), awful.key({}, "XF86AudioPrev", function()
    awful.util.spawn(vars.spotify_control .. "Previous", false)
end, {
    description = "Prev song - Spotify",
    group = "media"
}), awful.key({}, "XF86AudioStop", function()
    awful.util.spawn(vars.spotify_control .. "Stop", false)
end, {
    description = "Stop playback - Spotify",
    group = "media"
}), --
-- Brightness -----------------------------------------------------
awful.key({}, "XF86MonBrightnessUp", function()
    awful.spawn("light -A 5")
end), awful.key({}, "XF86MonBrightnessDown", function()
    awful.spawn("light -U 5")
end) --
)

-- Bind all key numbers to tags.
for i = 1, 5 do
    globalkeys = gears.table.join(globalkeys, awful.key({modkey}, "#" .. i + 5, function() -- View tag.
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            tag:view_only()
        end
    end, {
        description = "View tag #" .. i,
        group = "tag"
    }), awful.key({modkey, "Shift"}, "#" .. i + 5, function() -- Move client to tag.
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:move_to_tag(tag)
                tag:view_only()
            end
        end
    end, {
        description = "Move client to tag #" .. i,
        group = "tag"
    }))
end

keys.clientkeys = gears.table.join( -- Keys that work directly with clients
awful.key({modkey, "Control"}, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
end, {
    description = "Toggle fullscreen",
    group = "client"
}), awful.key({modkey, "Shift"}, "q", function(c)
    c:kill()
end, {
    description = "Close client",
    group = "client"
}), awful.key({modkey, "Control"}, "space", function(c) -- Center and raise floating windows if there is more than one
    awful.client.floating.toggle(c)
    awful.placement.centered(c, nil)
    c:raise()
end, {
    description = "Toggle floating",
    group = "client"
}), awful.key({modkey, "Shift"}, ",", function(c)
    c:move_to_screen()
end, {
    description = "Toggle screen",
    group = "client"
}), awful.key({modkey, "Shift"}, "t", function(c)
    c.ontop = not c.ontop
end, {
    description = "toggle keep on top",
    group = "client"
}), awful.key({modkey, "Shift"}, "c", function(c)
    awful.placement.centered(c, nil)
end, {
    description = "Center floating window",
    group = "client"
}), awful.key({modkey, "Control"}, "n", function(c)
    c.minimized = true
end, {
    description = "minimize",
    group = "client"
}), awful.key({modkey, "Control"}, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
end, {
    description = "(un)maximize",
    group = "client"
}))

-- Mouse + Keyboard
keys.clientbuttons = gears.table.join(awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", {
        raise = true
    })
end), awful.button({modkey}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", {
        raise = true
    })
    awful.mouse.client.move(c)
end), awful.button({modkey}, 2, function(c)
    c:emit_signal("request::activate", "mouse_click", {
        raise = true
    })
    awful.mouse.client.resize(c)
end))

return keys
