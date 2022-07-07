---------------------------
-- Appu awesome theme --
---------------------------
-- local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local shape = require("gears.shape")
local theme_path = "/home/appu/.config/awesome/theme/"
local wallpaper_path = "/home/appu/Pictures/backgrounds/Mountains/anna-scarfiello-Pxf5syDVuxQ-unsplash.jpg"

local theme = {}
local t = theme

-- Some colors - Tomorrow night
t.background = "#1d1f21"
t.current_line = "#282a2e"
t.selection = "#373b41"
t.foreground = "#c5c8c6"
t.comment = "#969896"
t.red = "#cc6666"
t.orange = "#de935f"
t.yellow = "#f0c674"
t.green = "#b5bd68"
t.aqua = "#8abeb7"
t.blue = "#81a2be"
t.purple = "#b294bb"

t.font = "Fira Sans 9"
t.font_mono = "Fira Mono 9"
t.font_big = "Fira Mono 12"
t.emoji_font = "NotoEmoji Nerd Font"

local tagshape = function(cr, width, height)
    shape.powerline(cr, width, height)
end
local ntf_shape = function(cr, width, height)
    shape.partially_rounded_rect(cr, width, height, true, false, true, true, 18)
end

t.bg_normal = t.background
t.bg_focus = t.blue
t.bg_urgent = t.red
t.bg_minimize = t.current_line
t.bg_systray = t.bg_normal

t.fg_normal = t.foreground
t.fg_focus = t.background
t.fg_urgent = t.foreground
t.fg_minimize = t.comment

-- Generic
t.useless_gap = dpi(2)
t.border_width = dpi(2)
t.border_normal = t.current_line
t.border_focus = t.blue
t.border_marked = t.orange

t.separator = t.blue

-- Taglist
t.taglist_shape = tagshape
t.taglist_shape_focus = tagshape
t.taglist_shape_border_width = dpi(2)
t.taglist_shape_border_color = t.separator
t.taglist_bg_focus = t.bg_focus
t.taglist_fg_focus = t.fg_focus
t.taglist_shape_border_color_urgent = t.red
t.taglist_font = t.font_mono

-- Tasklist
t.tasklist_bg_normal = t.selection

-- Notifications
t.notification_opacity = 0.9
t.notification_fg = t.fg_normal
t.notification_bg = t.bg_normal
t.notification_border_color = t.red
t.notification_border_width = dpi(2)
t.notification_margin = dpi(4)
t.notification_icon_size = dpi(64)
t.notification_max_width = dpi(600)
t.notification_shape = ntf_shape

-- -- Menu
-- t.menu_submenu_icon                     = theme_path .. "submenu.png"
-- t.menu_height                           = dpi(45)
-- t.menu_width                            = dpi(100)

-- Wibar
t.wibar_bg = t.background

-- Client modifications
t.maximized_hide_border = false
t.fullscreen_hide_border = true
t.master_width_factor = 0.5

-- Wallpaper
t.wallpaper = wallpaper_path

-- Layout images
-- t.layout_fairh                          = theme_path .. "icons/fairh.png"
t.layout_fairv = theme_path .. "icons/fair.png"
t.layout_floating = theme_path .. "icons/floating.png"
-- t.layout_magnifier                      = theme_path .. "icons/magnifier.png"
t.layout_max = theme_path .. "icons/max.png"
-- t.layout_fullscreen                     = theme_path .. "icons/fullscreen.png"
-- t.layout_tilebottom                     = theme_path .. "icons/tilebottom.png"
-- t.layout_tileleft                       = theme_path .. "icons/tileleft.png"
t.layout_tile = theme_path .. "icons/tile.png"
-- t.layout_tiletop                        = theme_path .. "icons/tiletop.png"
-- t.layout_spiral                         = theme_path .. "icons/spiral.png"
-- t.layout_dwindle                        = theme_path .. "icons/dwindle.png"
-- t.layout_cornernw                       = theme_path .. "icons/cornernw.png"
t.layout_cornerne = theme_path .. "icons/cornerne.png"
-- t.layout_cornersw                       = theme_path .. "icons/cornersw.png"
-- t.layout_cornerse                       = theme_path .. "icons/cornerse.png"

-- -- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(
--     theme.menu_height, theme.bg_normal, theme.fg_normal
-- )

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
t.icon_theme = "Papirus-Dark-Grey"

return t
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
