<h1>VS Neovim</h1>
<img src="../../screenshots/neovim-logo.png" />

---

<h2>Configuration structure (Lua)</h2>

```text
📂 ~/.config/nvim
├── 📂 lua
│   ├── 📂 plugins
│   │   ├── 🌑 alpha.lua
│   │   ├── 🌑 bufferline.lua
│   │   ├── 🌑 indent-blanklineb.lua
│   │   ├── 🌑 lsp-installer.lua
│   │   ├── 🌑 lspconfig.lua
│   │   ├── 🌑 lualine.lua
│   │   ├── 🌑 nvim-cmp.lua
│   │   ├── 🌑 nvim-tree.lua
│   │   ├── 🌑 telescope.lua
│   │   ├── 🌑 toggleterm.lua
│   │   └── 🌑 treesitter.lua
│   ├── 🌑 mappings.lua
│   ├── 🌑 plugins.lua
│   └── 🌑 settings.lua
└── 🌑 init.lua
```

---

<h2>Plugins</h2>
<table>
    <tr>
        <th>Plugin Manager</th>
        <td>packer</td>
    </tr>
    <tr>
        <th>Startup</th>
        <td>alpha-nvim</td>
    </tr>
    <tr>
        <th>Statusline</th>
        <td>lualine</td>
    </tr>
    <tr>
        <th>Icons</th>
        <td>nvim-web-devicons</td>
    </tr>
    <th>Colors</th>
        <td>nvim-colorizer</td>
    </tr>
    <tr>
        <th>Cursor</th>
        <td>nvim-cursorline</td>
    </tr>
    <tr>
        <th>Indent</th>
        <td>indent-blankline</td>
    </tr>
    <tr>
        <th>Comments</th>
        <td>kommentary</td>
    </tr>
    <tr>
        <th>Formatter</th>
        <td>neoformat</td>
    </tr>
    <tr>
        <th>Markdown</th>
        <td>nvim-markdown-preview</td>
    </tr>
    <tr>
        <th>Terminal Integration</th>
        <td>nvim-toggleterm</td>
    </tr>
    <tr>
        <th>File explorer</th>
        <td>nvim-tree</td>
    </tr>
    <tr>
        <th>Tabline</th>
        <td>
            bufferline<br><br>
            <b>Utilities</b><br>
            bufdel
        </td>
    </tr>
    <tr>
        <th>Colorscheme</th>
        <td>
            onenord (default)<br>
            tokyonight<br>
            onedarkpro
        </td>
    </tr>
    <tr>
        <th>Fuzzy Finder</th>
        <td>
            telescope<br><br>
            <b>Extensions</b><br>
            telescope-fzf-native
        </td>
    </tr>
    <tr>
        <th>LSP</th>
        <td>
            nvim-lspconfig <br>
            nvim-lsp-installer
        </td>
    </tr>
    <tr>
        <th>Syntax</th>
        <td>nvim-treesitter</td>
    </tr>
    <tr>
        <th>Snippet</th>
        <td>LuaSnip</td>
    </tr>
    <tr>
        <th>Git Gutter</th>
        <td>gitsigns</td>
    </tr>
    <tr>
        <th>Completion</th>
        <td>
            nvim-cmp <br><br>
            <b>Sources</b><br>
            cmp-nvim-lsp<br>
            cmp-luasnip<br>
            cmp-path<br>
            cmp-git<br>
            cmp-buffer<br>
            cmp-nvim-lua<br>
            cmp-rg<br>
            cmp-spell<br>
            cmp-npm<br><br>
            <b>Icons</b><br>
            lspkind (VS Code)
        </td>
    </tr>
    <tr>
        <th>Editing Support</th>
        <td>
            nvim-autopairs<br>
            nvim-ts-autotags<br>
            vim-matchup
        </td>
    </tr>
</table>

---

<h2>Neovim screenshots</h2>
<h3>Startup (alpha-nvim)</h3>
<img src="../../screenshots/neovim-startup.png"></img>
<h3>File Explorer (nvim-tree)</h3>
<img src="../../screenshots/neovim-tree.png"></img>
<h3>LSP Diagnostics (nvim-lspconfig)</h3>
<img src="../../screenshots/neovim-lsp.png"></img>
<h3>Fuzzy Finder (telescope)</h3>
<img src="../../screenshots/neovim-telescope.png"></img>
<h3>Terminal (toggleterm)</h3>
<img src="../../screenshots/neovim-terminal.png"></img>


