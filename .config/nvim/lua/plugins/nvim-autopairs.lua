-----------------------------------------------------------
-- Balance parenthesis, brackets and braces plugin
-----------------------------------------------------------

-- Plugin: nvim-autopairs

-- https://github.com/windwp/nvim-autopairs


local nvim_autopairs_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')
if not nvim_autopairs_ok then return end

nvim_autopairs.setup()
