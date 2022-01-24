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
key('n', '<leader>c', '<Cmd>nohl<CR>', default_opts)

-- Open terminal
key('n', '<C-t>', '<Cmd>te<CR>', default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------

-- Bufferline
key('n', '<TAB>', '<Cmd>BufferLineCycleNext<CR>', default_opts)
key('n', '<S-TAB>', '<Cmd>BufferLineCyclePrev<CR>', default_opts)

key('n', '<A-n>', '<Cmd>BufferLineMoveNext<CR>', default_opts)
key('n', '<A-p>', '<Cmd>BufferLineMovePrev<CR>', default_opts)

key('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', default_opts)
key('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', default_opts)
key('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', default_opts)
key('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', default_opts)
key('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', default_opts)
key('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', default_opts)
key('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', default_opts)
key('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', default_opts)
key('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', default_opts)

key('n', '<leader>p', '<Cmd>BufferLinePick<CR>', default_opts)
key('n', '<leader>o', '<Cmd>BufferLinePickClose<CR>', default_opts)
key('n', '<leader>w', '<Cmd>BufDel<CR>', default_opts)

-- Nvim-tree
key('n', '<C-b>', '<Cmd>NvimTreeToggle<CR>', default_opts)

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

-- Lsp native commands
key('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', default_opts)
key('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<CR>', default_opts)
key('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)
key('n', '<C-a>', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_opts)
key('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
key('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default_opts)

-- key('n', '<space>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
-- key('n', '<space>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)
-- key('n', 'gh', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
-- key('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', default_opts)
-- key('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', default_opts)
-- key('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', default_opts)
-- key('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', default_opts)
-- key('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
-- key('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', default_opts)
-- key('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', default_opts)
-- key('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', default_opts)

-- Code formatter.
key("n", "<C-f>", "<Cmd>Neoformat<CR>", default_opts)
