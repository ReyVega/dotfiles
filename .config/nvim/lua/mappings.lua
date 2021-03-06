-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-- key (mode, keymap, mapped-to, options)
-----------------------------------------------------------

local key = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd
local g = vim.g

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- Map Esc to kk
key('i', 'kk', '<Esc>', default_opts)

-- Fast saving with Ctrl + s
key('n', '<C-s>', '<Cmd>w<CR>', default_opts)
key('i', '<C-s>', '<Esc><Cmd>w<CR>i', default_opts)

-- Move around splits using Ctrl + {h,l,j,k}
key('n', '<C-h>', '<C-w>h', default_opts)
key('n', '<C-l>', '<C-w>l', default_opts)
key('n', '<C-j>', '<C-w>j', default_opts)
key('n', '<C-k>', '<C-w>k', default_opts)

-- Close all windows and exit from neovim
key('n', '<C-q>', '<Cmd>qa!<CR>', default_opts)
key('i', '<C-q>', '<Esc><Cmd>qa!<CR>', default_opts)

-- Clear search highlighting
key('n', '<leader>cl', '<Cmd>nohl<CR>', default_opts)

-- Open terminal
key('n', '<leader>t', '<Cmd>te<CR>', default_opts)

-- Open new buffer
key('n', '<C-t>', '<Cmd>new | close<CR>', default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------

-- Bufferline
key('n', '<TAB>', '<Cmd>BufferLineCycleNext<CR>', default_opts)
key('n', '<S-TAB>', '<Cmd>BufferLineCyclePrev<CR>', default_opts)

key('n', '<PageUp>', '<Cmd>BufferLineMoveNext<CR>', default_opts)
key('n', '<PageDown>', '<Cmd>BufferLineMovePrev<CR>', default_opts)

key('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', default_opts)
key('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', default_opts)
key('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', default_opts)
key('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', default_opts)
key('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', default_opts)
key('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', default_opts)
key('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', default_opts)
key('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', default_opts)
key('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', default_opts)

key('n', '<leader>w', '<Cmd>Bdelete!<CR>', default_opts)

-- Nvim-tree
key('n', '<leader>b', '<Cmd>NvimTreeToggle<CR>', default_opts)

-- Telescope
key("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", default_opts)
key("n", "<leader>gs", "<Cmd>Telescope git_status<CR>", default_opts)
key("n", "<leader>gc", "<Cmd>Telescope git_commits<CR>", default_opts)
key("n", "<leader>gt", "<Cmd>Telescope git_bcommits<CR>", default_opts)
key("n", "<leader>gb", "<Cmd>Telescope git_branches<CR>", default_opts)
key("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", default_opts)
key("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", default_opts)
key("n", "<leader>cs", "<Cmd>Telescope colorscheme<CR>", default_opts)

-- Kommentary
g.kommentary_create_default_mappings = false
key("n", "<leader>k", "<Plug>kommentary_line_default", {})
key("x", "<leader>k", "<Plug>kommentary_visual_default<C-c>", {})

-- Lspsaga commands
key("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", default_opts)
key("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", default_opts)
key("n", "<C-n>", "<cmd>Lspsaga diagnostic_jump_next<CR>", default_opts)
key("n", "<C-p>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", default_opts)
key("n", "gr", "<cmd>Lspsaga rename<CR>", default_opts)
key("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", default_opts)
key("v", "<leader>ca", "<cmd>Lspsaga range_code_action<CR>", default_opts)
key("n", "K", "<cmd>Lspsaga hover_doc<CR>", default_opts)
key("n", "gs", "<cmd>Lspsaga signature_help<CR>", default_opts)
key("n", "gd", "<cmd>Lspsaga preview_definition<CR>", default_opts)
key("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", default_opts)
key("t", "<A-d>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", default_opts)

-- Code formatter.
key("n", "gf", "<Cmd>Neoformat<CR>", default_opts)

-- Markdwn preview
key("n", "<leader>m", "<Cmd>MarkdownPreview<CR>", default_opts)
