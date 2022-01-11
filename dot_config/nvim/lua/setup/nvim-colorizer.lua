-----------------------------------------------------------
-- Colorizer plugin
-----------------------------------------------------------

-- Plugin: nvim-colorizer
-- https://github.com/norcalli/nvim-colorizer.lua

require('colorizer').setup({
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'vim',
    'dart',
    'python',
    '*',
}, {mode = 'background', names = true, css = true, css_fn = true})
