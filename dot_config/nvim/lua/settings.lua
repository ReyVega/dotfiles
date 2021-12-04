-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local g = vim.g        	        -- global variables
local set = vim.opt	            -- behaves like :set (Vim)
local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ','             -- change leader to a comma
set.mouse = 'a'               -- enable mouse support
set.clipboard = 'unnamedplus' -- copy/paste to system clipboard
set.swapfile = false          -- don't use swapfile
set.encoding = 'utf-8'        -- the encoding displayed


-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
set.number = true                        -- show line number
set.showmatch = true                     -- highlight matching parenthesis
set.foldmethod = 'marker'                -- enable folding (default 'foldmarker')
set.splitright = true                    -- vertical split to the right
set.splitbelow = true                    -- horizontal split to the bottom
set.incsearch = true                     -- type of search
set.ignorecase = true                    -- ignore case letters when search
set.smartcase = true                     -- ignore lowercase for the whole pattern
set.linebreak = true                     -- wrap on word boundary
set.cmdheight = 2                        -- more space for displaying messages
set.signcolumn = 'number'                -- type of sign column
set.cursorline = true                    -- enable highlighting of the current line
set.guifont = 'Hack Nerd Font:h12'       -- font and size
--set.shortmess = append 'c'

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
set.hidden = true         -- enable background buffers
set.history = 100         -- remember n lines in history
set.lazyredraw = true     -- faster scrolling
set.synmaxcol = 240       -- max column for syntax highlight
set.updatetime = 300      -- faster completion
set.timeoutlen = 500      -- by default timeoutlen is 1000 ms


-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
set.expandtab = true      -- use spaces instead of tabs
set.shiftwidth = 4        -- shift 4 spaces when tab
set.tabstop = 4           -- 1 tab == 4 spaces
set.smartindent = true    -- autoindent new lines
set.smarttab = true       -- tab new lines


-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
set.termguicolors = true      -- enable 24-bit RGB colors
cmd [[colorscheme onenord]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
set.completeopt = 'menuone,noselect' -- insert mode completion options

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)


-- disable nvim intro
set.shortmess:append "sI"

