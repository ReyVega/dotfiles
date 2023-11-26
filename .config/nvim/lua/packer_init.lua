-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin: packer.nvim

-- https://github.com/wbthomason/packer.nvim


local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({
		"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
		install_path
	})
end

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer_init.lua source <afile> | PackerSync
    augroup end
]]

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

function Get_setup(name)
  return string.format('require("plugins/%s")', name)
end

return packer.startup({
    config = {
        display = {
            compile_path = vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua",
            open_fn = function()
                return require("packer.util").float({ border = "rounded" })
            end
        }
    },

    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        -- Improve performace
        use {
            "lewis6991/impatient.nvim",
        }

        -- Themes for neovim editor
        use {"rmehri01/onenord.nvim", as = "onenord" }
        use {"folke/tokyonight.nvim", as = "tokyonight"}
        use {"olimorris/onedarkpro.nvim", as = "onedarkpro"}

        -- Icons
        use {"kyazdani42/nvim-web-devicons"}

        -- Corroutines
        use {"nvim-lua/plenary.nvim"}

        -- Matchup functions, conditions, etc.
        use {"andymass/vim-matchup"}

        -- Formatter
        use {
            "jose-elias-alvarez/null-ls.nvim",
            config = Get_setup("null_ls")
        }

        -- Markdown
        use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })

        -- Indent line
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = Get_setup("indent-blankline")
        }

        -- Autocloses for tags
        use {
            ft = {"html", "tsx", "vue", "svelte", "php"},
            "windwp/nvim-ts-autotag",
            config = Get_setup("nvim-ts-autotag")
        }

        -- Surround everything
        use {"kylechui/nvim-surround"}

        -- Keybindings menu
        use {
            "folke/which-key.nvim",
            config = Get_setup("which-key")
        }

        -- Comments
        use {
            "b3nj5m1n/kommentary",
            config = Get_setup("kommentary")
        }

        -- Autocloses for pairing parenthesis, brackets, etc
        use {
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = Get_setup("nvim-autopairs")
        }

        -- Neovim Colorizer
        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufReadPre",
            config = Get_setup("nvim-colorizer"),
        }

        -- Snippet Engine
        use {
            "L3MON4D3/LuaSnip",
            requires = {"rafamadriz/friendly-snippets"},
            config = Get_setup("luasnip")
        }

        -- Nvim cmp for autocompletion
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "onsails/lspkind.nvim",
                "hrsh7th/cmp-nvim-lsp",
                {"hrsh7th/cmp-nvim-lua", ft = "lua"},
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-cmdline",
                "lukas-reineke/cmp-rg",
                "lukas-reineke/cmp-under-comparator",
                "David-Kunz/cmp-npm",
            },
            config = Get_setup("nvim-cmp")
        }

        -- File explorer
        use {
            "kyazdani42/nvim-tree.lua",
            event = "UIEnter",
            after = "alpha-nvim",
            config = Get_setup("nvim-tree"),
            cmd = {"NvimTreeToggle", "NvimTreeFindFileToggle"}
        }

        -- Treesitter for Syntax (Languages Analyzer)
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = Get_setup("nvim-treesitter")
        }

        -- Treesitter extension
        use {
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter"
        }

        -- Bufferline and nvim-bufdel (Utility to mantain bufferline layout when closing tabs)
        use {
            "akinsho/bufferline.nvim",
            event = "UIEnter",
            after = "alpha-nvim",
            requires = {"ojroques/nvim-bufdel"},
            config = Get_setup("bufferline")
        }

        -- Status line
        use {
            "nvim-lualine/lualine.nvim",
            event = "UIEnter",
            config = Get_setup("lualine")
        }

        -- Git Signs
        use {
            "lewis6991/gitsigns.nvim",
            event = "BufReadPre",
            config = Get_setup("gitsigns"),
        }

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
                {"nvim-telescope/telescope-ui-select.nvim"},
            },
            config = Get_setup("telescope")
        }

        -- Alpha-Nvim
        use {
            "goolord/alpha-nvim",
            config = Get_setup("alpha")
        }

        -- LSP
        use {
            "neovim/nvim-lspconfig",
            event = "BufEnter",
            config = Get_setup("nvim-lspconfig")
        }

        -- LSP support and installer (To detect programming languages and other functionalities)
        use {
            "williamboman/mason.nvim",
            requires = {"williamboman/mason-lspconfig.nvim"},
            config = Get_setup("mason"),
            run = ":MasonUpdate"
        }

        -- LSP better actions
        use {
             "nvimdev/lspsaga.nvim",
             after = 'nvim-lspconfig',
             config = Get_setup("lspsaga")
        }

        -- Zen Mode
        use {
            "folke/zen-mode.nvim",
            requires = {"folke/twilight.nvim"},
	        config = Get_setup("zen-mode")
        }

        -- Http Client
        use {
            "rest-nvim/rest.nvim",
            config = Get_setup("rest")
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if Packer_bootstrap then
            require("packer").sync()
        end
    end,
})
