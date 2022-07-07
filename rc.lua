-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ━┏━━━┓━━━━━━━━━━━━┏┓━━━━━━━━┏━━━┓━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ━┃┏━┓┃━━━━━━━━━━━━┃┃━━━━━━━━┃┏━┓┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ━┃┃━┃┃┏━━┓┏━━┓┏┓┏┓┗┛┏━━┓━━━━┃┃━┃┃┏┓┏┓┏┓┏━━┓┏━━┓┏━━┓┏┓┏┓┏━━┓━━━━┏━┓┏━━┓━
-- ━┃┗━┛┃┃┏┓┃┃┏┓┃┃┃┃┃━━┃ ━┫━━━━┃┗━┛┃┃┗┛┗┛┃┃┏┓┃┃━━┫┃┏┓┃┃┗┛┃┃┏┓┃━━━━┃┏┛┃┏━┛━
-- ━┃┏━┓┃┃┗┛┃┃┗┛┃┃┗┛┃━━┣━ ┃━━━━┃┏━┓┃┗┓┏┓┏┛┃┗━┫┣━━┃┃┗┛┃┃┃┃┃┃┗━┫━━━━┃┃━┃┗━┓━
-- ━┗┛━┗┛┃┏━┛┃┏━┛┗━━┛━━┗━━┛━━━━┗┛━┗┛━┗┛┗┛━┗━━┛┗━━┛┗━━┛┗┻┻┛┗━━┛━━━━┗┛━┗━━┛━
-- ━━━━━━┃┃━━┃┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ━━━━━━┗┛━━┗┛━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━ Horizon @ texteditor.com/multiline-text-art━
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
--
-- Find LuaRocks packages if installed
pcall(require, "luarocks.loader")

-- Awesome libraries
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Setup second monitor
awful.spawn.with_shell("second_monitor &")

-- Set theme
beautiful.init("~/.config/awesome/theme/theme.lua")

-- Set notification defaults
naughty.config.defaults.position = "bottom_right"

-- My imports
require("modules.rc_error_handling")
require("modules.rc_autostart")
require("modules.rc_ewmh")
local keys = require("modules.rc_keys")
require("modules.rc_rules")
require("modules.rc_signals")
require("modules.rc_wibar")

-- Set keys
root.keys(keys.globalkeys)

-- Other modules
-- local spotify = require("modules.spotify")

naughty.notify({
    title = "rc.lua loaded!",
    text = "The whole config file has been ran",
    timeout = 3,
    position = "top_middle"
})
