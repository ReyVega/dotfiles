-----------------------------------------------------------
-- Syntax analyzer configuration file
-----------------------------------------------------------

-- PLugin: nvim-treesitter

-- https://github.com/nvim-treesitter/nvim-treesitter

return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = {},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			matchup = {
				enable = true,
			},
			indent = {
				enable = false,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
		})

		vim.cmd([[
            set foldmethod=expr
            set foldexpr=nvim_treesitter#foldexpr()
            set foldlevel=99
        ]])
	end,
}
