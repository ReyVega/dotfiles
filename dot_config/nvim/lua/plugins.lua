-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- Nord Theme for neovim editor
    use { 'arcticicestudio/nord-vim', as = 'nord' }

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- LSP (To detect programming languages and other functionalities)
    use 'neovim/nvim-lspconfig'

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'nvim-tree'.setup {} end
    }

    -- Treesitter interface
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Lua line (status line)
    use {
         'nvim-lualine/lualine.nvim',
         requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Dashboard (Alpha-Nvim)
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.opts)
        end
    }
end)
