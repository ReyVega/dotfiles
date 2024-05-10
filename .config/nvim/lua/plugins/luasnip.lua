-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: LuaSnip

-- https://github.com/L3MON4D3/LuaSnip

return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")
		local friendly_snippets = require("luasnip.loaders.from_vscode")

		ls.config.set_config({
			history = false,
			updateevents = "TextChanged,TextChangedI",
			region_check_events = "CursorMoved",
		})

		-- enable html snippets in javascript/javascript(REACT)
		ls.filetype_extend("javascriptreact", { "html" })
		ls.filetype_extend("typescriptreact", { "html" })

		-- enable html snippets in Django (htmldjango)
		ls.filetype_extend("htmldjango", { "html" })

		-- Friendly snippets
		friendly_snippets.lazy_load()
	end,
}
