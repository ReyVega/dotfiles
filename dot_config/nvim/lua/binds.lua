-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-- key (mode, keymap, mapped-to, options)
-----------------------------------------------------------

local key = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- map Esc to kk
key('i', 'kk', '<Esc>', default_opts)

-- Fast saving with Ctrl + s
key('n', '<c-s>', ':w<CR>', default_opts)
key('i', '<c-s>', '<Esc>:w<CR>i', default_opts)

-- Move around splits using Ctrl + {h,l,j,k}
key('n', '<c-h>', '<c-w>h', default_opts)
key('n', '<c-l>', '<c-w>l', default_opts)
key('n', '<c-j>', '<c-w>j', default_opts)
key('n', '<c-k>', '<c-w>k', default_opts)

-- Close all windows and exit from neovim
key('n', '<c-q>', ':qa!<CR>', default_opts)
key('i', '<c-q>', '<Esc>:qa!<CR>', default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------

-- Nvim-tree
key('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
key('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
key('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file
