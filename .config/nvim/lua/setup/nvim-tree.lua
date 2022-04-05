-----------------------------------------------------------
-- File explorer configuration file
-----------------------------------------------------------

-- PLugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = ':~'
g.nvim_tree_add_trailing = 0
g.nvim_tree_group_empty = 0
g.nvim_tree_icon_padding = ' '
g.nvim_tree_symlink_arrow = ' >> '
g.nvim_tree_respect_buf_cwd = 0
g.nvim_tree_create_in_closed_folder = 0
g.nvim_tree_special_files = { README = 1, Makefile= 1, MAKEFILE= 1 }

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
       arrow_open = "",
       arrow_closed = "",
       default = "",
       open = "",
       empty = "",
       empty_open = "",
       symlink = "",
       symlink_open = "",
    },
}

-- default mappings
local keys = {
    { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
    { key = "<C-e>",                        action = "edit_in_place" },
    { key = {"O"},                          action = "edit_no_picker" },
    { key = {"<2-RightMouse>", "l"},        action = "cd" },
    { key = "<C-v>",                        action = "vsplit" },
    { key = "<C-x>",                        action = "split" },
    { key = "<C-t>",                        action = "tabnew" },
    { key = "<",                            action = "prev_sibling" },
    { key = ">",                            action = "next_sibling" },
    { key = "P",                            action = "parent_node" },
    { key = "<BS>",                         action = "close_node" },
    { key = "<Tab>",                        action = "preview" },
    { key = "K",                            action = "first_sibling" },
    { key = "J",                            action = "last_sibling" },
    { key = "I",                            action = "toggle_ignored" },
    { key = "H",                            action = "toggle_dotfiles" },
    { key = "R",                            action = "refresh" },
    { key = "mf",                           action = "create" },
    { key = "DD",                           action = "remove" },
    { key = "dd",                           action = "trash" },
    { key = "r",                            action = "rename" },
    { key = "<C-r>",                        action = "full_rename" },
    { key = "x",                            action = "cut" },
    { key = "y",                            action = "copy" },
    { key = "p",                            action = "paste" },
    { key = "c",                            action = "copy_name" },
    { key = "cp",                           action = "copy_path" },
    { key = "ca",                           action = "copy_absolute_path" },
    { key = "[c",                           action = "prev_git_item" },
    { key = "]c",                           action = "next_git_item" },
    { key = "h",                            action = "dir_up" },
    { key = "s",                            action = "system_open" },
    { key = "q",                            action = "close" },
    { key = "g?",                           action = "toggle_help" },
    { key = "W",                            action = "collapse_all" },
    { key = "S",                            action = "search_node" },
    { key = "<C-k>",                        action = "toggle_file_info" },
    { key = ".",                            action = "run_file_command" }
}


require'nvim-tree'.setup {
    auto_reload_on_write = true,
    disable_netrw = false,
    hide_root_folder = false,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
        width = 30,
        height = 30,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = true,
            list = keys
        }
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
    },
    ignore_ft_on_setup = {"alpha"},
    system_open = {
        cmd = nil,
        args = {},
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = " ",
            info = " ",
            warning = " ",
            error = " ",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions = {
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            git = false,
            profile = false,
        },
    },
}
