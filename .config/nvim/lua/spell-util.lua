local M = {}

M.add = function(lang)
  local current = vim.opt.spelllang:get()
  if not vim.tbl_contains(current, lang) then
    table.insert(current, lang)
  end
  vim.opt.spelllang = current
end

return M
