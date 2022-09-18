-----------------------------------------------------------
-- Null-ls configuration file
-----------------------------------------------------------

-- Plugin: null-ls.nvim

-- https://github.com/jose-elias-alvarez/null-ls.nvim


local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then return end


null_ls.setup({
    sources = {
        ---------------------------------------------------------------------------------
        -- Formatters
        ---------------------------------------------------------------------------------

        -- javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars"
        null_ls.builtins.formatting.prettierd,

        -- "c", "cpp", "cs", "java", "cuda"
        null_ls.builtins.formatting.clang_format,

        -- python
        null_ls.builtins.formatting.black,

        -- lua
        null_ls.builtins.formatting.stylua,

        -- JSON
        null_ls.builtins.formatting.jq,

        -- Markdown
        null_ls.builtins.formatting.markdownlint,

        -- Go
        null_ls.builtins.formatting.gofumpt
    }
})
