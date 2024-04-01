-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local g = vim.g     -- global variables
local set = vim.opt -- behaves like :set (Vim)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
set.mouse = "a"                               -- Enable mouse support
set.clipboard = "unnamedplus"                 -- Copy/paste to system clipboard
set.swapfile = false                          -- Don"t use swapfile
set.completeopt = "menuone,noinsert,noselect" -- Autocomplete options
set.encoding = "utf-8"                        -- the encoding displayed
set.shell = "/bin/bash"                       -- set default shell for terminal
set.guifont = { "Hack Nerd Font", ":h10" }    -- set font and size

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
set.number = true         -- show line number
set.showmatch = true      -- highlight matching parenthesis
set.foldmethod = "marker" -- enable folding (default "foldmarker")
set.splitright = true     -- vertical split to the right
set.splitbelow = true     -- horizontal split to the bottom
set.incsearch = true      -- type of search
set.ignorecase = true     -- ignore case letters when search
set.smartcase = true      -- ignore lowercase for the whole pattern
set.linebreak = true      -- wrap on word boundary
set.cmdheight = 2         -- more space for displaying messages
set.signcolumn = "number" -- type of sign column
set.cursorline = true     -- enable highlighting of the current line
set.termguicolors = true  -- Enable 24-bit RGB colors

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
set.expandtab = true   -- use spaces instead of tabs
set.shiftwidth = 4     -- shift 4 spaces when tab
set.tabstop = 4        -- 1 tab == 4 spaces
set.smartindent = true -- autoindent new lines
set.smarttab = true    -- tab new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
set.hidden = true     -- enable background buffers
set.history = 100     -- remember n lines in history
set.lazyredraw = true -- faster scrolling
set.synmaxcol = 240   -- max column for syntax highlight
set.updatetime = 300  -- faster completion
set.timeoutlen = 500  -- by default timeoutlen is 1000 ms

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable nvim intro
set.shortmess:append("sI")

-- Disable builtins plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
