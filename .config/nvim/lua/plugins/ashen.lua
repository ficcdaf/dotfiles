return {
  {
    -- dir = "~/dev/plugins/ashen.nvim/",
    "ficcdaf/ashen.nvim",
    -- only for debugging
    dependencies = {
      "folke/snacks.nvim",
    },
    dev = true,
    opts = {
      transparent = true,
      colors = {
        -- background = "#121212",
        -- background = "#131313",
        -- background = "#000000",
        -- background = "#1e1d2d",
      },
      hl = {
        force_override = { Cursor = { nil, "#FFFFFF" } },
        -- soft_override = { Normal = { "#FFFFFF" } },
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
