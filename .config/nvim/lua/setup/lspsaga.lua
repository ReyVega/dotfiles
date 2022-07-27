-----------------------------------------------------------
-- LSPSaga configuration file
-----------------------------------------------------------

-- Plugin: lspsaga
-- https://github.com/glepnir/lspsaga.nvim

local saga = require("lspsaga")


saga.init_lsp_saga({
    border_style = "rounded",
    saga_winblend = 0,
    move_in_saga = { prev = '<C-p>',next = '<C-n>'},
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    show_diagnostic_source = true,
    diagnostic_source_bracket = {},
    code_action_icon = "  ",
    code_action_num_shortcut = true,
    code_action_lightbulb = {
        enable = false,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_icons = {
        def = '  ',
        ref = '諭 ',
        link = '  ',
    },
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_quit = "<C-c>",
    definition_preview_icon = "  ",
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' ',
        show_file = true,
        click_support = false,
    },
    show_outline = {
        win_position = 'right',
        left_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
    },
    server_filetype_map = {},
})
