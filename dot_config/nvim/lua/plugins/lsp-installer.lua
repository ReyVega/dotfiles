-----------------------------------------------------------
-- LSP installer configuration file
-----------------------------------------------------------

-- Plugin: nvim-lsp-installer
-- https://github.com/williamboman/nvim-lsp-installer

local lsp_installer = require("nvim-lsp-installer")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

lsp_installer.on_server_ready(function(server)
    local opts = { capabilities = capabilities}
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

