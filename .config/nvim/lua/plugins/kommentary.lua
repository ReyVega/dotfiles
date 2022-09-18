-----------------------------------------------------------
-- Comments plugin
-----------------------------------------------------------

-- Plugin: kommentary

-- https://github.com/b3nj5m1n/kommentary


local kommentary_ok, kommentary = pcall(require, "kommentary.config")
if not kommentary_ok then return end

kommentary.configure_language("default", {
    prefer_single_line_comments = true,
})
