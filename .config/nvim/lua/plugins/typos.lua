return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {
          init_options = {
            diagnosticSeverity = "Warning",
          },
          autostart = false,
          -- filetypes = {
          --   "markdown",
          -- },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "typos_lsp" } },
  },
}
