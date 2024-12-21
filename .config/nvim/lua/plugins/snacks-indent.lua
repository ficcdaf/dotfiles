return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      enabled = true,
      only_current = true,
      filter = function(buf)
        return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
      end,
    },
  },
}
