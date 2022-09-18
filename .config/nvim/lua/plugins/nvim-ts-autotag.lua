-----------------------------------------------------------
-- TS autotag config
-----------------------------------------------------------

-- Plugin: nvim-ts-autotag

-- https://github.com/windwp/nvim-ts-autotag


local autotag_ok, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_ok then return end

autotag.setup({
    filetypes = {
        'html',
        'javascript',
        'javascriptreact',
        'typescriptreact',
        'svelte',
        'vue',
    },
})
