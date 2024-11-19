return {
  {
    "barreiroleo/ltex_extra.nvim",
    opts = {
      load_langs = {
        "en",
        "en-US",
        "en-CA",
      },
      path = vim.fn.expand("~") .. "/.local/share/ltex",
      log_level = "warn",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          settings = {
            ltex = {
              language = "en",
              enabled = {
                "latex",
                "tex",
                "bib",
                "md",
                "markdown",
              },
              -- checkFrequency = { "save" },
              -- diagnosticSeverity = "information",
              -- sentencetCacheSize = 5000,
              -- additionalRules = {
              --   enablePickyRules = true,
              --   motherTongue = "en",
              -- },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "ltex" } },
  },
}
