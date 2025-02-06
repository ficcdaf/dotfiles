return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()
    local set = vim.keymap.set
    set({ "n", "v" }, "<S-up>", function()
      mc.lineAddCursor(-1)
    end)
    set({ "n", "v" }, "<S-down>", function()
      mc.lineAddCursor(1)
    end)
    set({ "n", "v" }, "<leader><up>", function()
      mc.lineSkipCursor(-1)
    end)
    set({ "n", "v" }, "<leader><down>", function()
      mc.lineSkipCursor(1)
    end)
  end,
}
