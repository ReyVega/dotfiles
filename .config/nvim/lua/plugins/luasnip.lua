-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: LuaSnip

-- https://github.com/L3MON4D3/LuaSnip


local luasnip_ok, ls = pcall(require, 'luasnip')
if not luasnip_ok then return end

local friendly_snippets_ok, friendly_snippets = pcall(require, 'luasnip.loaders.from_vscode')
if not friendly_snippets_ok then return end

ls.config.set_config({
    history = false,
    updateevents = "TextChanged,TextChangedI",
    region_check_events = "CursorMoved",
})

-- Friendly snippets
friendly_snippets.lazy_load()
