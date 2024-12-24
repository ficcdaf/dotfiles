return {
  "Wansmer/treesj",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  -- event = "VimEnter",
  opts = {
    use_default_keymaps = false,
  },
  keys = {
    {
      "<leader>ct",
      function()
        require("treesj").toggle()
      end,
      { desc = "Treesj Toggle" },
    },
    -- { "<leader>cts", function() require("treesj").split() end, { desc = "Treesj Split" } },
    -- { "<leader>ctj", function() require("treesj").join() end, { desc = "Treesj Join" } },
  },
}
