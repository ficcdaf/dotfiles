local M = {}

M.isCursorInList = function()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*[%-%*%+]%s+") or line:match("^%s*%d+%.%s+") then
    return true
  end
  return false
end

return M
