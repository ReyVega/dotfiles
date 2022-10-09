-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '700' })
    end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
    pattern = '*',
    command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
    group = 'setIndent',
    pattern = {
        'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
        'yaml', 'typescriptreact', 'javascriptreact', 'json'
    },
    command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Enter insert mode when switching to terminal
autocmd('TermOpen', {
    command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
    pattern = '*',
    command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
    pattern = 'term://*',
    command = 'stopinsert'
})
