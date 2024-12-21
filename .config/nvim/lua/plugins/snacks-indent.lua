return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      enabled = true,
      only_current = true,
      filter = function(buf)
        if vim.bo[buf].filetype == "markdown" then
          return false
          -- local rm = require("render-markdown").enabled
          -- -- vim.notify(tostring(rm))
          -- if rm then
          --   return false
          -- end
        end
        return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
      end,
    },
  },
}
