-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-- key (mode, keymap, mapped-to, options)
-----------------------------------------------------------

local key = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Change leader to a comma
vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- Map Esc to kk
key("i", "kk", "<Esc>", default_opts)

-- Fast saving with Ctrl + s
key("n", "<C-s>", "<Cmd>w<CR>", default_opts)
key("i", "<C-s>", "<Esc><Cmd>w<CR>i", default_opts)

-- Move around splits using Ctrl + {h,l,j,k}
key("n", "<C-h>", "<C-w>h", default_opts)
key("n", "<C-l>", "<C-w>l", default_opts)
key("n", "<C-j>", "<C-w>j", default_opts)
key("n", "<C-k>", "<C-w>k", default_opts)

-- Close all windows and exit from neovim
key("n", "<C-q>", "<Cmd>qa!<CR>", default_opts)
key("i", "<C-q>", "<Esc><Cmd>qa!<CR>", default_opts)

-- Clear search highlighting
key("n", "<leader>cl", "<Cmd>nohl<CR>", { noremap = true, silent = true, desc = "Clear Filter Selection" })

-- Open/Exit terminal
key("n", "<leader>t", "<Cmd>te<CR>", { noremap = true, silent = true, desc = "Open Terminal" })
key("t", "<ESC>", [[<C-\><C-n>]], default_opts)

-- Open new buffer
key("n", "<C-t>", "<Cmd>new | close<CR>", default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------

-- Bufferline
key("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>", default_opts)
key("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", default_opts)

key("n", "<PageUp>", "<Cmd>BufferLineMoveNext<CR>", default_opts)
key("n", "<PageDown>", "<Cmd>BufferLineMovePrev<CR>", default_opts)

key("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", default_opts)
key("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", default_opts)
key("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", default_opts)
key("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", default_opts)
key("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", default_opts)
key("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", default_opts)
key("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", default_opts)
key("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", default_opts)
key("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", default_opts)

-- Nvim-tree
key("n", "<leader>b", "<Cmd>NvimTreeFindFileToggle<CR>", { noremap = true, silent = true, desc = "Open Nvim Tree" })

-- Telescope
key(
	"n",
	"<leader>fg",
	"<Cmd>Telescope live_grep<CR>",
	{ noremap = true, silent = true, desc = "Find Word - Telescope" }
)
key(
	"n",
	"<leader>ff",
	"<Cmd>Telescope find_files<CR>",
	{ noremap = true, silent = true, desc = "Find File - Telescope" }
)
key(
	"n",
	"<leader>fb",
	"<Cmd>Telescope buffers<CR>",
	{ noremap = true, silent = true, desc = "Find Buffer - Telescope" }
)
key(
	"n",
	"<leader>cs",
	"<Cmd>Telescope colorscheme<CR>",
	{ noremap = true, silent = true, desc = "Change Colorscheme - Telescope" }
)

-- Kommentary
vim.g.kommentary_create_default_mappings = false
key("n", "<leader>k", "<Plug>kommentary_line_default", { desc = "Comment Current Line" })
key("x", "<leader>k", "<Plug>kommentary_visual_default<C-c>", { desc = "Comment Selected Lines" })

-- Lspsaga commands
key(
	"n",
	"gh",
	"<cmd>Lspsaga lsp_finder<CR>",
	{ noremap = true, silent = true, desc = "Find the Symbol Definition implement Reference" }
)
key(
	{ "n", "v" },
	"<leader>ca",
	"<cmd>Lspsaga code_action<CR>",
	{ noremap = true, silent = true, desc = "Show Code Actions" }
)
key("n", "gr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, desc = "Rename" })
key("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true, desc = "Find Peek Definition" })
key(
	"n",
	"<leader>cd",
	"<cmd>Lspsaga show_line_diagnostics<CR>",
	{ noremap = true, silent = true, desc = "Show Line Diagnostics" }
)
--key("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", default_opts)
key("n", "<C-p>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", default_opts)
key("n", "<C-n>", "<cmd>Lspsaga diagnostic_jump_next<CR>", default_opts)
key(
	"n",
	"<leader>o",
	"<cmd>LSoutlineToggle<CR>",
	{ noremap = true, silent = true, desc = "Toggle Outline Diagnostics" }
)
key("n", "K", "<cmd>Lspsaga hover_doc<CR>", default_opts)

-- Markdown preview
key("n", "<leader>m", "<Cmd>MarkdownPreview<CR>", { noremap = true, silent = true, desc = "Open Markdown Preview" })

-- Formatting
key("n", "F", "<Cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true, desc = "Format" })

-- Zen Mode
key("n", "<leader>zm", "<Cmd>ZenMode<CR>", { noremap = true, silent = true, desc = "Toggle Zen Mode" })

-- Rest
key("n", "<leader>r", "<Plug>RestNvim", default_opts)

-- Custom
-- When deleting empty line with "dd" it won"t override your last yank
local function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end

key("n", "dd", smart_dd, { noremap = true, expr = true, desc = "Cut Current Line" })

-- BufDel (Delete buffers without messing the layout)
local function BufDel()
	if vim.bo.filetype ~= "NvimTree" then
		return "<Cmd>BufDel!<CR>"
	end
end

key({ "n", "v" }, "<leader>w", BufDel, { noremap = true, expr = true, desc = "Delete Current Buffer" })
