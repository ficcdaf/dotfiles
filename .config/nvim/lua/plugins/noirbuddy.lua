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
        local noiropts = {
          -- preset = "miami-nights",
          styles = {
            italic = true,
            bold = true,
            underline = true,
            undercurl = false,
          },
          colors = {
            -- secondary = "#379393",
            -- secondary = "#994848",
            -- secondary = "#B45959",
            -- secondary = "#215858",
            -- secondary = "#B34242",
            secondary = "#BD4C4C",
            primary = "#933737",
            diagnostic_error = "#AC2020",
            diagnostic_warning = "#ff7700",
            diagnostic_info = "#d5d5d5",
            diagnostic_hint = "#d5d5d5",
            diff_add = "#f5f5f5",
            diff_change = "#737373",
            diff_delete = "#AC2020",
          },
        }
        require("noirbuddy").setup(noiropts)
        local colorbuddy = require("colorbuddy")

        local Color = colorbuddy.Color
        local colors = colorbuddy.colors
        local Group = colorbuddy.Group
        local groups = colorbuddy.groups
        local styles = colorbuddy.styles
        Color.new("error", "#AC2020")
        Color.new("warn", "#f79000")
        Color.new("warnborder", "#79491d")
        Color.new("infoborder", "#215858")
        Color.new("complement", "#379393")
        -- Override specific highlight groups
        Group.new("NotifyINFOBorder", colors.infoborder)
        Group.new("NotifyINFOTitle", colors.complement)
        Group.new("NotifyINFOIcon", colors.complement)
        Group.new("NotifyWARNBorder", colors.warnborder)
        Group.new("NotifyWARNTitle", colors.warn)
        Group.new("NotifyWARNIcon", colors.warn)
        Group.new("NotifyERRORBorder", colors.error)
        Group.new("NotifyERRORTitle", colors.error)
        Group.new("NotifyERRORIcon", colors.error)
        Group.new("ErrorMsg", colors.noir_1, colors.error)
        Group.new("SpellBad", nil, nil, styles.undercurl)
        Group.new("String", colors.primary, nil, nil)

        -- Group.new("ObsidianExtLinkIcon", colors.primary, nil, styles.bold)
        -- Group.new("ObsidianRef", colors.primary, nil, styles.underline + styles.bold)
        -- Group.new("ObsidianRefText", colors.primary, nil, styles.underline + styles.bold)
        -- Group.new("ObsidianBullet", colors.secondary, nil, styles.bold)
        -- Group.new("ObsidianDone", colors.secondary, nil, styles.bold)
        -- Group.new("ObsidianTodo", colors.secondary, nil, styles.bold)
        -- Group.new("ObsidianTag", colors.secondary, nil, styles.italic)
      end,
    },
  },
}
