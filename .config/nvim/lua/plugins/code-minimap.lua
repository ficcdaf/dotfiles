return {
  "wfxr/minimap.vim",
  build = "cargo install --locked code-minimap",
  dependencies = {
    "folke/snacks.nvim", -- for the toggling
  },
  config = function()
    vim.g.minimap_left = 1
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.g.minimap_enabled == nil then
          vim.g.minimap_enabled = 0
        end
      end,
    })
    local minimap_toggle = Snacks.toggle.new({
      name = "Minimap",
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
    Snacks.toggle.map(minimap_toggle, "<leader>um", { desc = "Toggle Minimap" })
  end,
}
