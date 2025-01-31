vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  buffer = 0,
  command = "silent! write",
})
-- vim.keymap.set("i", "<Cr>", function()
--   local md_utils = require("md-utils")
--   local isList = md_utils.isCursorInList()
--   if isList then
--     vim.api.nvim_command("MDListItemBelow")
--   else
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true)
--   end
-- end, { desc = "Continue List", silent = true, remap = true })
vim.opt_local.wrap = true
vim.opt_local.spell = true
