vim.b.autoformat = false
vim.keymap.set("n", "<leader>test", function()
  dd(vim.b.autoformat)
end)
