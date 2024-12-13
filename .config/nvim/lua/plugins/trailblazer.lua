local prefix = "<leader>m"
local function fmt_prefix(mappings)
  local out = {}
  for k, v in pairs(mappings) do
    out[k] = prefix .. v
  end
  return out
end
local opts = {
  force_mappings = {
    nv = {
      motions = fmt_prefix({
        new_trail_mark = "n",
        track_back = "<A-b>",
        peek_move_next_down = "<A-J>",
        peek_move_previous_up = "<A-K>",
        move_to_nearest = "<A-n>",
        toggle_trail_mark_list = "<A-m>",
      }),
      actions = fmt_prefix({
        delete_all_trail_marks = "<A-L>",
        paste_at_last_trail_mark = "<A-p>",
        paste_at_all_trail_marks = "<A-P>",
        set_trail_mark_select_mode = "<A-t>",
        switch_to_next_trail_mark_stack = "<A-.>",
        switch_to_previous_trail_mark_stack = "<A-,>",
        set_trail_mark_stack_sort_mode = "<A-s>",
      }),
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
    -- print(vim.inspect(opts.force_mappings.nv.motions))
  end,
}
