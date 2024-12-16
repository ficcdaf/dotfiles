return {
  "stevearc/oil.nvim",
  -- lazy = false,
  -- event = "VimEnter",
  event = "FileExplorer",
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open Oil" },
  },
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
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
