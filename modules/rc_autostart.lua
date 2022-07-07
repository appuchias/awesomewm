local awful = require("awful")
local vars = require("modules.vars")
local naughty = require("naughty")

-- My modules
local widgets = require("modules.widgets")
local r = require("modules.runonce")

-- Processes
awful.spawn.with_shell("xautolock -time 20 -locker lock &")
awful.spawn.with_shell("noisetorch -i &")
awful.spawn.with_shell("openrgb -p Huntsman &")
awful.spawn.with_shell("picom --experimental-backends &")
awful.spawn.with_shell("nm-applet &")

-- Set screen idxs
edp = 1 -- Integrated
dp1 = screen.count() -- External monitor if it exists else integrated

-- Applications
awful.spawn.once(vars.cmd_browser, {
    tag = vars.tags[dp1][2]
})
awful.spawn.once(vars.cmd_discord, {
    tag = vars.tags[edp][1]
})
awful.spawn.once(vars.cmd_spotify, {
    tag = vars.tags[edp][2]
})
awful.spawn.once("telegram-desktop", {
    tag = vars.tags[edp][3]
})

-- Setup mouse
awful.spawn.with_shell("mmove &")
awful.spawn.with_shell("mspeed &")

-- Setup keyboard layout
widgets.keyboard_layout:next_layout()
