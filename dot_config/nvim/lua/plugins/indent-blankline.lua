-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim


require('indent_blankline').setup {
    char = "▏",
    show_first_indent_level = false,
    filetype_exclude = {
        'help',
        'git',
        'markdown',
        'lspinfo',
        'terminal',
        'alpha',
    },
    buftype_exclude = {},
}
