-----------------------------------------------------------
-- Colorizer plugin
-----------------------------------------------------------

-- Plugin: nvim-colorizer

-- https://github.com/norcalli/nvim-colorizer.lua

local colorizer_ok, colorizer = pcall(require, "colorizer")
if not colorizer_ok then
    return
end

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
