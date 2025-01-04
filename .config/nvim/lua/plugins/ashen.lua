return {
  {
    -- dir = "~/dev/plugins/ashen.nvim/",
    "ficcdaf/ashen.nvim",
    -- only for debugging
    -- dependencies = {
    --   "folke/snacks.nvim",
    -- },
    dev = true,
    colors = { background = "#000000" },
    opts = {
      hl = {
        -- Normal = {
        --   "#000000",
        -- },
      },
    },
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
