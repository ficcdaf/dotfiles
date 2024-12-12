return {
  "wfxr/minimap.vim",
  build = "cargo install --locked code-minimap",
  dependencies = {
    "folke/snacks.nvim", -- for the toggling
    version = "*",
  },
  -- keys = {
  --   {"<leader>um", minimap_toggle.}
  -- }
  config = function()
    -- local minimap_toggle = Snacks.toggle.new({
    local minimap_toggle = Snacks.toggle({
      name = "Minimap",
      map = {},
      -- keys = "<leader>um",
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
    vim.g.minimap_left = 1
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.g.minimap_enabled == nil then
          vim.g.minimap_enabled = 0
        end
      end,
    })
    -- minimap_toggle:map("<leader>um")
    vim.inspect(minimap_toggle)
  end,
}
