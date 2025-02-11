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
      style = {
        -- italic = false,
      },
      style_presets = {
        italic_comments = true,
        bold_functions = true,
      },
      transparent = true,
      colors = {
        -- background = "#121212",
        -- background = "#131313",
        -- background = "#000000",
        -- background = "#1e1d2d",
      },
      hl = {
        -- force_override = { Cursor = { nil, "#FFFFFF" } },
        link = {
          -- FlashCursor = "Normal",
          -- SomethingFake = "thisisnotreal",
        },
        force_override = {
          DiagnosticUnnecessary = {},
          -- NonText = { "#FFFFFF" },
        },
        merge_override = {
          FloatBorder = { bg = "#000000" }, -- it works
          NormalFloat = { bg = "#000000" }, -- it doesn't works
          -- ["@function"] = { bold = true },
          -- Normal = { italic = true },
          -- Normal = {"red_ember"},
          -- FlashLabel = { nil, "#FFFFFF" },
        },
      },
      plugins = {
        -- autoload = false,
        -- override = { "fzflua" },
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
