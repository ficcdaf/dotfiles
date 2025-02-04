-- TODO: add trailblazer highlight groups to ashen
return {
  "LeonHeidelbach/trailblazer.nvim",
  enabled = true,
  dev = true,
  event = "UIEnter",
  config = function()
    vim.cmd("hi TrailBlazerTrailMark guibg=#FFFFFF")
    local hl_groups = require("which-key").add({
      { "<leader>m", group = "Trailblazer" },
    })
    local function fmt_prefix(prefix, mappings)
      local out = {}
      for k, v in pairs(mappings) do
        out[k] = prefix .. v[1]
        require("which-key").add({ out[k], desc = v[2] })
      end
      return out
    end
    local motions_map = {
      new_trail_mark = { "m", "New Trail Mark" },
      track_back = { "b", "Track Back" },
      peek_move_next_down = { "n", "Peek Move Next Down" },
      peek_move_previous_up = { "e", "Peek Move Prev Up" },
      move_to_nearest = { "w", "Move To Nearest" },
      toggle_trail_mark_list = { "l", "Toggle Trail Mark List" },
    }
    local actions_map = {
      delete_all_trail_marks = { "d", "Delete All Trail Marks" },
      paste_at_last_trail_mark = { "p", "Paste At Last Trail Mark" },
      paste_at_all_trail_marks = { "P", "Paste At All Trail Marks" },
      set_trail_mark_select_mode = { "v", "Set Trail Mark Select Mode" },
      switch_to_next_trail_mark_stack = { ".", "Switch To Next Trail Mark Stack" },
      switch_to_previous_trail_mark_stack = { ",", "Switch To Previous Trail Mark Stack" },
      set_trail_mark_stack_sort_mode = { "s", "Set Trail Mark Stack Sort Mode" },
    }
    local opts = {
      force_mappings = {
        nv = {
          motions = fmt_prefix("<leader>m", motions_map),
          actions = fmt_prefix("<leader>m", actions_map),
        },
      },
      trail_options = {
        default_trail_mark_stacks = {
          "stack1",
          "stack2",
          "stack3",
        },
      },
    }
    require("trailblazer").setup(opts)
    require("ashen.plugins").load_plugin("trailblazer")
  end,
}
