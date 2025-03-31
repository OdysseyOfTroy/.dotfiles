local wezterm = require ("wezterm")
local constants = require ("constants")
local config = wezterm.config_builder()

-- font settings
config.font = wezterm.font("FiraCode Nerd Font Mono")

-- Colours
config.colors = {
    cursor_bg = 'white',
    cursor_border = 'white',
}

-- Appearance
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.window_background_image = constants.bg_image
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- Misc
config.max_fps = 120

return config

