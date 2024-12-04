local opts = {
  -- obsidian_server_address = "https://localhost:27124",
  obsidian_server_address = "http://127.0.0.1:27123/",
  scroll_sync = false, -- See "Sync of buffer scrolling" section below
}
return {
  "oflisback/obsidian-bridge.nvim",
  -- disable for now because paths aren't working
  enabled = true,
  config = function()
    require("obsidian-bridge").setup(opts)
  end,
  -- opts = opts,
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
