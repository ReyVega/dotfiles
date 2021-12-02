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
key('n', '<C-s>', ':w<CR>', default_opts)
key('i', '<C-s>', '<Esc>:w<CR>i', default_opts)

-- Move around splits using Ctrl + {h,l,j,k}
key('n', '<C-h>', '<C-w>h', default_opts)
key('n', '<C-l>', '<C-w>l', default_opts)
key('n', '<C-j>', '<C-w>j', default_opts)
key('n', '<C-k>', '<C-w>k', default_opts)

-- Resize windows like monadtall (M = Alt)
key('n', '<A-j>', ':resize -2<CR>', default_opts)
key('n', '<A-k>', ':resize +2<CR>', default_opts)
key('n', '<A-h>', ':vertical resize -2<CR>', default_opts)
key('n', '<A-l>', ':vertical resize +2<CR>', default_opts)


-- Close all windows and exit from neovim
key('n', '<C-q>', ':qa!<CR>', default_opts)
key('i', '<C-q>', '<Esc>:qa!<CR>', default_opts)

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
key('n', '<leader>c', '<Cmd>Bdelete<CR>', default_opts)
key('n', '<C-l>', '<C-w>l', default_opts)
key('n', '<C-j>', '<C-w>j', default_opts)
key('n', '<C-k>', '<C-w>k', default_opts)

-- Resize windows like monadtall (M = Alt)
key('n', '<A-j>', ':resize -2<CR>', default_opts)
key('n', '<A-k>', ':resize +2<CR>', default_opts)
key('n', '<A-h>', ':vertical resize -2<CR>', default_opts)
key('n', '<A-l>', ':vertical resize +2<CR>', default_opts)


-- Close all windows and exit from neovim
key('n', '<C-q>', ':qa!<CR>', default_opts)
key('i', '<C-q>', '<Esc>:qa!<CR>', default_opts)

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
key('n', '<leader>c', '<Cmd>Bdelete<CR>', default_opts)
key('n', '<C-n>', '<Cmd>tabnew<CR>', default_opts)

-- Nvim-tree
key('n', '<C-b>', '<Cmd>NvimTreeToggle<CR>', default_opts)       -- open/close
key('n', '<leader>r', '<Cmd>NvimTreeRefresh<CR>', default_opts)  -- refresh
key('n', '<leader>f', '<Cmd>NvimTreeFindFile<CR>', default_opts) -- search file

-- Telescope
key('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', default_opts)
key('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>', default_opts)
key('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', default_opts)
key('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>', default_opts)
