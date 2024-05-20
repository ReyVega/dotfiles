-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline

-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local indent = require("ibl")

		-- Current context indent blankline color
		vim.cmd([[highlight IblScope guifg=#5E81AC gui=nocombine]])

		indent.setup({
			enabled = true,
			indent = {
				char = "▏",
				smart_indent_cap = true,
				highlight = "IblIndent",
			},
			whitespace = {
				remove_blankline_trail = true,
				highlight = "IblWhitespace",
			},
			scope = {
				enabled = true,
				char = "▏",
				show_start = false,
				show_end = false,
				injected_languages = true,
				highlight = "IblScope",
				include = {
					node_type = {
						["*"] = { "*" },
					},
				},
			},
			exclude = {
				filetypes = {
					"help",
					"lspinfo",
					"lsp-installer",
					"terminal",
					"alpha",
					"packer",
					"NvimTree",
					"dashboard",
					"startify",
				},
				buftypes = {
					"terminal",
					"nofile",
					"help",
				},
			},
		})
	end,
}
