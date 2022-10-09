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

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_ok then return end


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
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

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

lsp_installer.setup_handlers {
    function (server_name)
        local opts = {
            capabilities = capabilities,
            on_attach = on_attach
        }
        lspconfig[server_name].setup(opts)
    end
}
