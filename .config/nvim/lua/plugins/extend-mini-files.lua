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
    content = {
      -- hide hidden files by default
      filter = function(fs_entry)
        return not vim.startswith(fs_entry.name, ".")
      end,
    },
    mappings = {
      go_in_plus = "<CR>",
      synchronize = ":w",
      -- close = "q",
      -- go_in = "i",
      -- go_out = "m",
      -- go_out_plus = "M",
      -- mark_goto = "'",
      -- mark_set = "k",
      -- reset = "<BS>",
      -- reveal_cwd = "@",
      -- show_help = "g?",
      -- trim_left = "<",
      -- trim_right = ">",
    },
    options = {
      permanent_delete = false,
      use_as_default_explorer = true,
    },
  },
}
