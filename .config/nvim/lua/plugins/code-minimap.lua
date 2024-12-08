return {
  "wfxr/minimap.vim",
  build = "cargo install --locked code-minimap",
  config = function()
    local cptoggle = Snacks.toggle.new({
      name = "Copilot",
      -- map = vim.keymap.set,
      which_key = true,
      get = function()
        return not require("copilot.client").is_disabled()
      end,
      notify = true,
      set = function(state)
        if state then
          require("copilot.command").enable()
        else
          require("copilot.command").disable()
        end
      end,
    })
    Snacks.toggle.map(cptoggle, "<leader>at", { desc = "Toggle Copilot" })
  end,
}
