local M = {}

M.config = {
  special = "←",
  remap = "<C-Cr>",
}

M.setup = function(opts)
  M.config = vim.tbl_extend("force", M.config, opts)
end

return M
