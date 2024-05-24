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
key("n", "<C-q>", "<Cmd>qa<CR>", default_opts)
key("i", "<C-q>", "<Esc><Cmd>qa<CR>", default_opts)

-- Clear search highlighting
key("n", "<leader>cl", "<Cmd>nohl<CR>", { noremap = true, silent = true, desc = "Clear Filter Selection" })

-- Open/Exit terminal
key("n", "<leader>t", "<Cmd>te<CR>", { noremap = true, silent = true, desc = "Open Terminal" })
key("t", "<ESC>", [[<C-\><C-n>]], default_opts)

-- Open new buffer
key("n", "<C-t>", "<Cmd>enew<CR>", default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------

-- Markdown preview
key("n", "<leader>m", "<Cmd>MarkdownPreview<CR>", { noremap = true, silent = true, desc = "Open Markdown Preview" })

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
