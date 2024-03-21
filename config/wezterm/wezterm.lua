local wezterm = require 'wezterm';
local act = wezterm.action
local modsKey = "CTRL|SHIFT"

return {
	-- font
	font = wezterm.font_with_fallback({
		{ family="PlemolJP Console NF", weight="Medium" },
		{ family="NotoSansMono CJK SC" },
		{ family="NotoSansMono CJK JP" },
		{ family="IPAmjMincho" }
	}),
	font_size = 10.5,
	-- font_size = 15,
	color_scheme = 'nightfox',

	-- padding
	window_padding = {
		left = 2,
		right = 2,
		top = 2,
		bottom = 2
	},

	window_background_opacity = 0.8,

	-- tab
	use_fancy_tab_bar = false,
	colors = {
		cursor_bg= "#c6c8d1",
		tab_bar = {
			background = "#282d3e",

			active_tab = {
				bg_color = "#444b71",
				fg_color = "#c6c8d1",
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},

			inactive_tab = {
				bg_color = "#282d3e",
				fg_color = "#c6c8d1",
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},

			inactive_tab_hover = {
				bg_color = "#1b1f2f",
				fg_color = "#c6c8d1",
				intensity = "Normal",
				underline = "None",
				italic = true,
				strikethrough = false,
			},

			new_tab = {
				bg_color = "#1b1f2f",
				fg_color = "#c6c8d1",
				italic = false
			},

			new_tab_hover = {
				bg_color = "#444b71",
				fg_color = "#c6c8d1",
				italic = false
			},
		}
	},
	hide_tab_bar_if_only_one_tab = true,

	enable_kitty_graphics=true,

	--title
	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		return {
			{Text=" " .. tab.active_pane.title .. " "},
		}
	end),

	-- keymap
	keys = {
		-- Clipboard
		{ key = "v", mods = modsKey, action = act{PasteFrom = "Clipboard"} },
		{ key = "c", mods = modsKey, action = act{CopyTo = "Clipboard"} },

		-- Search
		{ key = "f", mods = modsKey, action = act.Search("CurrentSelectionOrEmptyString") },

		-- Tab
		{ key = "<", mods = modsKey, action = act{ActivateTabRelative = -1} },
		{ key = ">", mods = modsKey, action = act{ActivateTabRelative = 1} },

		-- Pane
		{ key = "|", mods = modsKey, action = act.SplitPane{  direction = 'Right', size = { Percent = 50 }}},
		{ key = "=", mods = modsKey, action = act.SplitPane{  direction = 'Down', size = { Percent = 50 }}},
		{ key = "?", mods = modsKey, action = act.PaneSelect},

		-- Page Scroll
		{ key = "UpArrow", mods = modsKey, action = act{ScrollByPage = -0.5} },
		{ key = "DownArrow", mods = modsKey, action = act{ScrollByPage = 0.5} },
	},
}
