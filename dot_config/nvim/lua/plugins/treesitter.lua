-----------------------------------------------------------
-- Syntax analyzer configuration file
-----------------------------------------------------------

-- PLugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    matchup = {
        enable = true
    },
    indent = {
        enable = true
    },
    autotag = {
       enable = true
    }
}

vim.cmd
[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
]]
