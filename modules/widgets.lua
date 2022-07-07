local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local wibox = require("wibox")

local battery = require("modules.widget-battery")

local widgets = {}

-- Keyboard map indicator and switcher
widgets.keyboard_layout = awful.widget.keyboardlayout()

-- Textclock and calendar
widgets.mytextclock = wibox.widget {
    widget = wibox.widget.textclock,
    format = " %a %d %b@%H:%M:%S ",
    refresh = 1,
    font = beautiful.font_mono
}
widgets.calendarwidget = lain.widget.cal({
    followtag = true,
    week_number = "left",
    attach_to = {widgets.mytextclock},
    notification_preset = {
        font = beautiful.font_mono,
        fg = beautiful.fg_focus,
        bg = beautiful.bg_focus,
        border_color = beautiful.separator,
        position = "top_right"
    }
})

widgets.battery_widget = battery {
    ac_prefix = "",
    battery_prefix = "",
    listen = true,
    widget_font = beautiful.font_mono,
    percent_colors = {{30, "red"}, {100, "white"}}
}

return widgets
