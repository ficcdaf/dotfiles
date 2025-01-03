return {
  "catgoose/nvim-colorizer.lua",
  -- enabled = false,
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
