-----------------------------------------------------------
-- Startup configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim

-- https://github.com/goolord/alpha-nvim

local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then
	return
end

local dashboard_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not dashboard_ok then
	return
end

-- Colors Header
vim.api.nvim_command([[ hi StartLogo1 guifg=#5E81AC ]])
vim.api.nvim_command([[ hi StartLogo2 guifg=#5E81AC ]])
vim.api.nvim_command([[ hi StartLogo3 guifg=#5E81AC ]])
vim.api.nvim_command([[ hi StartLogo4 guifg=#5E81AC ]])
vim.api.nvim_command([[ hi StartLogo5 guifg=#5E81AC ]])
vim.api.nvim_command([[ hi StartLogo6 guifg=#5E81AC ]])
vim.api.nvim_command([[ hi StartLogo7 guifg=#5E81AC ]])
vim.api.nvim_command([[ hi StartLogo8 guifg=#5E81AC ]])

-- Colors
vim.api.nvim_command([[ hi AlphaButton guifg=#A3BE8C ]])
vim.api.nvim_command([[ hi AlphaButtonShortcut guifg=#D08770 ]])
vim.api.nvim_command([[ hi AlphaFooter guifg=#EBCB8B ]])

-- Setup button
local function button(sc, txt, keybind, keybind_opts)
	local b = dashboard.button(sc, txt, keybind, keybind_opts)
	b.opts.hl = { { "AlphaButton", 2, 3 } }
	b.opts.hl_shortcut = "AlphaButtonShortcut"
	return b
end

-- Setup footer
local function footer()
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   " .. version.major .. "." .. version.minor .. "." .. version.patch
	return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

-- Header
local header = {
	[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
	[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
	[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
	[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
	[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}

-- Colorize header
local function colorize_header()
	local lines = {}
	for i, chars in pairs(header) do
		local line = {
			type = "text",
			val = chars,
			opts = {
				hl = "StartLogo" .. i,
				shrink_margin = false,
				position = "center",
			},
		}
		table.insert(lines, line)
	end
	return lines
end

-- Menu
dashboard.section.buttons.val = {
	button("n", "  New file", "<Cmd>ene <BAR> startinsert<CR>"),
	button("f", "  Find file", "<Cmd>Telescope find_files<CR>"),
	button("r", "  Recently used files", "<Cmd>Telescope oldfiles<CR>"),
	button("u", "  Update plugins", "<Cmd>PackerSync<CR>"),
	button("a", "  LSP servers", "<Cmd>Mason<CR>"),
	button("s", "  Settings", "<Cmd>e $MYVIMRC | :cd %:p:h<CR>"),
	button("q", "  Quit", "<Cmd>qa!<CR>"),
}

-- Footer
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "AlphaFooter"

-- Disable many features only when being in the dashboard
-- to make prettier the interface
vim.api.nvim_create_autocmd("User", {
	group = group,
	pattern = "AlphaReady",
	callback = function()
		vim.opt.showtabline = 0
		vim.opt.laststatus = 0
		vim.opt.showmode = false
		vim.opt.showcmd = false
		vim.opt.ruler = false
	end,
})

vim.api.nvim_create_autocmd("BufUnload", {
	group = group,
	pattern = "<buffer>",
	callback = function()
		vim.opt.showtabline = 2
		vim.opt.laststatus = 2
		vim.opt.showmode = true
		vim.opt.showcmd = true
		vim.opt.ruler = true
	end,
})

-- Setup
alpha.setup({
	layout = {
		{ type = "padding", val = 4 },
		{ type = "group", val = colorize_header() },
		{ type = "padding", val = 4 },
		dashboard.section.buttons,
		{ type = "padding", val = 2 },
		dashboard.section.footer,
	},
	opts = { margin = 5 },
})
