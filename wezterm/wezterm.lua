-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
local handle = io.popen("ls /Users/ugyuji/wezterm_background_images/")
local result = handle:read("*a")
handle:close()

local background_files = {}
for file in result:gmatch("[^\r\n]+") do
	table.insert(background_files, "/Users/ugyuji/wezterm_background_images/" .. file)
end

local selected_background_file = background_files[math.random(#background_files)]

config.enable_scroll_bar = true
config.color_scheme = "Catppuccin Mocha"
config.hide_tab_bar_if_only_one_tab = true
-- config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 14.0
config.line_height = 1.1
config.background = {
	{
		source = {
			File = selected_background_file,
		},
		hsb = {
			hue = 1.0,
			saturation = 1.0,
			brightness = 0.02,
		},
		vertical_align = "Middle",
		horizontal_align = "Center",
	},
}

-- and finally, return the configuration to wezterm
return config
