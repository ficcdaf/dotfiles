vim.opt_local.breakindent = true
vim.opt_local.scrolloff = 4
-- vim.opt_local.number = false
-- vim.opt_local.relativenumber = false
-- vim.opt_local.textwidth = 80
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  buffer = 0,
  command = "silent! write",
})
vim.keymap.set("n", "}", function()
  require("orgmode").action("org_mappings.next_visible_heading")
  vim.cmd("normal! zz")
end)
vim.keymap.set("n", "{", function()
  require("orgmode").action("org_mappings.previous_visible_heading")
  vim.cmd("normal! zz")
end)
-- vim.api.nvim_create_autocmd({ "CursorMoved" }, {
--   buffer = 0,
--   callback = function()
--     vim.cmd("normal! zz")
--   end,
-- })
vim.keymap.set("n", "<localleader>f", function()
  vim.cmd("%s/\\s\\+$//e")
end, { desc = "Trim trailing whitespace" })
-- vim.keymap.set("n", "{", "{zz", { remap = true })
-- vim.keymap.set("n", "}", "}zz", { remap = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("%s/\\s\\+$//e")
--   end,
-- })
