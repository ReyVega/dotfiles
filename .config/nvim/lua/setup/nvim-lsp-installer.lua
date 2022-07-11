-----------------------------------------------------------
-- LSP installer configuration file
-----------------------------------------------------------

-- Plugin: nvim-lsp-installer
-- https://github.com/williamboman/nvim-lsp-installer

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings {
    ensure_installed = {},
    automatic_installation = false,
    ui = {
        check_outdated_servers_on_open = true,
        border = "rounded",
        icons = {
            server_installed = "◍",
            server_pending = "◍",
            server_uninstalled = "◍",
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
        },
    },
    pip = {
        install_args = {},
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    github = {
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
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
