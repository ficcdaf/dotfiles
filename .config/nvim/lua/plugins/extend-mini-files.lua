return {
  "echasnovski/mini.files",
  lazy = false,
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (current file directory)",
    },
    {
      "<leader>fm",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(LazyVim.root(), true)
      end,
      desc = "Open mini.files (root)",
    },
  },
  opts = {
    mappings = {
      go_in_plus = "<CR>",
      synchronize = ":w",
      -- go_out = "<BS>",
      -- reset = "-",
    },
    options = {
      permanent_delete = false,
      use_as_default_explorer = true,
    },
  },
}
