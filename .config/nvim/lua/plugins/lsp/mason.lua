-----------------------------------------------------------
-- LSP installer configuration file
-----------------------------------------------------------

-- Plugin: mason.nvim

-- https://github.com/williamboman/mason.nvim

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"nvimdev/lspsaga.nvim",
	},
	build = ":MasonUpdate",
	config = function()
		local mason = require("mason")
		local lsp_installer = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		--Mason
		mason.setup({
			install_root_dir = vim.fn.stdpath("data") .. "/mason",
			PATH = "prepend",
			log_level = vim.log.levels.INFO,
			max_concurrent_installers = 4,
			registries = {
				"github:mason-org/mason-registry",
			},
			providers = {
				"mason.providers.registry-api",
				"mason.providers.client",
			},
			github = {
				download_url_template = "https://github.com/%s/releases/download/%s/%s",
			},
			pip = {
				upgrade_pip = false,
				install_args = {},
			},
			ui = {
				check_outdated_packages_on_open = true,
				border = "rounded",
				width = 0.8,
				height = 0.9,
				icons = {
					package_installed = "◍",
					package_pending = "◍",
					package_uninstalled = "◍",
				},
				keymaps = {
					toggle_package_expand = "<CR>",
					install_package = "i",
					update_package = "u",
					check_package_version = "c",
					update_all_packages = "U",
					check_outdated_packages = "C",
					uninstall_package = "X",
					cancel_installation = "<C-c>",
					apply_language_filter = "<C-f>",
				},
			},
		})

		-- LSP Implementations
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local on_attach = function(client)
			-- Highlight document depending on cursor position
			if client.server_capabilities.documentHighlightProvider then
				vim.cmd([[
            augroup document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
			end

			-----------------------------------------------------------
			-- Keymaps:
			-----------------------------------------------------------
			local key = vim.keymap.set
			local default_opts = { noremap = true, silent = true }

			-- LSP finder
			key(
				"n",
				"gh",
				"<cmd>Lspsaga finder<CR>",
				{ noremap = true, silent = true, desc = "Find the Symbol Definition implement Reference" }
			)

			-- Go to next/prev LSP diagnostic
			key("n", "<C-p>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", default_opts)
			key("n", "<C-n>", "<cmd>Lspsaga diagnostic_jump_next<CR>", default_opts)

			-- Peek definition
			key(
				"n",
				"gd",
				"<cmd>Lspsaga peek_definition<CR>",
				{ noremap = true, silent = true, desc = "Find Peek Definition" }
			)

			-- Hover doc
			key("n", "K", "<cmd>Lspsaga hover_doc<CR>", default_opts)

			-- Rename
			key("n", "gr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, desc = "Rename" })

			-- Call hierarcy
			key(
				"n",
				"gi",
				"<cmd>Lspsaga incoming_calls<CR>",
				{ noremap = true, silent = true, desc = "Incoming calls" }
			)
			key(
				"n",
				"go",
				"<cmd>Lspsaga outgoing_calls<CR>",
				{ noremap = true, silent = true, desc = "Outgoing calls" }
			)

			-- Code actions
			key(
				{ "n", "v" },
				"<leader>ca",
				"<cmd>Lspsaga code_action<CR>",
				{ noremap = true, silent = true, desc = "Show Code Actions" }
			)

			-- LSP outline
			key(
				"n",
				"<leader>o",
				"<cmd>Lspsaga outline<CR>",
				{ noremap = true, silent = true, desc = "Toggle Outline Diagnostics" }
			)

			-- LSP show line diagnostics
			key(
				"n",
				"<leader>cd",
				"<cmd>Lspsaga show_line_diagnostics<CR>",
				{ noremap = true, silent = true, desc = "Show Line Diagnostics" }
			)
		end

		local handlers = {
			-- Handling all LSP
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
			--Overrding LSP
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					root_dir = function(fname)
						return nil
					end,
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
		}

		lsp_installer.setup({
			ensure_installed = {
				"pyright",
				"lua_ls",
				"ts_ls",
				"cssls",
				"jsonls",
				"bashls",
				"html",
			},
			automatic_installation = false,
			handlers = handlers,
		})
	end,
}
