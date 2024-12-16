local M = {}

local defaults = {
  font_maps = {
    enabled = true,
    scale_factor = 1.1,
  },
}

M.setup = function(opts)
  opts = vim.tbl_extend("force", defaults, opts or {})
  if opts.font_maps.enabled then
    local change_scale_factor = function(delta)
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-+>", function()
      change_scale_factor(opts.font_maps.scale_factor)
    end)
    vim.keymap.set("n", "<C-=>", function()
      change_scale_factor(1 / opts.font_maps.scale_factor)
    end)
  end

  print("Setup goes here")
end

return M
