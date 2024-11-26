local modes = {
  NORMAL = "NRM",
  INSERT = "INS",
  VISUAL = "VIS",
  ["V-LINE"] = "V-L",
  ["V-BLOCK"] = "V-B",
  SELECT = "SEL",
  ["S-LINE"] = "S-L",
  ["S-BLOCK"] = "S-B",
  COMMAND = "CMD",
  TERMINAL = "TRM",
  ["O-PENDING"] = "O-P",
  EX = "EX",
  REPLACE = "REP",
  ["V-REPLACE"] = "V-R",
}

local word_count_filetypes = {
  markdown = true,
  txt = true,
  tex = true,
}

local wc_cache = ""
local function update_word_count()
  local ft = vim.bo.filetype
  local wc = vim.api.nvim_eval("wordcount()")
  local w = "w:"
  if word_count_filetypes[ft] then
    if wc["visual_words"] then
      wc_cache = w .. wc["visual_words"]
    else
      wc_cache = w .. wc["words"]
    end
  else
    wc_cache = ""
  end
end
local sections = {
  lualine_a = {
    {
      "mode",
      fmt = function(str)
        return modes[str] or str
      end,
    },
  },
  lualine_b = { "branch", "diff" },
  lualine_c = { { "filename", path = 1 } },
  lualine_x = { "diagnostics", { "filetype", colored = false }, {
    function()
      return wc_cache
    end,
  } },
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

    vim.api.nvim_create_autocmd(
      { "TextChanged", "TextChangedI", "CursorHold" },
      { pattern = "*", callback = update_word_count }
    )

    require("lualine").setup({
      options = {
        theme = theme,
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = sections,
      inactive_sections = nb_inactive_sections,
    })
  end,
}
