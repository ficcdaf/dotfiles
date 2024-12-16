return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    -- { "n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" } },
    { "-", "<CMD>Oil<CR>", desc = "Open Oil" },
  },
  -- opts = {},
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    columns = {
      "icon",
      "size",
      -- TODO:
      -- Add a keybind to toggle permissions view?
      -- There's a recipe for this in the docs
      -- "permissions",
    },
    keymaps = {
      ["<BS>"] = "actions.parent",
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
