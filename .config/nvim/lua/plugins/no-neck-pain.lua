local function mapPrefix(prefix, enabled)
  -- create the WK group for the prefix
  require("which-key").add({
    { prefix, group = "+NoNeckPain" },
  })
  -- define the suffix mappings
  local mappings = {
    toggle = "n",
    toggleLeftSide = "ql",
    toggleRightSide = "qr",
    widthUp = "=",
    widthDown = "-",
    scratchPad = "s",
  }
  -- concat prefix and suffix
  for action, suffix in pairs(mappings) do
    mappings[action] = prefix .. suffix
  end
  -- include the enabled flag
  mappings.enabled = enabled
  return mappings
end
-- Ok, this plugin is really awesome!
-- And everyone should know about it -- game changer!!!
return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  enabled = true,
  opts = function()
    return {
      width = 90,
      mappings = mapPrefix("<C-Cr>", true),
      -- mappings = {
      --   enabled = true,
      -- },
      autocmds = {
        enableOnVimEnter = false,
        skipEnteringNoNeckPainBuffer = true,
      },
      buffers = {
        left = {
          scratchPad = {
            enabled = false,
            pathToFile = "~/SyncDocuments/scratch-l.md",
          },
        },
        right = {
          scratchPad = {
            enabled = false,
            pathToFile = "~/SyncDocuments/scratch-r.md",
          },
        },
      },
    }
  end,
}
