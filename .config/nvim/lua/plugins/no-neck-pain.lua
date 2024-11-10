local function mapPrefix(prefix, enabled)
  local M = {
    enabled = enabled,
    toggle = "<Leader>np",
    -- Sets a global mapping to Neovim, which allows you to toggle the left side buffer.
    -- When `false`, the mapping is not created.
    --- @type string
    toggleLeftSide = "<Leader>nql",
    -- Sets a global mapping to Neovim, which allows you to toggle the right side buffer.
    -- When `false`, the mapping is not created.
    --- @type string
    toggleRightSide = "<Leader>nqr",
    -- Sets a global mapping to Neovim, which allows you to increase the width (+5) of the main window.
    -- When `false`, the mapping is not created.
    --- @type string | { mapping: string, value: number }
    widthUp = "<Leader>n=",
    -- Sets a global mapping to Neovim, which allows you to decrease the width (-5) of the main window.
    -- When `false`, the mapping is not created.
    --- @type string | { mapping: string, value: number }
    widthDown = "<Leader>n-",
    -- Sets a global mapping to Neovim, which allows you to toggle the scratchPad feature.
    -- When `false`, the mapping is not created.
    --- @type string
    scratchPad = "<Leader>ns",
  }

  return M
end
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
