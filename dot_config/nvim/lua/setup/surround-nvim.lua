-----------------------------------------------------------
-- Surround plugin
-----------------------------------------------------------

-- Plugin: surround.nvim
-- https://github.com/blackCauldron7/surround.nvim

require"surround".setup {
    context_offset = 100,
    load_autogroups = false,
    mappings_style = "sandwich",
    map_insert_mode = true,
    quotes = {"'", '"'},
    brackets = {"(", '{', '['},
    space_on_closing_char = false,
    pairs = {
        nestable = {{"(", ")"}, {"[", "]"}, {"{", "}"}},
        linear = {{"'", "'"}, {"`", "`"}, {'"', '"'}}
    },
    prefix = "s"
}
