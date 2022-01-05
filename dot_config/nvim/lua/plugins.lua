-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin: packer

vim.cmd [[packadd packer.nvim]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require("packer").startup({function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Themes for neovim editor
    use {'rmehri01/onenord.nvim', as = 'onenord' }
    use {'folke/tokyonight.nvim', as = 'tokyonight'}
    use {'olimorris/onedarkpro.nvim', as = 'onedarkpro'}

    -- Git support for nvim
    use {"tpope/vim-fugitive"}

    -- Vim iluminate
    use {'RRethy/vim-illuminate'}

    -- Icons for neovim
    use {'kyazdani42/nvim-web-devicons'}

    -- Indent line
    use {'lukas-reineke/indent-blankline.nvim'}

    -- Matchup functions, conditions, etc.
    use {'andymass/vim-matchup'}

    -- Autocloses for tags
    use {'windwp/nvim-ts-autotag'}

    -- Repeat last action done
    use {'tpope/vim-repeat'}

    -- Formatter
    use {"sbdchd/neoformat"}

    -- Surround everything
    use {
        "blackCauldron7/surround.nvim",
        config = function ()
            require"surround".setup {
                context_offset = 100,
                load_autogroups = false,
                mappings_style = "sandwich",
                map_insert_mode = true,
                quotes = {"'", '"'},
                brackets = {"(", '{', '['},
                space_on_closing_char = false,
                pairs = {
                    nestable = {{"(", ")"}, {"[", "]"}, {"{", "}"}},
                    linear = {{"'", "'"}, {"`", "`"}, {'"', '"'}}
                },
                prefix = "s"
            }
        end
    }


    -- Comments
    use {
        'b3nj5m1n/kommentary',
        config = function ()
            require('kommentary.config').configure_language("default", {
                prefer_single_line_comments = true,
            })
        end
    }

    -- Autocloses for pairing parenthesis, brackets, etc
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    -- Neovim Colorizer
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup {
                "*",
                css = { rgb_fn = true; }
            }
        end
    }

    -- LSP support and installer (To detect programming languages and other functionalities)
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }

    -- Snippet Engine
    use {
        'L3MON4D3/LuaSnip',
        requires = {"rafamadriz/friendly-snippets"},
    }

    -- Nvim cmp for autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-cmdline',
            'lukas-reineke/cmp-rg',
            "lukas-reineke/cmp-under-comparator",
            'David-Kunz/cmp-npm',
        },
    }

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }

    -- Bufferline
    use {
        'akinsho/bufferline.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }

    -- Utility to mantain bufferline layout when closing tabs
    use {
        'ojroques/nvim-bufdel',
        config = function ()
            require('bufdel').setup {
                quit = false, -- close neovim if last buffer
            }
        end
    }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Treesitter for Syntax (Languages Analyzer)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- Alpha-Nvim
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.opts)
        end
    }

    -- Git Signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function ()
            require('gitsigns').setup()
        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

    -- FZF for nvim
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Markdown
    use {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        run = 'cd app && yarn install'
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
            return require('packer.util').float({ border = 'single' })
        end
    }
}})

