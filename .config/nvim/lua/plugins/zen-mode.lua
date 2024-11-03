return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      options = {
        signcolumn = "no",
        -- number = false,
        -- relativenumber = false,
        -- cursorline = false,
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      options = {},
      twilight = { enabled = false },
      kitty = {
        enabled = false,
        -- enabled = true,
        font = "+4",
      },
    },
  },
}
