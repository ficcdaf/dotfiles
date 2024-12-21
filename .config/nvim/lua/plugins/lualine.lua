return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "ficcdaf/ashen.nvim",
  },
  opts = function()
    local ashen = require("ashen.plugins.lualine").lualine_opts
    ashen.extensions = { "lazy", "fzf" }
    return ashen
  end,
}
