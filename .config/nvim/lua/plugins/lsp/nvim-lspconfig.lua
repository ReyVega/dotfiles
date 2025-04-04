-----------------------------------------------------------
-- LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig

-- https://github.com/neovim/nvim-lspconfig

return {
	"neovim/nvim-lspconfig",
	event = "BufEnter",
	config = function()
		local _ = require("lspconfig")

		-- Customize lsp ui windows
		require("lspconfig.ui.windows").default_options.border = "rounded"

		-- Customizing how diagnostics are displayed
		vim.diagnostic.config({
			virtual_text = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ", -- Customize error sign
					[vim.diagnostic.severity.WARN] = " ", -- Customize warning sign
					[vim.diagnostic.severity.INFO] = " ", -- Customize info sign
					[vim.diagnostic.severity.HINT] = " ", -- Customize hint sign
				},
			},
		})

		-- Colors and type of underline for diagnostics
		vim.api.nvim_command([[ hi DiagnosticUnderlineError cterm=underline gui=undercurl guisp=#BF616A ]])
		vim.api.nvim_command([[ hi DiagnosticUnderlineHint cterm=underline  gui=undercurl guisp=#B988B0 ]])
		vim.api.nvim_command([[ hi DiagnosticUnderlineWarn cterm=underline  gui=undercurl guisp=#D08F70 ]])
		vim.api.nvim_command([[ hi DiagnosticUnderlineInfo cterm=underline  gui=undercurl guisp=#A3BE8C ]])

		-- Colors for LSP references
		vim.api.nvim_command([[ hi LspReferenceText cterm=bold gui=bold guibg=#3F4754 ]])
		vim.api.nvim_command([[ hi LspReferenceRead cterm=bold gui=bold guibg=#3F4754 ]])
		vim.api.nvim_command([[ hi LspReferenceWrite cterm=bold gui=bold guibg=#3F4754 ]])

		-- Colors for LspInfo border
		vim.api.nvim_command([[ hi LspInfoBorder guifg=#5E81AC ]])
	end,
}
