local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

separators = {}

separators.separator = wibox.widget {
    widget = wibox.widget.separator,
    orientation = "horizontal",
    forced_width = 30,
    color = beautiful.separator,
    shape = gears.shape.powerline
}

separators.empty = wibox.widget {
    widget = wibox.widget.separator,
    orientation = "horizontal",
    forced_width = 10,
    color = beautiful.bg_normal
}

separators.flex = wibox.widget {
    widget = wibox.widget.separator,
    orientation = "horizontal",
    color = beautiful.bg_normal,
    layout = wibox.layout.flex.horizontal
}

separators.reverse = wibox.widget {
    widget = wibox.widget.separator,
    orientation = "horizontal",
    forced_width = 30,
    span_ratio = 0.7,
    color = beautiful.separator,
    set_shape = function(cr, width, height)
        gears.shape.powerline(cr, width, height, (height / 2) * (-1))
    end
}

return separators
