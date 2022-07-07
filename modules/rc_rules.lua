local awful = require("awful")
local beautiful = require("beautiful")
local keys = require("modules.rc_keys")

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {{ --
    rule = {}, -- All clients will match this rule.
    properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = keys.clientkeys,
        buttons = keys.clientbuttons,
        screen = awful.screen.preferred,
        titlebars_enabled = false,
        placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen
    }
}, { -- Floating clients.
    rule_any = {
        instance = {"DTA", "copyq", "pinentry"},
        class = {"Arandr", "Blueman-manager", "Gpick", "Kruler", "MessageWin", "Sxiv", "Tor Browser", "Wpa_gui",
                 "veromix", "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {"Event Tester" -- xev.
        },
        role = {"AlarmWindow", -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
        }
    },
    properties = {
        floating = true
    }
}, { -- Add titlebars to normal clients and dialogs
    rule_any = {
        type = {"dialog"} -- It included "normal" too
    },
    properties = {
        titlebars_enabled = true
    }
}, {
    rule_any = {
        class = {"Rustdesk"}
    },
    properties = {
        floating = true
    }
}}
