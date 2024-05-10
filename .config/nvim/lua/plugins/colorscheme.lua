-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- Default theme

return {
	"rmehri01/onenord.nvim",
	name = "onenord",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme onenord]])
	end,
}
