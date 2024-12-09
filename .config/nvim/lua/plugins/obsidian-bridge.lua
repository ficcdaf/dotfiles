local function ssl(opt)
  if opt then
    return "https://127.0.0.1:27124/"
  else
    return "http://127.0.0.1:27123"
  end
end
local opts = {
  obsidian_server_address = ssl(true),
  -- obsidian_server_address = "https://localhost:27124",
  cert_path = "/home/fic/.ssl/obsidian-bridge.pem",
}
return {
  "oflisback/obsidian-bridge.nvim",
  enabled = true,
  dev = true,
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
