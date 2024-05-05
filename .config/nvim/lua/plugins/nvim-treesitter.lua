-----------------------------------------------------------
-- Syntax analyzer configuration file
-----------------------------------------------------------

-- PLugin: nvim-treesitter

-- https://github.com/nvim-treesitter/nvim-treesitter

local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
	return
end

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
	autotag = {
		enable = true,
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
