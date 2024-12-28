local corne = {
  "x x x x x x _ x x x x x x",
  "x x x x x x _ x x x x x x",
  "x x x x x x _ x x x x x x",
  "_ _ _ x x x _ x x x _ _ _",
}
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "devicetree",
      },
    },
  },
  {
    "codethread/qmk.nvim",
    opts = {
      name = "corne",
      layout = corne,
      variant = "zmk",
    },
  },
}
