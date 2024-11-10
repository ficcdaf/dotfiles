return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "-",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>-",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<leader>L",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<F1>",
    },
  },
}
