--https://github.com/nvim-treesitter/nvim-treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true, -- false will disable the whole extension
	    disable = {},  -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
}

