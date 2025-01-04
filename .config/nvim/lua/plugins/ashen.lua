return {
  {
    -- dir = "~/dev/plugins/ashen.nvim/",
    "ficcdaf/ashen.nvim",
    -- only for debugging
    -- dependencies = {
    --   "folke/snacks.nvim",
    -- },
    dev = true,
    opts = {
      colors = {
        background = "#121212",
        -- background = "#000000",
      },
      hl = {
        -- Normal = {
        --   "#FFFFFF",
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
