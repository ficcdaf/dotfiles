vim.opt_local.breakindent = true
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  buffer = 0,
  command = "silent! write",
})
