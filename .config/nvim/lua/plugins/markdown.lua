local function retmap()
  local m = {
    inline_surround_toggle = "<leader>Mm", -- (string|boolean) toggle inline style
    inline_surround_toggle_line = "<leader>Mmm", -- (string|boolean) line-wise toggle inline style
    inline_surround_delete = "<leader>Md", -- (string|boolean) delete emphasis surrounding cursor
    inline_surround_change = "<leader>Mc", -- (string|boolean) change emphasis surrounding cursor
    -- link_add = "<leader>Ml", -- (string|boolean) add link
    -- link_follow = "<leader>Mx", -- (string|boolean) follow link
    go_curr_heading = "<leader>Mh",
    go_parent_heading = "<leader>MH",
    go_next_heading = "<M-n>",
    go_prev_heading = "<M-e>",
  }
  require("which-key").add({
    { "<leader>M", group = "Markdown" },
  })
  vim.keymap.set("n", "<leader>Mu", "<cmd>MDListItemAbove<cr>", { desc = "Insert List Item Above", silent = true })
  vim.keymap.set(
    { "n", "x" },
    "<leader>Ml",
    "<cmd>MDResetListNumbering<cr>",
    { desc = "Reset List Numbering", silent = true }
  )
  return m
end
local spec = {
  "tadmccorkle/markdown.nvim",
  ft = "markdown",
  -- cmd = "MDListItemBelow",
  opts = function()
    local opts = {
      mappings = retmap(),
    }
  end,
}

return spec
