-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

-- Current context indent blankline color
vim.cmd[[highlight IndentBlanklineContextChar guifg=#5E81AC gui=nocombine]]

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
        'NvimTree',
        'dashboard',
        'startify'
    },
    buftype_exclude = {
        'terminal',
        'nofile',
        'help'
    },
    use_treesitter = true,
    char_highlight = 'LineNr',
    show_trailing_blankline_indent = false,
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
}
