vim.opt_local.breakindent = true
vim.opt_local.textwidth = 80
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  buffer = 0,
  command = "silent! write",
})
