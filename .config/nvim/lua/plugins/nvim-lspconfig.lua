-----------------------------------------------------------
-- LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig

-- https://github.com/neovim/nvim-lspconfig

local lspconfig_ok, _ = pcall(require, "lspconfig")
if not lspconfig_ok then
    return
end

-- Customizing gutter signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Customizing how diagnostics are displayed
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

-- Colors and type of underline for diagnostics
vim.api.nvim_command([[ hi DiagnosticUnderlineError cterm=underline gui=undercurl guisp=#BF616A ]])
vim.api.nvim_command([[ hi DiagnosticUnderlineHint cterm=underline  gui=undercurl guisp=#B988B0 ]])
vim.api.nvim_command([[ hi DiagnosticUnderlineWarn cterm=underline  gui=undercurl guisp=#D08F70 ]])
vim.api.nvim_command([[ hi DiagnosticUnderlineInfo cterm=underline  gui=undercurl guisp=#A3BE8C ]])

vim.api.nvim_command([[ hi LspReferenceText cterm=bold gui=bold guibg=#3F4754 ]])
vim.api.nvim_command([[ hi LspReferenceRead cterm=bold gui=bold guibg=#3F4754 ]])
vim.api.nvim_command([[ hi LspReferenceWrite cterm=bold gui=bold guibg=#3F4754 ]])
