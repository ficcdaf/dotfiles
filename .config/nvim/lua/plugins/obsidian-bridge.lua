local opts = {
  obsidian_server_address = "https://127.0.0.1:27124",
  cert_path = "~/.ssl/obsidian-bridge.pem",
}
return {
  "oflisback/obsidian-bridge.nvim",
  -- disable for now because paths aren't working
  enabled = true,
  dev = true,
  -- config = function()
  --   require("obsidian-bridge").setup(opts)
  -- end,
  opts = opts,
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
