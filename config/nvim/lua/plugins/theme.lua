-- vhs80 colorscheme (single theme, no switching)
return {
  { "tahayvr/vhs80.nvim", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vhs80",
    },
  },
}
