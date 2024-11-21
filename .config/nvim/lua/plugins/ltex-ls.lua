local extraOpts = {
  init_check = true,
  load_langs = {
    "en",
    "en-US",
    "en-CA",
  },
  path = vim.fn.expand("~") .. "/.local/share/ltex",
  log_level = "none",
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
          autostart = false,
          -- filetypes = {
          --   "tex",
          -- },
          on_attach = function(client, bufnr)
            require("ltex_extra").setup(extraOpts)
          end,
          settings = {
            ltex = {
              completionEnabled = true,
              language = { "en", "en-US", "en-CA" },
              enabled = {
                "latex",
                "tex",
                "bib",
                "md",
                "markdown",
              },
              -- markdown = {
              --   nodes = {
              --     CodeBlock = "ignore",
              --     FencedCodeBlock = "ignore",
              --     AutoLink = "dummy",
              --     Code = "dummy",
              --   },
              -- },
              checkFrequency = { "write" },
              diagnosticSeverity = "information",
              sentencetCacheSize = 5000,
              additionalRules = {
                enablePickyRules = true,
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
