-----------------------------------------------------------
-- File explorer configuration file
-----------------------------------------------------------

-- PLugin: nvim-tree

-- https://github.com/kyazdani42/nvim-tree.lua

local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_ok then
	return
end

function Keys(bufnr)
	local api = require("nvim-tree.api")
	local default_opts = { buffer = bufnr, noremap = true, silent = true }

	local bufmap = function(lhs, rhs, opts, desc)
		if type(x) == "table" then
			for _, value in ipairs(lhs) do
				vim.keymap.set("n", value, rhs, opts, desc)
			end
		else
			vim.keymap.set("n", lhs, rhs, opts, desc)
		end
	end

	-- Node
	bufmap("<CR>", api.node.open.edit, default_opts, "Open file")
	bufmap("op", api.node.open.preview, default_opts, "Expand all directories")
	bufmap("oi", api.node.show_info_popup, default_opts, "Expand all directories")

	-- Files management
	bufmap("cf", api.fs.create, default_opts, "Create file")
	bufmap("dd", api.fs.trash, default_opts, "Trash file")
	bufmap("DD", api.fs.remove, default_opts, "Delete file")
	bufmap("r", api.fs.rename, default_opts, "Rename file")
	bufmap("fr", api.fs.rename_sub, default_opts, "Rename file (Omitting file in output)")
	bufmap("x", api.fs.cut, default_opts, "Cut file/Remove selected file")
	bufmap("y", api.fs.copy.node, default_opts, "Copy file/Remove selected file")
	bufmap("oc", api.fs.print_clipboard, default_opts, "Print clipboard (Copied and Cutted files)")
	bufmap("p", api.fs.paste, default_opts, "Paste file")
	bufmap("Y", api.fs.copy.filename, default_opts, "Copy filename")
	bufmap("cp", api.fs.copy.relative_path, default_opts, "Copy file's relative path")
	bufmap("ca", api.fs.copy.absolute_path, default_opts, "Copy file's absolute path")

	-- Tree
	bufmap("h", api.tree.change_root_to_parent, default_opts, "Dir up")
	bufmap("l", api.tree.change_root_to_node, default_opts, "Change working directory to selected one (cd)")
	bufmap("A", api.tree.collapse_all, default_opts, "Collapse all directories")
	bufmap("S", api.tree.expand_all, default_opts, "Expand all directories")
	bufmap(".", api.tree.toggle_hidden_filter, default_opts, "Toggle dotfiles filter")
	bufmap(",", api.tree.toggle_gitignore_filter, default_opts, "Toggle gitignore filter")

	-- Navigation
	bufmap("J", api.node.navigate.sibling.next, default_opts, "Move to next sibling within folder")
	bufmap("K", api.node.navigate.sibling.prev, default_opts, "Move to prev sibling within folder")
	bufmap("H", api.node.navigate.sibling.first, default_opts, "Move to first sibling within folder")
	bufmap("L", api.node.navigate.sibling.last, default_opts, "Move to last sibling within folder")
	bufmap("P", api.node.navigate.parent, default_opts, "Move to parent node (folder)")
	bufmap("<BS>", api.node.navigate.parent_close, default_opts, "Close parent node (folder)")
	bufmap("<C-n>", api.node.navigate.diagnostics.next, default_opts, "Move to next diagnosed file")
	bufmap("<C-p>", api.node.navigate.diagnostics.prev, default_opts, "Move to prev diagnosed file")
	bufmap("gn", api.node.navigate.git.next, default_opts, "Move to next git item")
	bufmap("gp", api.node.navigate.git.prev, default_opts, "Move to prev git item")

	-- Marks
	bufmap("M", api.marks.toggle, default_opts, "Move to prev git item")
	bufmap("mm", api.marks.bulk.move, default_opts, "Move to prev git item")
	bufmap("mn", api.marks.navigate.next, default_opts, "Move to prev git item")
	bufmap("mp", api.marks.navigate.prev, default_opts, "Move to prev git item")
	bufmap("ms", api.marks.navigate.select, default_opts, "Move to prev git item")

	vim.bo[bufnr].path = "/tmp"
end

local settings = {
	on_attach = Keys,
	hijack_cursor = true,
	auto_reload_on_write = true,
	disable_netrw = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	select_prompts = false,
	sort = {
		sorter = "name",
		folders_first = true,
		files_first = false,
	},
	view = {
		centralize_selection = false,
		cursorline = true,
		debounce_delay = 15,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		width = 30,
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		full_name = false,
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
		highlight_git = "none",
		highlight_diagnostics = "none",
		highlight_opened_files = "all",
		highlight_modified = "none",
		highlight_bookmarks = "none",
		highlight_clipboard = "name",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},
			git_placement = "before",
			modified_placement = "after",
			diagnostics_placement = "signcolumn",
			bookmarks_placement = "signcolumn",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
				diagnostics = true,
				bookmarks = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "󰆤",
				modified = "●",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = false,
		update_root = {
			enable = false,
			ignore_list = {},
		},
		exclude = false,
	},
	system_open = {
		cmd = "",
		args = {},
	},
	git = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		disable_for_dirs = {},
		timeout = 400,
		cygwin_support = false,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = " ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},
	modified = {
		enable = false,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	filters = {
		enable = true,
		git_ignored = false,
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
		no_bookmark = false,
		custom = { ".git", "node_modules" },
		exclude = {},
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "shadow",
				style = "minimal",
			},
		},
		open_file = {
			quit_on_open = false,
			eject = true,
			resize_window = true,
			window_picker = {
				enable = true,
				picker = "default",
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = false,
		},
	},
	trash = {
		cmd = "trash",
	},
	tab = {
		sync = {
			open = false,
			close = false,
			ignore = {},
		},
	},
	notify = {
		threshold = vim.log.levels.INFO,
		absolute_path = true,
	},
	help = {
		sort_by = "key",
	},
	ui = {
		confirm = {
			remove = true,
			trash = true,
			default_yes = false,
		},
	},
	experimental = {},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
}

nvim_tree.setup(settings)

-- Highlight color for opened files
vim.cmd([[
    hi NvimTreeOpenedHL guifg=#88C0D0
]])

-----------------------------------------------------------
-- Keymaps:
-----------------------------------------------------------
local key = vim.keymap.set

-- Open/Close nvim tree
key("n", "<leader>b", "<Cmd>NvimTreeFindFileToggle<CR>", { noremap = true, silent = true, desc = "Open nvim tree" })
