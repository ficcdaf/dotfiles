local extraOpts = {
  init_check = true,
  load_langs = {
    "en",
  },
  path = vim.fn.expand("~") .. "/.config/ltex",
  log_level = "none",
}
return {
  {
    "barreiroleo/ltex_extra.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = "tex",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          autostart = true,
          filetypes = {
            "tex",
          },
          on_attach = function(client, bufnr)
            require("ltex_extra").setup(extraOpts)
          end,
          settings = {
            ltex = {
              completionEnabled = true,
              language = { "en" },
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
              additionalRules = {
                enablePickyRules = true,
                languageModel = "~/ngrams/",
              },
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
