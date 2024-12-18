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
    local opts = {
      builtin_marks = { ".", "<", ">", "^" },
      mappings = {},
    }
    require("marks").setup(opts)
  end,
}
