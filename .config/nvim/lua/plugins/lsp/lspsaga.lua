-----------------------------------------------------------
-- LSPSaga configuration file
-----------------------------------------------------------

-- Plugin: lspsaga

-- https://github.com/glepnir/lspsaga.nvim

return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local saga = require("lspsaga")

		saga.setup({
			finder = {
				max_height = 0.5,
				left_width = 0.4,
				methods = {},
				default = "ref+imp",
				layout = "float",
				silent = false,
				filter = {},
				fname_sub = nil,
				sp_inexist = false,
				sp_global = false,
				ly_botright = false,
				keys = {
					shuttle = "[w",
					toggle_or_open = "o",
					vsplit = "s",
					split = "i",
					tabe = "t",
					tabnew = "r",
					quit = "q",
					close = "<C-c>k",
				},
			},
			diagnostic = {
				show_code_action = true,
				show_layout = "float",
				show_normal_height = 10,
				jump_num_shortcut = true,
				max_width = 0.8,
				max_height = 0.6,
				max_show_width = 0.9,
				max_show_height = 0.6,
				text_hl_follow = true,
				border_follow = true,
				wrap_long_lines = true,
				extend_relatedInformation = false,
				diagnostic_only_current = false,
				keys = {
					exec_action = "o",
					quit = "q",
					toggle_or_jump = "<CR>",
					quit_in_show = { "q", "<ESC>" },
				},
			},
			definition = {
				width = 0.6,
				height = 0.5,
				save_pos = false,
				keys = {
					edit = "<C-c>o",
					vsplit = "<C-c>v",
					split = "<C-c>i",
					tabe = "<C-c>t",
					tabnew = "<C-c>n",
					quit = "q",
					close = "<C-c>k",
				},
			},
			hover = {
				max_width = 0.9,
				max_height = 0.8,
				open_link = "gx",
				open_cmd = "!chrome",
			},
			rename = {
				in_select = true,
				auto_save = false,
				project_max_width = 0.5,
				project_max_height = 0.5,
				keys = {
					quit = "<C-k>",
					exec = "<CR>",
					select = "x",
				},
			},
			callhierarchy = {
				layout = "float",
				left_width = 0.2,
				keys = {
					edit = "e",
					vsplit = "s",
					split = "i",
					tabe = "t",
					close = "<C-c>k",
					quit = "q",
					shuttle = "[w",
					toggle_or_req = "u",
				},
			},
			typehierarchy = {
				layout = "float",
				left_width = 0.2,
				keys = {
					edit = "e",
					vsplit = "s",
					split = "i",
					tabe = "t",
					close = "<C-c>k",
					quit = "q",
					shuttle = "[w",
					toggle_or_req = "u",
				},
			},
			code_action = {
				num_shortcut = true,
				show_server_name = false,
				extend_gitsigns = false,
				only_in_cursor = true,
				max_height = 0.3,
				cursorline = true,
				keys = {
					quit = "q",
					exec = "<CR>",
				},
			},
			lightbulb = {
				enable = true,
				sign = true,
				debounce = 10,
				sign_priority = 40,
				virtual_text = true,
				enable_in_insert = true,
			},
			symbol_in_winbar = {
				enable = true,
				separator = " › ",
				hide_keyword = false,
				ignore_patterns = nil,
				show_file = true,
				folder_level = 1,
				color_mode = true,
				dely = 300,
			},
			outline = {
				win_position = "right",
				win_width = 30,
				auto_preview = true,
				detail = true,
				auto_close = true,
				close_after_jump = false,
				layout = "normal",
				max_height = 0.5,
				left_width = 0.3,
				keys = {
					toggle_or_jump = "o",
					quit = "q",
					jump = "e",
				},
			},
			implement = {
				enable = false,
				sign = true,
				lang = {},
				virtual_text = true,
				priority = 100,
			},
			ui = {
				border = "rounded",
				devicon = true,
				foldericon = true,
				title = true,
				expand = "⊞",
				collapse = "⊟",
				code_action = "💡",
				actionfix = " ",
				lines = { "┗", "┣", "┃", "━", "┏" },
				kind = nil,
				imp_sign = "󰳛 ",
			},
			beacon = {
				enable = true,
				frequency = 7,
			},
			scroll_preview = {
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			request_timeout = 2000,
			floaterm = {
				height = 0.7,
				width = 0.7,
			},
		})
	end,
}
