return {
  "folke/noice.nvim",
  opts = {
    -- recipe to ignore progress messages from
    -- the ltex lsp
    routes = {
      {
        filter = {
          event = "lsp",
          kind = "progress",
          cond = function(message)
            local client = vim.tbl_get(message.opts, "progress", "client")
            return client == "ltex"
          end,
        },
        opts = { skip = true },
      },
    },
  },
}
