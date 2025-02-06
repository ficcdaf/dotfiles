return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  enabled = false,
  keys = {
    {
      "<Esc>",
      function()
        local mc = require("multicursor-nvim")
        if not mc.cursorsEnabled() then
          mc.enableCursors()
          print("enabling")
        elseif mc.hasCursors() then
          mc.clearCursors()
          print("clearing")
        else
          -- Default <esc> handler.
          print("def")
          vim.cmd("noh")
          LazyVim.cmp.actions.snippet_stop()
          return "<esc>"
        end
      end,
    },
    {
      { "n", "v" },
      "<S-up>",
      function()
        require("multicursor-nvim").lineAddCursor(-1)
      end,
    },
    {
      { "n", "v" },
      "<S-down>",
      function()
        require("multicursor-nvim").lineAddCursor(1)
      end,
    },
    {
      { "n", "v" },
      "<leader><up>",
      function()
        require("multicursor-nvim").lineSkipCursor(-1)
      end,
    },
    {
      { "n", "v" },
      "<leader><down>",
      function()
        require("multicursor-nvim").lineSkipCursor(1)
      end,
    },
  },
  config = true,
}
