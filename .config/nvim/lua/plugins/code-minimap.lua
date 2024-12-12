return {
  "wfxr/minimap.vim",
  build = "cargo install --locked code-minimap",
  dependencies = {
    "folke/snacks.nvim", -- for the toggling
    version = "*",
  },
  config = function()
    vim.g.minimap_left = 1
    -- local colorbuddy = require("colorbuddy")
    -- local colors = colorbuddy.colors
    -- local Group = colorbuddy.Group
    -- Group.new("minimapCursor", colors.secondary, colors.noir_9)
    -- Group.new("minimapRange", colors.primary, colors.background)
    -- vim.g.minimap_enable_highlight_colorgroup = 1
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.g.minimap_enabled == nil then
          vim.g.minimap_enabled = 0
        end
      end,
    })
    local minimap_toggle = Snacks.toggle.new({
      name = "Minimap",
      map = {},
      which_key = true,
      get = function()
        return vim.g.minimap_enabled == 1
      end,
      notify = false,
      set = function(state)
        if state then
          vim.g.minimap_enabled = 1
          vim.cmd("Minimap")
        else
          vim.g.minimap_enabled = 0
          vim.cmd("MinimapClose")
        end
      end,
    })
    minimap_toggle:map("<leader>um", { desc = "Toggle Minimap" })
  end,
}
