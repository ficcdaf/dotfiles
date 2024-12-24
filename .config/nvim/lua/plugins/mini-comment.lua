return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  opts = {
    options = {
      custom_commentstring = function()
        return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
      end,
    },
    -- hooks = {
    --   pre = function()
    --     dd(vim.fn.mode())
    --   end,
    --   post = function()
    --     if vim.api.nvim_get_mode().mode == "V" then
    --       vim.cmd("normal! gv")
    --     end
    --   end,
    -- },
  },
}
-- arstarstarst
