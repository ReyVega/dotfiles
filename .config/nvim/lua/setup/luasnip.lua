-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: LuaSnip
-- https://github.com/L3MON4D3/LuaSnip

local ls = require("luasnip")

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})

-- Friendly snippets
require("luasnip.loaders.from_vscode").load()
