-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.automatically_reload_config = true
config.enable_tab_bar = false

config.color_scheme = "Night Owl (Gogh)"

config.font = wezterm.font("Comic Mono")
config.font_size = 14

return config
