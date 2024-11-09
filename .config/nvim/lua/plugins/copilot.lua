return {
  {
    "zbirenbaum/copilot-cmp",
    opts = function()
      local copilot_toggle = require("lazyvim.util.toggle").wrap({
        name = "Copilot Completion",
        get = function()
          return not require("copilot.client").is_disabled()
        end,
        set = function(state)
          if state then
            require("copilot.command").enable()
          else
            require("copilot.command").disable()
          end
        end,
      })

      -- disable by default
      require("copilot.command").disable()
      local cpt = Snacks.toggle.new({
        name = "Copilot",
        map = vim.keymap.set,
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
      -- LazyVim.toggle.map("<leader>at", copilot_toggle)
    end,
  },
  { "CopilotC-Nvim/CopilotChat.nvim", opts = {
    auto_insert_mode = false,
  } },
}
