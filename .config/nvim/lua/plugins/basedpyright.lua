return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        analysis = {
          typeCheckingMode = "standard",
        },
      },
    },
  },
}
