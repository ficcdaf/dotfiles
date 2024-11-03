-- #0f0f0f
-- #933737
-- #A23D3D
-- #994848
-- #7B7F80
-- #7C8080
-- #8D8D8D
-- #d4d4d4
-- #949494
-- #933737
-- #A23D3D
-- #994848
-- #7B7F80
-- #7C8080
-- #8D8D8D
-- #d4d4d4
local noiropts = {
  -- preset = "miami-nights",
  colors = {
    primary = "#994848",
    secondary = "#933737",
    -- background = "#0f0f0f",
    diagnostic_error = "#EC0034",
    diagnostic_warning = "#ff7700",
    diagnostic_info = "#d5d5d5",
    diagnostic_hint = "#f5f5f5",
    diff_add = "#f5f5f5",
    diff_change = "#737373",
    diff_delete = "#EC0034",
  },
}
return {
  {
    "jesseleite/nvim-noirbuddy",
    lazy = false,
    dependencies = {
      { "tjdevries/colorbuddy.nvim" },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("noirbuddy").setup(noiropts)
      end,
    },
  },
}
