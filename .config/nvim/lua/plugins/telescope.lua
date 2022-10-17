-----------------------------------------------------------
-- Fuzzy Finder configuration file
-----------------------------------------------------------

-- Plugin: telescope

-- https://github.com/nvim-telescope/telescope.nvim#getting-started

local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then return end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then return end

local sorters_ok, sorters = pcall(require, "telescope.sorters")
if not sorters_ok then return end

local previewers_ok, previewers = pcall(require, "telescope.previewers")
if not previewers_ok then return end

local themes_ok, themes = pcall(require, "telescope.themes")
if not themes_ok then return end


telescope.setup {
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
			horizontal = {
				mirror = false,
				prompt_position = "top",
				preview_width = 0.55,
                results_width = 0.8
			},
			vertical = { mirror = false },
			width = 0.8,
			height = 0.9,
            preview_cutoff = 120,
        },
        file_ignore_patterns = {
            "__pycache__/", "__pycache__/*",

			"build/",       "gradle/", "node_modules/", "node_modules/*", "obj/Debug",
			"smalljre_*/*", "target/", "vendor/*",      "bin/Debug",      "venv/",

			".dart_tool/", ".git/", ".github/", ".gradle/",".idea/", ".vscode/",

			"%.sqlite3", "%.ipynb", "%.lock", "%.pdb",   "%.so",
			"%.dll",     "%.class", "%.exe",  "%.cache", "%.pdf",  "%.dylib",
			"%.jar",     "%.docx",  "%.met",  "%.burp",  "%.mp4",  "%.mkv",   "%.rar",
			"%.zip",     "%.7z",    "%.tar",  "%.bz2",   "%.epub", "%.flac",  "%.tar.gz",
        },
        file_sorter = sorters.get_fuzzy_file,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        winblend = 0,
		border = {},
		borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
		use_less = true,
		set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
		path_display = {'truncate'}, -- How file paths are displayed ()
        preview = {
			msg_bg_fillchar = " ",
			treesitter = false,
		},
        live_grep = {
			preview = {
				treesitter = false
			}
		},
        buffer_previewer_maker = previewers.buffer_previewer_maker,
        mappings = {
            n = { ["q"] = actions.close },
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<Esc>'] = actions.close,
            },
        },
    },
    extensions = {
        fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},

        ["ui-select"] = {
			themes.get_dropdown {
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
				    horizontal = {
				        mirror = false,
				        prompt_position = "top",
			        },
			        vertical = { mirror = false },
			        width = 0.35,
			        height = 0.35,
				},
                file_sorter = sorters.get_fuzzy_file,
                generic_sorter = sorters.get_generic_fuzzy_sorter,
                winblend = 0,
				border = {},
				previewer = false,
				shorten_path = false,
			},
		}
    },
}

-- Load Telescope extensions
telescope.load_extension('fzf')
telescope.load_extension("ui-select")

local colors = {
    white = "#D8DEE9",
    darker_black = "#252B37",
    black = "#3B4252",
    red = "#BF616A",
    green = "#A3BE8C",
    yellow = "#EBCB8B",
    blue = "#5E81AC"
}

local telescope_colors = {
    TelescopePreviewNormal = { bg = colors.darker_black },
    TelescopePromptNormal = { bg = colors.black, fg = colors.white },
    TelescopeResultsNormal = { bg = colors.darker_black },

    TelescopePromptBorder = { bg = colors.black, fg = colors.black },
    TelescopeResultsBorder = { bg = colors.darker_black, fg = colors.darker_black },
    TelescopePreviewBorder = { bg = colors.darker_black, fg = colors.darker_black },

    TelescopePromptTitle = { bg = colors.red, fg = colors.darker_black },
    TelescopeResultsTitle = { bg = colors.darker_black, fg = colors.darker_black },
    TelescopePreviewTitle = { bg = colors.green, fg = colors.darker_black },

    TelescopePromptPrefix = { fg = colors.red, bg = colors.black },
    TelescopeSelection = { bg = colors.black, fg = colors.white, bold = true },
    TelescopeMatching = { fg = colors.blue, bold = true },

    TelescopeResultsDiffAdd = { fg = colors.green },
    TelescopeResultsDiffChange = { fg = colors.yellow },
    TelescopeResultsDiffDelete = { fg = colors.red },
}

for hl, col in pairs(telescope_colors) do
    vim.api.nvim_set_hl(0, hl, col)
end
