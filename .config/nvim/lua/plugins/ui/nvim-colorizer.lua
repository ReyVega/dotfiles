-----------------------------------------------------------
-- Colorizer plugin
-----------------------------------------------------------

-- Plugin: nvim-colorizer

-- https://github.com/norcalli/nvim-colorizer.lua

return {
	"norcalli/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		local colorizer = require("colorizer")

		colorizer.setup({
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vim",
			"dart",
			"python",
			"*",
		}, { mode = "background", names = true, css = true, css_fn = true })
	end,
}
