-- Ok, this plugin is really awesome!
-- And everyone should know about it -- game changer!!!
return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = function()
    require("which-key").add({
      { "<leader>n", group = "+NoNeckPain" },
    })
    return {
      width = 120,
      mappings = {
        enabled = true,
      },
      autocmds = {
        enableOnVimEnter = true,
        skipEnteringNoNeckPainBuffer = false,
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
