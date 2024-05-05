-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: lualine

-- https://github.com/nvim-lualine/lualine.nvim

local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
	return
end

local colors = {
	color1 = "#ECEFF4",
	color2 = "#81A1C1",
	color3 = "#2E3440",
	color4 = "#B48EAD",
	color5 = "#BF616A",
	color6 = "#A3BE8C",
	color7 = "#212121",
	color8 = "#3B4252",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.color7, bg = colors.color2, gui = "bold" },
		b = { fg = colors.color1, bg = colors.color8 },
		c = { fg = colors.color3, bg = colors.color3 },
	},

	insert = { a = { fg = colors.color7, bg = colors.color6, gui = "bold" } },
	visual = { a = { fg = colors.color7, bg = colors.color4, gui = "bold" } },
	replace = { a = { fg = colors.color7, bg = colors.color5, gui = "bold" } },

	inactive = {
		a = { fg = colors.color1, bg = colors.color3, gui = "bold" },
		b = { fg = colors.color1, bg = colors.color3, gui = "bold" },
		c = { fg = colors.color1, bg = colors.color3, gui = "bold" },
	},
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = bubbles_theme,
		component_separators = "|",
		disabled_filetypes = { "NvimTree", "alpha" },
		section_separators = { left = "", right = "" },
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = { "fugitive", "nvim-tree" },
})
