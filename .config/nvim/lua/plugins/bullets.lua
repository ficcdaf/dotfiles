return {
  "bullets-vim/bullets.vim",
  keys = {
    {
      "<CR>",
      "<Plug>(bullets-newline)",
      mode = "i",
      ft = "markdown",
    },
    {
      "<S-CR>",
      "<CR>",
      mode = "i",
      ft = "markdown",
      remap = false,
    },
  },
  init = function()
    vim.g.bullets_enabled_file_types = { "markdown" }
    vim.g.bullets_enable_in_empty_buffers = 0
    vim.g.bullets_set_mappings = 0
  end,
}
