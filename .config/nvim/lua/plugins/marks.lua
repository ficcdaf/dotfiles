return {
  "chentoast/marks.nvim",
  enabled = true,
  event = "VeryLazy",
  config = function()
    local function fmt_prefix(prefix, mappings)
      local out = {}
      for k, v in pairs(mappings) do
        out[k] = prefix .. v[1]
        require("which-key").add({ out[k], desc = v[2] })
      end
      return out
    end
    local map = {
      toggle = { "t", "Toggle next mark at cursor" },
      set_next = { "m", "Set next mark at cursor" },
      delete = { "D", "Delete mark" },
      delete_buf = { "db", "Delete all mark in buffer" },
      delete_line = { "da", "Delete all mark in line" },
      next = { ".", "Next mark" },
      prev = { ",", "Prev mark" },
    }
    local opts = {
      builtin_marks = { ".", "^" },
      mappings = fmt_prefix("<leader>m", map),
    }
    require("marks").setup(opts)
  end,
}
