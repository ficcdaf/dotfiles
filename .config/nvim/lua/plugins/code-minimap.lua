return {
  "wfxr/minimap.vim",
  build = "cargo install --locked code-minimap",
  config = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        vim.b.minimap_enabled = 0
      end,
    })
    local minimap_toggle = Snacks.toggle.new({
      name = "Minimap",
      -- map = vim.keymap.set,
      which_key = true,
      get = function()
        return vim.b.minimap_enabled == 1
      end,
      notify = true,
      set = function(state)
        if state then
          vim.b.minimap_enabled = 1
          vim.cmd("Minimap")
        else
          vim.b.minimap_enabled = 0
          vim.cmd("MinimapClose")
        end
      end,
    })
    Snacks.toggle.map(minimap_toggle, "<leader>um", { desc = "Toggle Minimap" })
  end,
}
