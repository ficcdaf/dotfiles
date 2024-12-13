local function fmt_prefix(prefix, mappings)
  local out = {}
  for k, v in pairs(mappings) do
    out[k] = prefix .. v[1]
    require("which-key").add({ out[k], desc = v[2] })
  end
  return out
end
local motions_map = {
  new_trail_mark = { "n", "New Trail Mark" },
  track_back = { "b", "Track Back" },
  peek_move_next_down = { "<A-J>", "Peek Move Next Down" },
  peek_move_previous_up = { "<A-K>", "Peek Move Prev Up" },
  move_to_nearest = { "<A-n>", "Move To Nearest" },
  toggle_trail_mark_list = { "<A-m>", "Toggle Trail Mark List" },
}
local actions_map = {
  delete_all_trail_marks = { "<A-L>", "Delete All Trail Marks" },
  paste_at_last_trail_mark = { "<A-p>", "Paste At Last Trail Mark" },
  paste_at_all_trail_marks = { "<A-P>", "Paste At All Trail Marks" },
  set_trail_mark_select_mode = { "<A-t>", "Set Trail Mark Select Mode" },
  switch_to_next_trail_mark_stack = { "<A-.>", "Switch To Next Trail Mark Stack" },
  switch_to_previous_trail_mark_stack = { "<A-,>", "Switch To Previous Trail Mark Stack" },
  set_trail_mark_stack_sort_mode = { "<A-s>", "Set Trail Mark Stack Sort Mode" },
}
local opts = {
  force_mappings = {
    nv = {
      motions = fmt_prefix("<leader>m", motions_map),
      actions = fmt_prefix("<leader>m", actions_map),
    },
  },
}
-- print(vim.inspect(opts.force_mappings.nv.motions))
return {
  "LeonHeidelbach/trailblazer.nvim",
  config = function()
    require("which-key").add({
      { "<leader>m", group = "Trailblazer" },
    })
    require("trailblazer").setup(opts)
  end,
}
