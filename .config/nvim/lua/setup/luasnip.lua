-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: LuaSnip
-- https://github.com/L3MON4D3/LuaSnip

local ls = require("luasnip")

ls.config.set_config({
    history = false,
    updateevents = "TextChanged,TextChangedI",
    region_check_events = "CursorMoved",
})

-- Friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()
