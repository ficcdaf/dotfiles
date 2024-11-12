local M = {}

local ts_utils = require("nvim-treesitter.ts_utils")

M.isCursorInList = function()
  local node = ts_utils.get_node_at_cursor()
  while node do
    -- Check if node is a list item
    if node:type() == "list_item" then
      return true
    end
    node = node:parent()
  end
  return false
end

return M
