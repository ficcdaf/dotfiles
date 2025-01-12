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
      transparent = false,
      colors = {
        -- background = "#121212",
        -- background = "#131313",
        -- background = "#000000",
        -- background = "#1e1d2d",
      },
      hl = {
        -- force_override = { Cursor = { nil, "#FFFFFF" } },
        merge_override = {
          -- Normal = { nil, "#000000" },
          -- FlashLabel = { nil, "#FFFFFF" },
        },
      },
      plugins = {
        autoload = true,
        override = { "flash" },
      },
      terminal = {
        enabled = true,
        colors = {
          -- [4] = "#FFFFFF",
        },
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
