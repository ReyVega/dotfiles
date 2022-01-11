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
    use_treesitter = true,
    char_highlight = 'LineNr',
    show_trailing_blankline_indent = false,
    show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = false,
	show_current_context_start = false,
}
