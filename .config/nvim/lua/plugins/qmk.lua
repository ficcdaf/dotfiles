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
    ft = "dts",
    opts = function()
      local corne = {
        "x x x x x x _ x x x x x x",
        "x x x x x x _ x x x x x x",
        "x x x x x x _ x x x x x x",
        "_ _ _ x x x _ x x x _ _ _",
      }
      local o = { name = "corne", layout = corne, variant = "zmk" }
      vim.keymap.set({ "n" }, "<localleader>f", "<CMD>QMKFormat<CR>", { desc = "Format keymap." })
      return o
    end,
  },
}
