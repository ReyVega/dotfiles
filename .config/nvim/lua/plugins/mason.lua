-----------------------------------------------------------
-- LSP installer configuration file
-----------------------------------------------------------

-- Plugin: mason.nvim

-- https://github.com/williamboman/mason.nvim


local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then return end

local lsp_installer_ok, lsp_installer = pcall(require, 'mason-lspconfig')
if not lsp_installer_ok then return end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then return end

lsp_installer.setup({
    ensure_installed = {},
    automatic_installation = false,
})

mason.setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍"
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
    install_root_dir = vim.fn.stdpath("data").."/mason",
    pip = {
        install_args = {},
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    github = {
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.setup_handlers {
    function (server_name)
        local opts = {
            capabilities = capabilities
        }
        lspconfig[server_name].setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
    end
}
