-- local noirbuddy_lualine = require("noirbuddy.plugins.lualine")
local function getWords()
  local wc = vim.api.nvim_eval("wordcount()")
  if wc["visual_words"] then
    return wc["visual_words"]
  else
    return wc["words"]
  end
end
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
