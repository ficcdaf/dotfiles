return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruff = {
        autostart = false,
      },
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
              inlayHints = {
                genericTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
