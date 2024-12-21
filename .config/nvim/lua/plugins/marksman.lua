return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = "marksman",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },
}
