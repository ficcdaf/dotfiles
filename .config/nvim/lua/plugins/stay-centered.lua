return {
  "arnamak/stay-centered.nvim",
  opts = {
    enabled = false,
  },
  keys = {
    {
      "<C-Cr>s",
      function()
        require("stay-centered").toggle()
      end,
      mode = { "v", "n" },
      desc = "Toggle stay-centered",
    },
  },
}
