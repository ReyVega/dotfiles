-----------------------------------------------------------
-- Startup configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- https://github.com/goolord/alpha-nvim

local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- setup footer
local function footer()
  local datetime = os.date('%b %d %y, %H:%M')
  return datetime
end

-- header
dashboard.section.header.val = {
  "                                                    ",
  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                    ",
}

-- menu
dashboard.section.buttons.val = {
  dashboard.button('n', '  New file', '<Cmd>ene <BAR> startinsert<CR>'),
  dashboard.button('f', '  Find file', '<Cmd>Telescope find_files<CR>'),
  dashboard.button('s', '漣 Settings', '<Cmd>cd ~/.config/nvim/ <bar> e init.lua<CR>'),
  dashboard.button('u', '  Update plugins', '<Cmd>PackerSync<CR>'),
  dashboard.button('q', '  Quit', '<Cmd>qa!<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.opts)