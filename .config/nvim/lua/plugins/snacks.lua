return {
  "folke/snacks.nvim",
  --   priority = 1000,
  opts = {
    zen = {
      toggles = {
        dim = false,
        git_signs = false,
        mini_diff_signs = false,
        diagnostics = false,
        inlay_hints = true,
      },
    },
    --     bigfile = {
    --       notify = true,
    --       size = 1.5 * 1024 * 1024, -- 1.5MB
    --       ---@param ctx {buf: number, ft:string}
    --       setup = function(ctx)
    --         vim.b.minianimate_disable = true
    --         vim.cmd("set conceallevel=0")
    --         vim.cmd("TSBufDisable highlight")
    --         vim.opt_local.foldenable = false
    --         vim.cmd("NoMatchParen")
    --         vim.opt_local.cursorline = false
    --         vim.opt_local.signcolumn = "no"
    --         vim.opt_local.spell = false
    --         vim.schedule(function()
    --           vim.bo[ctx.buf].syntax = ctx.ft
    --         end)
    --       end,
    --     },
  },
}
