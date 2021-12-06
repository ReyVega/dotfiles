-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp

local cmp = require('cmp')
local luasnip = require('luasnip')

-- Require to download codicons.ttf
-- AUR package https://aur.archlinux.org/packages/vscode-codicons-git/
-- Manually https://github.com/microsoft/vscode-codicons/blob/main/dist/codicon.ttf
local cmp_kinds = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet =  "",
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
}

cmp.setup {
  -- load snippet support
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

     -- VS Code icons for completion
    formatting = {
        fields = { "kind", "abbr" },
        format = function(_, vim_item)
            vim_item.kind = cmp_kinds[vim_item.kind] or ""
            return vim_item
        end,
    },

    -- completion settings
    completion = {
        completeopt = 'menu,menuone,noinsert',
        keyword_length = 2
    },

    -- key mapping
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },

        -- Tab mapping
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,

        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
    },

    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },

    -- load sources
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'cmp_git' },
        { name = 'buffer' },
        { name = 'nvim_lua'},
        { name = 'rg' },
        { name = 'npm', keyword_length = 4 },
    },
}

-- completion for commands
cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' },
    }
})

-- completion when searching in current buffer
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

require("cmp_git").setup()

-- Friendly snippets
require("luasnip/loaders/from_vscode").lazy_load()
