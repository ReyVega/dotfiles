-----------------------------------------------------------
-- TS autotag config
-----------------------------------------------------------

-- Plugin: nvim-ts-autotag
-- https://github.com/windwp/nvim-ts-autotag

require('nvim-ts-autotag').setup({
    filetypes = {
        'html',
        'javascript',
        'javascriptreact',
        'typescriptreact',
        'svelte',
        'vue',
    },
})
