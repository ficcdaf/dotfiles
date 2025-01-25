return {
  "0xzhzh/fzf-org.nvim",
  lazy = false, -- lazy loading is handled internally
  dependencies = {
    "ibhagwan/fzf-lua",
    "nvim-orgmode/orgmode",
  },
  keys = {
    {
      "<leader>ofh",
      function()
        require("fzf-org").orgmode()
      end,
      desc = "Org Headlines",
    },
    {
      "<leader>off",
      function()
        require("fzf-org").files()
      end,
      desc = "Org Files",
    },
    {
      "<leader>ofr",
      function()
        require("fzf-org").refile_to_file()
      end,
      desc = "Org Refile",
    },
  },
  opts = function()
    local wk = require("which-key")
    wk.add({
      {
        "<leader>of",
        group = "fzf org",
      },
    })
    return {}
  end,
}
