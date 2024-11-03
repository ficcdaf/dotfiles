-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd("let &t_ut=''")
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.breakindent = true
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<M-i>",
      "__<Left>",
      { desc = "Markdown: Italics", noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(0, "i", "<M-d>", "- [ ] ", { desc = "Markdown: Task", noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<M-a>",
      "<Esc>I# ",
      { desc = "Markdown: Heading", noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<M-r>",
      "<Esc>I## ",
      { desc = "Markdown: Heading", noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<M-s>",
      "<Esc>I### ",
      { desc = "Markdown: Heading", noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<M-t>",
      "<Esc>I#### ",
      { desc = "Markdown: Heading", noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<M-g>",
      "<Esc>I##### ",
      { desc = "Markdown: Heading", noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<M-b>",
      "****<Left><Left>",
      { desc = "Markdown: Bold", noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<M-e>",
      "<Esc>I- ",
      { desc = "Markdown: Bullet Point", noremap = true, silent = true }
    )
    local wk = require("which-key")
    wk.add({
      { "<M-i>", mode = "i", desc = "Markdown Italics" },
      { "<M-b>", mode = "i", desc = "Markdown Bold" },
    })
  end,
})
