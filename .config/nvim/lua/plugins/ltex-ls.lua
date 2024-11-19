return {
  {
    "neovim/nvim-lspconfig",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "ltex" } },
  },
}
