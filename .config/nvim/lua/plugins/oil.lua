local detail = false

function _G.get_oil_winbar()
  local dir = require("oil").get_current_dir()
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
  "stevearc/oil.nvim",
  event = "User DirOpened",
  cmd = "Oil",
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open Oil" },
    { "_", "<CMD>Oil --float<CR>", desc = "Open Oil Floating" },
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
    win_options = {
      winbar = "%!v:lua.get_oil_winbar()",
    },
    -- columns = {
    --   "icon",
    --   -- "size",
    --   -- TODO:
    --   -- Add a keybind to toggle permissions view?
    --   -- There's a recipe for this in the docs
    --   -- "permissions",
    -- },
    view_options = {
      is_hidden_file = require("oil-extras").handle_git,
    },
    keymaps = {
      ["<BS>"] = "actions.parent",
      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
