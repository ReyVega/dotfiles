-----------------------------------------------------------
-- Null-ls configuration file
-----------------------------------------------------------

-- Plugin: null-ls.nvim

-- https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        ---------------------------------------------------------------------------------
        -- Formatters
        ---------------------------------------------------------------------------------

        -- javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars"
        formatting.prettierd,

        -- "c", "cpp", "cs", "java", "cuda"
        formatting.clang_format,

        -- python
        formatting.black,

        -- lua
        formatting.stylua,

        -- JSON
        formatting.jq,

        -- Markdown
        formatting.markdownlint,

        -- Go
        formatting.gofumpt,
    },
})
