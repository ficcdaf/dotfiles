-- TODO: turn this into a plugin? lol
local M = {}

function M.command(command_name)
  vim.cmd('call feedkeys(":' .. command_name .. ' ", "n")')
end

return M
