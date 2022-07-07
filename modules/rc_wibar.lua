local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")
-- My modules
local widgets = require("modules.widgets")
local separators = require("modules.separators")
local vars = require("modules.vars")

awful.layout.layouts = { -- Ordered layout list
awful.layout.suit.floating, -- Floating
awful.layout.suit.tile, -- Tile right
-- awful.layout.suit.tile.left, -- Tile left
-- awful.layout.suit.tile.bottom, -- Tile bottom
-- awful.layout.suit.tile.top, -- Tile top
-- awful.layout.suit.fair, -- Equal number in 2 cols
-- awful.layout.suit.fair.horizontal, -- Equal number in 2 rows
-- awful.layout.suit.spiral, -- Spiral?
-- awful.layout.suit.spiral.dwindle, --Spiral?
awful.layout.suit.max, -- Maximized
-- awful.layout.suit.max.fullscreen, -- Maximized fullscreen
-- awful.layout.suit.magnifier, -- Magnifier?
-- awful.layout.suit.corner.nw, -- Biggest on NW
awful.layout.suit.corner.ne -- Biggest on NE
-- awful.layout.suit.corner.sw, -- Biggest on SW
-- awful.layout.suit.corner.se, -- Biggest on SE
}

-- Wallpaper painter
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, false)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Tags
    if s.geometry["width"] == 2560 or screen.count() == 1 then
        awful.tag(vars.tags[2], s, awful.layout.suit.tile)
    else
        awful.tag(vars.tags[1], s, awful.layout.suit.tile)
    end

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(awful.button({}, 1, function()
        awful.layout.inc(1)
    end), awful.button({}, 3, function()
        awful.layout.inc(-1)
    end), awful.button({}, 4, function()
        awful.layout.inc(1)
    end), awful.button({}, 5, function()
        awful.layout.inc(-1)
    end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {
            shape = gears.shape.powerline
        },
        layout = {
            spacing = -12,
            spacing_widget = {
                color = beautiful.bg_normal,
                shape = gears.shape.powerline,
                widget = wibox.widget.separator
            },
            layout = wibox.layout.flex.horizontal,
            forced_width = dpi(250)
        },
        widget_template = {
            {
                {
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox
                    },
                    layout = wibox.layout.flex.horizontal
                },
                left = 20,
                right = 16,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        },
        buttons = gears.table.join(awful.button({}, 1, function(t)
            t:view_only()
        end), awful.button({modkey}, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end), awful.button({}, 3, awful.tag.viewtoggle), awful.button({modkey}, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end), awful.button({}, 4, function(t)
            awful.tag.viewprev(t.screen)
        end), awful.button({}, 5, function(t)
            awful.tag.viewnext(t.screen)
        end))
    }

    -- create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        style = {
            shape = gears.shape.powerline
        },
        layout = {
            spacing = -10,
            spacing_widget = {
                color = beautiful.bg_normal,
                shape = gears.shape.powerline,
                widget = wibox.widget.separator
            },
            -- forced_width = taglist_width * 5,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id = "icon_role",
                            widget = wibox.widget.imagebox
                        },
                        margins = 2,
                        widget = wibox.container.margin
                    },
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox
                    },
                    layout = wibox.layout.fixed.horizontal
                },
                left = 14,
                right = 18,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        },
        buttons = gears.table.join(awful.button({}, 1, function(c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal("request::activate", "tasklist", {
                    raise = true
                })
            end
        end), awful.button({}, 2, function(c)
            c:kill()
        end), awful.button({}, 3, function()
            awful.menu.client_list({
                theme = {
                    width = 250
                }
            })
        end), awful.button({}, 4, function()
            awful.client.focus.byidx(1)
        end), awful.button({}, 5, function()
            awful.client.focus.byidx(-1)
        end))
    }

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s
    })

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- awesome_launcher,
            s.mylayoutbox,
            separators.separator,
            s.mytaglist,
            s.mypromptbox
        },
        {
            layout = wibox.layout.align.horizontal,
            separators.separator,
            s.mytasklist,
            separators.flex
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            separators.reverse,
            wibox.widget.systray(),
            widgets.battery_widget,
            -- widgets.systray,
            widgets.keyboard_layout,
            separators.reverse,
            widgets.mytextclock,
            separators.reverse
        }
    }
end)

