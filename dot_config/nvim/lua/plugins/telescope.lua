-----------------------------------------------------------
-- Fuzzy Finder configuration file
-----------------------------------------------------------

-- Plugin: telescope
-- https://github.com/nvim-telescope/telescope.nvim#getting-started

local actions = require('telescope.actions')

require('telescope').setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        prompt_prefix = '🔍',
        color_devicons = true,
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<Esc>'] = actions.close,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    },
})

-- Load Telescope extensions
require('telescope').load_extension('fzf')
