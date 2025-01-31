return {
  "bullets-vim/bullets.vim",
  keys = {
    { "<CR>", "<Plug>(bullets-newline)", mode = "i", ft = "markdown" },
    { "<S-CR>", "<CR>", mode = "i", ft = "markdown", remap = false },
    { "gN", "<Plug>(bullets-renumber)", mode = { "n", "v" }, ft = "markdown" },
    { "<leader>ch", "<Plug>(bullets-toggle-checkbox)", ft = "markdown" },
    { "<C-t>", "<Plug>(bullets-demote)", ft = "markdown", mode = "i" },
    { ">", "<Plug>(bullets-demote)", ft = "markdown", mode = "v" },
    { ">>", "<Plug>(bullets-demote)", ft = "markdown" },
    { "<C-s>", "<Plug>(bullets-promote)", ft = "markdown", mode = "i" },
    { "<", "<Plug>(bullets-promote)", ft = "markdown", mode = "v" },
    { "<<", "<Plug>(bullets-promote)", ft = "markdown" },
  },
  init = function()
    vim.g.bullets_enabled_file_types = { "markdown" }
    vim.g.bullets_enable_in_empty_buffers = 1
    vim.g.bullets_set_mappings = 0
    vim.cmd([[
let g:bullets_custom_mappings = [
  \ ['imap', '<cr>', '<Plug>(bullets-newline)'],
  \ ['inoremap', '<S-cr>', '<cr>'],
  \
  " \ ['nmap', 'o', '<Plug>(bullets-newline)'],
  \
  \ ['vmap', 'gN', '<Plug>(bullets-renumber)'],
  \ ['nmap', 'gN', '<Plug>(bullets-renumber)'],
  \
  \ ['nmap', '<leader>ch', '<Plug>(bullets-toggle-checkbox)'],
  \
  \ ['imap', '<C-t>', '<Plug>(bullets-demote)'],
  \ ['nmap', '>>', '<Plug>(bullets-demote)'],
  \ ['vmap', '>', '<Plug>(bullets-demote)'],
  \ ['imap', '<C-s>', '<Plug>(bullets-promote)'],
  \ ['nmap', '<<', '<Plug>(bullets-promote)'],
  \ ['vmap', '<', '<Plug>(bullets-promote)'],
  \ ]
    ]])
  end,
}
