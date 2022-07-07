local awful = require("awful")

awful.ewmh.add_activate_filter(function(c)
    if c.class == {"spotify", "Spotify"} then return false end
end, "ewmh")
