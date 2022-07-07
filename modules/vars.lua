-- Variables
local vars = {}

-- Default modkey.
vars.modkey = "Mod4"

-- Key-related
vars.terminal = "kitty"
vars.editor = os.getenv("EDITOR") or "nvim"
vars.editor = "nvim"
vars.cmd_editor = vars.terminal .. " -e " .. vars.editor
vars.cmd_browser = "firefox"
vars.cmd_spotify = "spotify"
vars.cmd_file_explorer = "thunar"
vars.cmd_discord = "discord"
vars.cmd_screenshot = "flameshot gui"
vars.cmd_rofi = "rofi -show run"
vars.cmd_rofi_combi = "rofi -show combi"
vars.cmd_rofi_filebrowser = "rofi -show filebrowser -modi filebrowser"
vars.cmd_rofi_code =
    "ls /home/appu/Code | rofi -dmenu -p 'repo' -i -window-title Code | xargs printf '/home/appu/Code/%s' | xargs -r code"

vars.spotify_control =
    "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player."

-- Tags
vars.tags = {{"|", "||", "|||", "|\\/", "\\/"}, {"I", "II", "III", "IV", "V"}}

return vars
