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
        return require("ashen.colors")
      end,
    },
  },
}
