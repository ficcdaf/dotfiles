local function mapPrefix(prefix, enabled)
  require("which-key").add({
    { prefix, group = "+NoNeckPain" },
  })
  local M = {
    toggle = "p",
    toggleLeftSide = "ql",
    toggleRightSide = "qr",
    widthUp = "=",
    widthDown = "-",
    scratchPad = "s",
  }

  return M
end
-- Ok, this plugin is really awesome!
-- And everyone should know about it -- game changer!!!
return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = function()
    return {
      width = 120,
      mappings = mapPrefix("<leader>N", true),
      -- mappings = {
      --   enabled = true,
      -- },
      autocmds = {
        enableOnVimEnter = true,
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
