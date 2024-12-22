return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  dependencies = {
    "ficcdaf/ashen.nvim",
  },
  opts = {
    user_default_options = {
      names = true,
      names_custom = function()
        local ashen = require("ashen.colors")
        return ashen
      end,
    },
  },
}
