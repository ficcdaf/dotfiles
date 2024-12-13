local chat_opts = {
  auto_insert_mode = false,
  question_header = "  Fic",
  answer_header = "  Copilot ",
  window = {
    width = 0.4,
  },
}
return {
  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
    opts = function()
      -- require("copilot.command").disable()
      -- local cptoggle = Snacks.toggle.new({
      --   name = "Copilot",
      --   -- map = vim.keymap.set,
      --   which_key = true,
      --   get = function()
      --     return not require("copilot.client").is_disabled()
      --   end,
      --   notify = true,
      --   set = function(state)
      --     if state then
      --       require("copilot.command").enable()
      --     else
      --       require("copilot.command").disable()
      --     end
      --   end,
      -- })
      -- Snacks.toggle.map(cptoggle, "<leader>at", { desc = "Toggle Copilot" })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    keys = {
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "v" },
      },
      -- Show prompts actions with telescope
      -- { "<leader>ap", M.pick("prompt"), desc = "Prompt Actions (CopilotChat)", mode = { "n", "v" } },
      config = function()
        local chat = require("CopilotChat")

        vim.api.nvim_create_autocmd("BufEnter", {
          pattern = "copilot-chat",
          callback = function()
            vim.opt_local.relativenumber = false
            vim.opt_local.number = false
            vim.opt_local.spell = false
          end,
        })

        chat.setup(chat_opts)
      end,
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    -- event = "Buf",
    lazy = true,
    opts = {
      suggestion = {
        enabled = false,
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
