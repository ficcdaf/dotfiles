return {
  "ficcdaf/ashen.nvim",
  enabled = true,
  dev = true,
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("ashen").setup()
      end,
    },
  },
}
