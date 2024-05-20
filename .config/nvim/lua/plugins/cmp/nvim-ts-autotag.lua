-----------------------------------------------------------
-- TS autotag config
-----------------------------------------------------------

-- Plugin: nvim-ts-autotag

-- https://github.com/windwp/nvim-ts-autotag

return {
	"windwp/nvim-ts-autotag",
	ft = { "html", "tsx", "vue", "svelte", "php" },
	config = function()
		local autotag = require("nvim-ts-autotag")

		autotag.setup({
			filetypes = {
				"html",
				"javascript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"vue",
			},
		})
	end,
}
