--[[
    _   _      _ ___        ____  __     ____             __ _       
   | | | | ___| | \ \      / /  \/  |   / ___|___  _ __  / _(_) __ _ 
   | |_| |/ _ \ | |\ \ /\ / /| |\/| |  | |   / _ \| '_ \| |_| |/ _` |
   |  _  |  __/ | | \ V  V / | |  | |  | |__| (_) | | | |  _| | (_| |
   |_| |_|\___|_|_|  \_/\_/  |_|  |_|   \____\___/|_| |_|_| |_|\__, |
                                                               |___/ 
]]

MAIN_MOD = "Super_L"
TERMINAL = "alacritty"
BROWSER = "firefox"
LAUNCHER = "rofi"
BAR = "waybar"
WALLPAPER_DAEMON = "swww init"

DEV = 0

if os.getenv("DEV") == "1" then
    MAIN_MOD = "Alt_L"
    DEV = 1
end

print(MAIN_MOD)

-- Monitor Settings
monitor(
    "DP-1", -- name
    true,   -- enabled
    2560,   -- width
    1440,   -- height
    120,    -- hz
    1,      -- adaptive sync enabled
    1,      -- scale
    0       -- transfrom
    )
monitor("LVDS-1", true, 1920, 1080, 60, 0, 1, 0)


-- Keyboard Settings
keyboard(
    "Power Button", -- name
    "jp",           -- layout
    59,             -- rate
    221             -- delay
    )
keyboard("default", "pl", 51, 205)
keyboard("Sleep Button", "de", 61, 184)
keyboard("ckb1: CORSAIR K68 RGB Mechanical Gaming Keyboard vKB", "pl", 50, 200)


-- Keybindings
    
bind(
    MAIN_MOD .. ", b",     -- keys
    "firefox"              -- program name
    )
bind(MAIN_MOD .. ", w", "wallset")                  -- wallpaper script
bind(MAIN_MOD .. ", g", "rofmoji")                  -- emoji
bind(MAIN_MOD .. ", Shift_L, G", "kaomoji_select")  -- kaomoji
bind(MAIN_MOD .. ", Return", TERMINAL)              -- terminal
bind(MAIN_MOD .. ", t", LAUNCHER .. " -show drun")

bind(MAIN_MOD .. ", F1", "wallset toggle")
bind(MAIN_MOD .. ", F2", "waybar_reset toggle")
bind(MAIN_MOD .. ", F11", "grim")
bind(MAIN_MOD .. ", F12", "pavucontrol")

    -- Screen Brightness
bind("Alt_L, XF86AudioRaiseVolume", "brightnessctl s +1%")
bind("Alt_L, XF86AudioLowerVolume", "brightnessctl s 1%-")

    -- Volume Controls
bind("XF86AudioRaiseVolume", "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+")
bind("XF86AudioLowerVolume", "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-")
bind("XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
bind("XF86AudioPlay", "playerctl play-pause")
bind("XF86AudioNext", "playerctl next")
bind("XF86AudioPrev", "playerctl previous")
bind("XF86AudioStop", "playerctl stop")

    -- Screenshots
bind(MAIN_MOD .. ", Shift_L, S", "grim -g \"$(slurp -d)\" - | tee >(swappy -f - -o - | wl-copy) | wl-copy")

--bind("Alt_L, 1", "workspace", 1, false, 0, true)
--bind("Alt_L, 2", "workspace", 2, false, 0, true)
--bind("Alt_L, 3", "workspace", 3, false, 0, true)
--bind("Alt_L, 4", "workspace", 4, false, 0, true)
--bind("Alt_L, 5", "workspace", 5, false, 0, true)
--bind("Alt_L, 6", "workspace", 6, false, 0, true)

bind(
    MAIN_MOD .. ", 1",   -- keys
    "workspace",    -- specify that it is a workspace
    1,              -- workspace number
    false,          -- binary workspaces enabled
    1,              -- binary workspaces value
    false           -- also move active window to this workspace
    )
bind(MAIN_MOD .. ", 2", "workspace", 2, false, 0)
bind(MAIN_MOD .. ", 3", "workspace", 3, false, 0)
bind(MAIN_MOD .. ", 4", "workspace", 4, false, 0)
bind(MAIN_MOD .. ", 5", "workspace", 5, false, 0)
bind(MAIN_MOD .. ", 6", "workspace", 6, false, 0)

-- Binary workspaces
bind(MAIN_MOD .. ", u", "workspace", 1, true, 1)
bind(MAIN_MOD .. ", i", "workspace", 2, true, 2)
bind(MAIN_MOD .. ", o", "workspace", 3, true, 4)
bind(MAIN_MOD .. ", p", "workspace", 4, true, 8)


bind(MAIN_MOD .. ", r", "reload_config")     -- Reload config
bind(MAIN_MOD .. ", n", "focus_next")        -- Focus next Window
bind(MAIN_MOD .. ", f", "set_fullscreen")    -- Fullscreens active toplevel

bind(MAIN_MOD .. ", q", "kill_active")       -- Kill Active Window
bind(MAIN_MOD .. ", Escape", "kill_server")  -- Kill HellWM

bind(MAIN_MOD .. ", s", "switch_toplevels")  -- Switch toplevels (alt tab on windows)

-- Set environment variables
env("EDITOR", "nvim")
env("BROWSER ", "firefox")

env("QT_QPA_PLATFORM", "wayland")
env("XDG_SESSION_TYPE", "wayland")

env("QT_STYLE_OVERRIDE", "kvantum")
env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

env("XCURSOR_SIZE", "24")
env("MOZ_ENABLE_WAYLAND", "1")

env("XDG_CURRENT_DESKTOP", "hellwm")
env("XDG_SESSION_DESKTOP", "hellwm")
env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Exec daemons etc.
exec(WALLPAPER_DAEMON)
exec(BAR)
exec(TERMINAL)

-- Tiling layout -- no matter what only 'dwindle' for now on
layout(3)

-- Decoration
border_width(3)
inner_gap(10)
outer_gap(5)

fade_duration(0)

--animation_duration(1)
animation_duration(0.7)

animation_bezier(0.0, 1.12, 1.28, 1)
--animation_bezier(0, 0.5, 1.25, 1)
--animation_bezier(0.0, 1, 0.5, 1)
--animation_bezier(0.1, 1.12, -0.5, 1) -- Thats funny af, try it :D

    -- Types of animation
animation_direction("right")
--animation_direction("left")
--animation_direction("up")
--animation_direction("down")
--animation_direction("shrink")
--animation_direction("grow")
--animation_direction("solid")

    -- Border colors imported from Hellwal,
    -- so it matches colorscheme
dofile(os.getenv("HOME") .. "/.cache/hellwal/hellwm.lua")
border_inactive_color(color6)
border_active_color(color13)
