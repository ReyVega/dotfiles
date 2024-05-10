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
	},
	build = ":MasonUpdate",
	config = function()
		local mason = require("mason")
		local lsp_installer = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		lsp_installer.setup({
			ensure_installed = {},
			automatic_installation = false,
		})

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

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local on_attach = function(client)
			if client.server_capabilities.documentHighlightProvider then
				vim.cmd([[
            augroup document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
			end
		end

		lsp_installer.setup_handlers({
			function(server_name)
				local opts = {
					capabilities = capabilities,
					on_attach = on_attach,
				}
				lspconfig[server_name].setup(opts)
			end,
		})
	end,
}
