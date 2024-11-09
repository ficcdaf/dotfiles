return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = function()
    require("which-key").add({
      { "<leader>n", group = "+NoNeckPain" },
    })
    return {
      mappings = {
        enabled = true,
      },
      autocmds = {
        enableOnVimEnter = true,
        skipEnteringNoNeckPainBuffer = false,
      },
      buffers = {
        scratchPad = {
          enabled = true,
          pathToFile = "~/SyncDocuments/scratch.md",
        },
      },
    }
  end,
}
