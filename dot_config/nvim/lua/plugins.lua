-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Nord Theme for neovim editor
    use { 'arcticicestudio/nord-vim', as = 'nord' }

    -- Icons for neovim
    use 'kyazdani42/nvim-web-devicons'

    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autopairs for pairing tags (parenthesis, brackets, etc)
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    -- LSP support and installer (To detect programming languages and other functionalities)
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }

    -- Nvim cmp for autocompletion
    use {
    'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-path',
            'petertriho/cmp-git',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'lukas-reineke/cmp-rg',
            'f3fora/cmp-spell',
            'David-Kunz/cmp-npm',
        },
    }

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'nvim-tree'.setup {} end
    }

    -- Treesitter for Syntax (Languages Analyzer)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Terminal
    use {"akinsho/toggleterm.nvim"}

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

    -- Git decorations
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- FZF for nvim
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Tabs in neovim (Bufferline)
    use {'akinsho/bufferline.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            'famiu/bufdelete.nvim',
        }
    }

    -- Neovim Colorizer
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }

end)
