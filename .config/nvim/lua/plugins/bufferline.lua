-----------------------------------------------------------
-- Tabline configuration file
-----------------------------------------------------------

-- Plugin: bufferline and nvim-bufdel

-- https://github.com/akinsho/bufferline.nvim
-- https://github.com/ojroques/nvim-bufdel

local bufferline_ok, bufferline = pcall(require, "bufferline")
if not bufferline_ok then
    return
end

local bufdel_ok, bufdel = pcall(require, "bufdel")
if not bufdel_ok then
    return
end

bufdel.setup({
    next = "alternate", -- or 'cycle, 'alternate'
    quit = false,    -- quit Neovim when last buffer is closed
})

bufferline.setup({
    options = {
        mode = "buffers",             -- set to "tabs" to only show tabpages instead
        numbers = "none",
        close_command = "BufDel! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "BufDel! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,   -- can be a string | function, see "Mouse actions"
        indicator = {
            style = "icon",
            indicator_icon = "▎",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
            if buf.name:match("%.md") then
                return vim.fn.fnamemodify(buf.name, ":t:r")
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or " ")
                s = s .. n .. sym
            end
            return s
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = " File Explorer",
                highlight = "Directory",
                text_align = "center",
                padding = 0,
            },
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = false,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "slant",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
        },
        sort_by = "insert_after_current",

        custom_areas = {
            right = function()
                local result = {}
                local seve = vim.diagnostic.severity
                local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
                local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
                local info = #vim.diagnostic.get(0, {severity = seve.INFO})
                local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

                table.insert(result, {text = "", fg = "#BF616A"})
                table.insert(result, {text = "", fg = "#D08F70"})
                table.insert(result, {text = "", fg = "#B988B0"})
                table.insert(result, {text = "", fg = "#A3BE8C"})

                if error ~= 0 then
                    result[1].text = error .. " "
                end

                if warning ~= 0 then
                    result[2].text = warning .. " "
                end

                if hint ~= 0 then
                    result[3].text = hint .. " "
                end

                if info ~= 0 then
                    result[4].text = info .. " "
                end
                return result
            end,
        },
    },
})
