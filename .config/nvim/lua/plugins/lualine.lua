-- local noirbuddy_lualine = require("noirbuddy.plugins.lualine")
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "jesseleite/nvim-noirbuddy",
  },
  config = function()
    local noirbuddy_lualine = require("noirbuddy.plugins.lualine")
    local theme = noirbuddy_lualine.theme
    local sections = noirbuddy_lualine.sections
    local inactive_sections = noirbuddy_lualine.inactive_sections
    require("lualine").setup({
      options = {
        theme = theme,
      },
      sections = sections,
      inactive_sections = inactive_sections,
    })
  end,
}
