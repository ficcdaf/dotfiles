return {
  "folke/noice.nvim",
  event = "VeryLazy",
  -- dependencies = {
  --   "rcarriga/nvim-notify",
  -- },
  -- opts = {
  --   -- recipe to ignore progress messages from
  --   -- the ltex lsp
  --   routes = {
  --     {
  --       filter = {
  --         event = "lsp",
  --         kind = "progress",
  --         cond = function(message)
  --           -- local client = vim.tbl_get(message.opts, "progress", "client")
  --           local client = vim.tbl_get(message.opts, "client")
  --           return client == "ltex"
  --         end,
  --       },
  --       opts = { skip = true },
  --     },
  --     {
  --       filter = {
  --         event = "msg_show",
  --         kind = "",
  --         find = "written",
  --       },
  --       opts = { skip = true },
  --     },
  --   },
  -- },
}
