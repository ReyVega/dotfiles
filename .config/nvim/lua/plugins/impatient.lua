-----------------------------------------------------------
-- Speed up startup plugin
-----------------------------------------------------------

-- Plugin: impatient.nvim

-- https://github.com/lewis6991/impatient.nvim

local impatient_ok, _ = pcall(require, "impatient")
if not impatient_ok then
	return
end

require("impatient")
