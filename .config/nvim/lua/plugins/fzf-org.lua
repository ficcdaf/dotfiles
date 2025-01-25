return {
  "0xzhzh/fzf-org.nvim",
  lazy = false, -- lazy loading is handled internally
  dependencies = {
    "ibhagwan/fzf-lua",
    "nvim-orgmode/orgmode",
  },
  keys = {
    -- example keybindings
    {
      "<leader>og",
      function()
        require("fzf-org").orgmode()
      end,
      desc = "org-browse",
    },
    {
      "<leader>of",
      function()
        require("fzf-org").files()
      end,
      desc = "org-files",
    },
    {
      "<leader>or",
      function()
        require("fzf-org").refile_to_file()
      end,
      desc = "org-refile",
    },
  },
  opts = {
    prompt = "Org > ",
  },
}
