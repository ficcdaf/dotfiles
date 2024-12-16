-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       basedpyright = {
--         settings = {
--           analysis = {
--             typeCheckingMode = "off",
--             inlayHints = {
--               genericTypes = true,
--             },
--           },
--         },
--       },
--     },
--   },
-- }
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
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
