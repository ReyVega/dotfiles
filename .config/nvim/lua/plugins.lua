-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin: packer

vim.cmd [[packadd packer.nvim]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
end

function Get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup({function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Themes for neovim editor
    use {'rmehri01/onenord.nvim', as = 'onenord' }
    use {'folke/tokyonight.nvim', as = 'tokyonight'}
    use {'olimorris/onedarkpro.nvim', as = 'onedarkpro'}

    -- Improve performace
    use {
        'lewis6991/impatient.nvim',
        'nathom/filetype.nvim'
    }

    -- Icons
    use {'kyazdani42/nvim-web-devicons'}

    -- Vim iluminate
    use {'RRethy/vim-illuminate'}

    -- Matchup functions, conditions, etc.
    use {'andymass/vim-matchup'}

    -- Git support for nvim
    use {
        'tpope/vim-fugitive',
        cmd = {'Git'}
    }

    -- Formatter
    use {
        "sbdchd/neoformat",
        cmd = {'Neoformat'}
    }

    -- Markdown
    use {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        run = 'cd app && yarn install',
        cmd = {'MarkdownPreview'}
    }

    -- Indent line
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = Get_setup("indent-blankline")
    }

    -- Autocloses for tags
    use {
        ft = {'html', 'tsx', 'vue', 'svelte', 'php'},
        'windwp/nvim-ts-autotag',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = Get_setup("nvim-ts-autotag")
    }

    -- Surround everything
    use {"https://github.com/tpope/vim-surround"}

    -- Keybindings menu
    use {
        "folke/which-key.nvim",
        config = Get_setup("which-key")
    }

    -- Comments
    use {
        'b3nj5m1n/kommentary',
        config = Get_setup("kommentary")
    }

    -- Autocloses for pairing parenthesis, brackets, etc
    use {
        'windwp/nvim-autopairs',
        after = "nvim-cmp",
        config = Get_setup("nvim-autopairs")
    }

    -- Neovim Colorizer
    use {
        'norcalli/nvim-colorizer.lua',
        event = "BufReadPre",
        config = Get_setup("nvim-colorizer"),
    }

    -- Snippet Engine
    use {
        'L3MON4D3/LuaSnip',
        requires = {"rafamadriz/friendly-snippets"},
        config = Get_setup("luasnip")
    }

    -- Nvim cmp for autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            {'hrsh7th/cmp-nvim-lua', ft = 'lua'},
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-cmdline',
            'lukas-reineke/cmp-rg',
            "lukas-reineke/cmp-under-comparator",
            'David-Kunz/cmp-npm',
        },
        config = Get_setup('nvim-cmp')
    }

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        event = "UIEnter",
        after = "alpha-nvim",
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = Get_setup('nvim-tree'),
        cmd = {'NvimTreeToggle'}
    }

    -- Treesitter for Syntax (Languages Analyzer)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = Get_setup('nvim-treesitter')
    }

    -- Treesitter extension
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = "nvim-treesitter"
    }

    -- Bufferline and nvim-bufdel (Utility to mantain bufferline layout when closing tabs)
    use {
        'akinsho/bufferline.nvim',
        event = "UIEnter",
        after = "alpha-nvim",
        requires = {
            'kyazdani42/nvim-web-devicons',
            'famiu/bufdelete.nvim',
            opt = true
        },
        config = Get_setup('bufferline')
    }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        event = "UIEnter",
        requires = {'kyazdani42/nvim-web-devicons', opt = true },
        config = Get_setup('lualine')
    }

    -- Git Signs
    use {
        'lewis6991/gitsigns.nvim',
        event = "BufReadPre",
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = Get_setup("gitsigns"),
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
        },
        config = Get_setup('telescope')
    }

    -- Alpha-Nvim
    use {
        'goolord/alpha-nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = Get_setup('alpha')
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        event = 'BufEnter',
        config = Get_setup('nvim-lspconfig')
    }

    -- LSP support and installer (To detect programming languages and other functionalities)
    use {
        'williamboman/nvim-lsp-installer',
        config = Get_setup('nvim-lsp-installer')
    }

    -- LSP better actions
    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = Get_setup("lspsaga")
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then
        require('packer').sync()
    end
end,

config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end
    }
}})

