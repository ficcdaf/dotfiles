vim.opt_local.breakindent = true
vim.opt_local.scrolloff = 4
-- vim.opt_local.textwidth = 80
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  buffer = 0,
  command = "silent! write",
})
vim.keymap.set("n", "<localleader>f", function()
  vim.cmd("%s/\\s\\+$//e")
end, { desc = "Trim trailing whitespace" })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("%s/\\s\\+$//e")
--   end,
-- })
