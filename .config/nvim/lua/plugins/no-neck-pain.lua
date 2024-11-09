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
    }
  end,
}
