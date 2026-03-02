-- Load omarchy-nvim (LazyVim-based package) and apply theme on top.
local pkg = "/usr/share/omarchy-nvim"
if vim.fn.isdirectory(pkg) == 1 then
  vim.opt.rtp:prepend(pkg)
  dofile(pkg .. "/init.lua")
  -- Theme overlay: applied via lua/plugins/theme.lua (loaded by package's lazy spec).
else
  -- Fallback when package not installed: minimal lazy + theme only.
  require("config.lazy")
end
