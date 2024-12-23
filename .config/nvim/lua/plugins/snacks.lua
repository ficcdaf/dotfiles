return {
  "folke/snacks.nvim",
  opts = {
    toggle = {
      notify = false,
    },
    bigfile = {
      notify = true, -- show notification when big file detected
      size = 1.5 * 1024 * 1024, -- 1.5MB
      -- Enable or disable features when big file detected
      ---@param ctx {buf: number, ft:string}
      setup = function(ctx)
        vim.cmd([[NoMatchParen]])
        -- Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
        -- vim.b.minianimate_disable = true
        vim.schedule(function()
          vim.bo[ctx.buf].syntax = ctx.ft
        end)
      end,
    },
    zen = {
      notify = false,
      toggles = {
        dim = false,
        git_signs = false,
        mini_diff_signs = false,
        diagnostics = false,
        inlay_hints = true,
      },
    },
  },
  keys = {
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
  },
}
