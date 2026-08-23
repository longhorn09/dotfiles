local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Force X11 window backend to prevent Wayland fractional scaling crash
config.front_end = "WebGpu" 
config.enable_wayland = false

return config
