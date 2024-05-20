-----------------------------------------------------------
-- Tabline configuration file
-----------------------------------------------------------

-- Plugin: bufferline and nvim-bufdel

-- https://github.com/akinsho/bufferline.nvim
-- https://github.com/famiu/bufdelete.nvim

return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
	event = "BufEnter",
	config = function()
		local bufferline = require("bufferline")
		local _ = require("bufdelete")

		bufferline.setup({
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
				themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
				numbers = "none",
				close_command = "Bwipeout! %d", -- can be a string | function, | false see "Mouse actions"
				right_mouse_command = "Bwipeout! %d", -- can be a string | function | false, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
					-- remove extension from markdown files for example
					if buf.name:match("%.md") then
						return vim.fn.fnamemodify(buf.name, ":t:r")
					end
				end,
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 18,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. n .. sym
					end
					return s
				end, -- NOTE: this will be called a lot so don't do any heavy processing here
				offsets = {
					{
						filetype = "NvimTree",
						text = " File Explorer",
						highlight = "Directory",
						text_align = "center",
					},
				},
				color_icons = true, -- whether or not to add the filetype icon highlights
				show_buffer_icons = true, -- disable filetype icons for buffers
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
				duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
				-- can also be a table containing 2 custom separators
				-- [focused and unfocused]. eg: { '|', '|' }
				separator_style = "slant",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				auto_toggle_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "insert_at_end",
				custom_areas = {
					right = function()
						local result = {}
						local seve = vim.diagnostic.severity
						local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
						local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
						local info = #vim.diagnostic.get(0, { severity = seve.INFO })
						local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

						table.insert(result, { text = "", fg = "#BF616A" })
						table.insert(result, { text = "", fg = "#D08F70" })
						table.insert(result, { text = "", fg = "#B988B0" })
						table.insert(result, { text = "", fg = "#A3BE8C" })

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

		-----------------------------------------------------------
		-- Keymaps:
		-----------------------------------------------------------
		local key = vim.keymap.set
		local default_opts = { noremap = true, silent = true }

		-- Move to next/prev buffer
		key("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>", default_opts)
		key("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", default_opts)

		-- Move current buffer to next/prev position
		key("n", "<PageUp>", "<Cmd>BufferLineMoveNext<CR>", default_opts)
		key("n", "<PageDown>", "<Cmd>BufferLineMovePrev<CR>", default_opts)

		-- Move to buffer position
		key("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", default_opts)
		key("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", default_opts)
		key("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", default_opts)
		key("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", default_opts)
		key("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", default_opts)
		key("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", default_opts)
		key("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", default_opts)
		key("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", default_opts)
		key("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", default_opts)

		-- BufDel (Delete buffers without messing the layout and disable nvim tree deletion)
		local function BufDel()
			if vim.bo.filetype ~= "NvimTree" and vim.bo.filetype ~= "alpha" then
				return "<Cmd>Bwipeout!<CR>"
			end
		end

		key({ "n", "v" }, "<leader>w", BufDel, { noremap = true, expr = true, desc = "Delete Current Buffer" })
	end,
}
