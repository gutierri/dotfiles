---------------------------------
--   Hey awesome theme         --
--   Modify xresources theme   --
---------------------------------

local theme = dofile("/usr/share/awesome/themes/xresources/theme.lua")

theme.folder        = os.getenv("HOME") .. "/.config/awesome/themes/hey/"

theme.bg_focus     = "#000000"
theme.bg_minimize  = theme.bg_normal
theme.fg_minimize  = "#AFAFAF"
theme.fg_normal    = "#000000"

theme.font          = "lucy tewii 8"
theme.tasklist_disable_icon = true

theme.wallpaper = theme.folder .. "wall.jpg"

theme.icon_theme = nil
theme.systray_icon_spacing = 8

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
