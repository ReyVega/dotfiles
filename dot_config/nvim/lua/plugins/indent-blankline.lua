-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim


require('indent_blankline').setup {
    char = "▏",
    show_first_indent_level = true,
    filetype_exclude = {
        'help',
        'lspinfo',
        'lsp-installer',
        'terminal',
        'alpha',
        'packer',
    },
    buftype_exclude = {
        'terminal',
    },
}
