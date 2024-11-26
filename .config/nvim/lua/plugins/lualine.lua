local function getWords()
  local wc = vim.api.nvim_eval("wordcount()")
  local w = "w:"
  if wc["visual_words"] then
    return w .. wc["visual_words"]
  else
    return w .. wc["words"]
  end
end
local sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch", "diff" },
  lualine_c = { { "filename", path = 1 } },
  lualine_x = { "diagnostics", { "filetype", colored = false }, { getWords } },
  lualine_y = { "progress" },
  lualine_z = { "location" },
}
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "jesseleite/nvim-noirbuddy",
  },
  config = function()
    local noirbuddy_lualine = require("noirbuddy.plugins.lualine")
    local theme = noirbuddy_lualine.theme
    local nb_inactive_sections = noirbuddy_lualine.inactive_sections
    require("lualine").setup({
      options = {
        theme = theme,
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
      },
      sections = sections,
      inactive_sections = nb_inactive_sections,
    })
  end,
}
