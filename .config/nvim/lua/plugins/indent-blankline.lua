-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline

-- https://github.com/lukas-reineke/indent-blankline.nvim


local indent_ok, indent = pcall(require, "ibl")
if not indent_ok then return end

-- Current context indent blankline color
vim.cmd[[highlight IndentBlanklineContextChar guifg=#5E81AC gui=nocombine]]

indent.setup {
    enabled = true,
    indent = {
        char = "▏",
        smart_indent_cap = true,
        highlight = "IndentBlanklineChar",
    },
    whitespace = {
        remove_blankline_trail = true,
        highlight = "IndentBlanklineSpaceChar",
    },
    scope = {
        enabled = true,
        char = "▏",
        show_start = false,
        show_end = false,
        injected_languages = true,
        highlight = "IndentBlanklineContextChar",
        include = {
            node_type = {
                ["*"] = { "*" },
            },
        }
    },
    exclude = {
        filetypes = {
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
        buftypes = {
            'terminal',
            'nofile',
            'help'
        }
    }
}
