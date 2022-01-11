-----------------------------------------------------------
-- LSP installer configuration file
-----------------------------------------------------------

-- Plugin: nvim-lsp-installer
-- https://github.com/williamboman/nvim-lsp-installer

local lsp_installer = require("nvim-lsp-installer")

-- Provide settings first!
lsp_installer.settings {
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
	-- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
	-- servers that are requested to be installed will be put in a queue.
	max_concurrent_installers = 4,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities
    }
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
