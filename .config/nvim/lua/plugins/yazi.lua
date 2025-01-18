return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  enabled = true,
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>yy",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>yu",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<leader>yl",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "g?",
    },
  },
}
