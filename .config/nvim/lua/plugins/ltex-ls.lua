local extraOpts = {
  init_check = true,
  load_langs = {
    "en",
    "en-US",
    "en-CA",
  },
  path = vim.fn.expand("~") .. "/.local/share/ltex",
  -- log_level = "warn",
}
return {
  {
    "barreiroleo/ltex_extra.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          on_attach = function(client, bufnr)
            require("ltex_extra").setup(extraOpts)
          end,
          settings = {
            ltex = {
              language = { "en", "en-US", "en-CA" },
              enabled = {
                "latex",
                "tex",
                "bib",
                "md",
                "markdown",
              },
              checkFrequency = { "save" },
              diagnosticSeverity = "information",
              sentencetCacheSize = 5000,
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
