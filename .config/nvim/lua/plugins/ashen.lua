return {
  {
    -- dir = "~/dev/plugins/ashen.nvim/",
    "ficcdaf/ashen.nvim",
    -- only for debugging
    -- dependencies = {
    --   "folke/snacks.nvim",
    -- },
    dev = true,
    -- opts = {
    --   -- colors = { blue = "#ffffff" },
    --   -- hl = {},
    -- },
  },
  {
    "LazyVim/LazyVim",
    -- dependencies = {
    --   "fiddaf/ashen.nvim",
    -- },
    opts = {
      colorscheme = "ashen",
    },
  },
}
