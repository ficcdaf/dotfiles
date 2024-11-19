local opts = {
  obsidian_server_address = "https://localhost:27124",
  scroll_sync = false, -- See "Sync of buffer scrolling" section below
}
return {
  "oflisback/obsidian-bridge.nvim",
  -- disable for now because paths aren't working
  enabled = false,
  config = function()
    require("obsidian-bridge").setup()
  end,
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
