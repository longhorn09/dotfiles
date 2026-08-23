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

-- Color & Theme
config.color_scheme = 'Catppuccin Mocha' -- Built-in scheme
--config.color_scheme = 'Tokyo Night' -- Built-in scheme


-- Typography
config.font = wezterm.font_with_fallback({
  { family = 'JetBrains Mono', weight = 'Medium' },
  'Nerd Font Symbols Only',
})
--config.font = wezterm.font("DankMono Nerd Font")
config.font_size = 11.0
config.harfbuzz_features = { 'calt', 'liga', 'dlig' } -- Enable ligatures

-- Window Styling
config.window_decorations = "RESIZE" -- Removes native OS title bar
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20 -- macOS blur effect
config.win32_system_backdrop = 'Mica'    -- Windows 11 blur effect

-- Padding
config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}

return config
