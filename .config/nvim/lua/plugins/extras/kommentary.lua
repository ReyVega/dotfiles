-----------------------------------------------------------
-- Comments plugin
-----------------------------------------------------------

-- Plugin: kommentary

-- https://github.com/b3nj5m1n/kommentary

return {
	"b3nj5m1n/kommentary",
	config = function()
		local kommentary = require("kommentary.config")
		vim.g.kommentary_create_default_mappings = false

		kommentary.configure_language("default", {
			prefer_single_line_comments = true,
		})

		-----------------------------------------------------------
		-- Keymaps:
		-----------------------------------------------------------
		local key = vim.keymap.set

		-- Comment current line
		key("n", "<leader>k", "<Plug>kommentary_line_default", { desc = "Comment Current Line" })

		-- Comment selected block
		key("x", "<leader>k", "<Plug>kommentary_visual_default<C-c>", { desc = "Comment Selected Lines" })
	end,
}
