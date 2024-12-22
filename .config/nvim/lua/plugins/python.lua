return {
  {
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
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "basedpyright", "debugpy", "black" },
    },
  },
}
