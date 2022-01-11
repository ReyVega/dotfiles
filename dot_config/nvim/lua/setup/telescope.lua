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
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {mirror = false, prompt_position = "top"},
			vertical = {mirror = false},
		},
		file_ignore_patterns = {},
		file_sorter = require'telescope.sorters'.get_fuzzy_file,
		generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        prompt_prefix = ' ',
        color_devicons = true,
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<Esc>'] = actions.close,
            },
        },
        selection_caret = "➤ ",
		entry_prefix = "  ",
		winblend = 0,
		border = {},
		borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
		use_less = true,
		set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
		path_display = {'absolute'}, -- How file paths are displayed ()
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    },
})

-- Load Telescope extensions
require('telescope').load_extension('fzf')
