local function retmap()
  local m = {
    inline_surround_toggle = "<leader>mm", -- (string|boolean) toggle inline style
    inline_surround_toggle_line = "<leader>mmm", -- (string|boolean) line-wise toggle inline style
    inline_surround_delete = "<leader>md", -- (string|boolean) delete emphasis surrounding cursor
    inline_surround_change = "<leader>mc", -- (string|boolean) change emphasis surrounding cursor
    -- link_add = "<leader>ml", -- (string|boolean) add link
    -- link_follow = "<leader>mx", -- (string|boolean) follow link
    go_curr_heading = "<leader>mh",
    go_parent_heading = "<leader>mH",
    go_next_heading = "<M-n>",
    go_prev_heading = "<M-e>",
  }
  require("which-key").add({
    { "<leader>m", group = "Markdown" },
  })
  vim.keymap.set("n", "<leader>mu", "<cmd>MDListItemAbove<cr>", { desc = "Insert List Item Above", silent = true })
  vim.keymap.set(
    { "n", "x" },
    "<leader>ml",
    "<cmd>MDResetListNumbering<cr>",
    { desc = "Reset List Numbering", silent = true }
  )
  return m
end
local opts = {
  mappings = retmap(),
}
local spec = {
  "tadmccorkle/markdown.nvim",
  ft = "markdown",
  opts = opts,
}

return spec
