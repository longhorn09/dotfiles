local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Force X11 window backend to prevent Wayland fractional scaling crash
config.front_end = "WebGpu" 
config.enable_wayland = false

config.initial_cols = 130  -- Increase this number to make it wider (default is usually 80)
config.initial_rows = 40   -- Adjust height as needed

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Split horizontally (Leader + %)
  {
    key = '%',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Split vertically (Leader + ")
  {
    key = '"',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}
return config
