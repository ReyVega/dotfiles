-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- Default theme
local status_ok, color_scheme = pcall(require, "onenord")
if not status_ok then
  return
end

color_scheme.load()
