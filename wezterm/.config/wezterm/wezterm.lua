local wezterm = require ("wezterm")
local mux = wezterm.mux 
local constants = require ("constants")
local config = wezterm.config_builder()

-- font settings
config.font_size = 16
config.font = wezterm.font("FiraCode Nerd Font Mono")

-- Colours
config.colors = {
    cursor_bg = 'white',
    cursor_border = 'white',
}

-- Appearance
config.window_decorations = 'TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW'
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
config.prefer_egl = true

wezterm.on('gui-startup', function()
    local tab, pane, window = mux.spawn_window{}
    window:gui_window():maximize()
end)

return config

