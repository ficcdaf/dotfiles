return {
  "NeogitOrg/neogit",
  keys = {
    {
      "<C-g>",
      "<CMD>Neogit<Cr>",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "ibhagwan/fzf-lua", -- optional
  },
  config = true,
}
