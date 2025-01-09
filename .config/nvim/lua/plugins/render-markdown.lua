local icons = {
  abstract = { "", "", "", "" },
  -- weather = {"", ""},
  weather = { "", "", "", "", "", "" },
  md = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
}
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  enabled = true,
  opts = {
    indent = {
      enabled = false,
      -- skip_level = 0,
    },
    anti_conceal = {
      enabled = true,
      ignore = {
        code_background = true,
        sign = true,
      },
    },
    code = {
      -- sign = false,
      width = "block",
      right_pad = 1,
    },
    heading = {
      width = "block",
      left_pad = 2,
      right_pad = 4,
      -- sign = false,
      -- icons = icons.weather,
      icons = icons.md,
    },
    bullet = {
      icons = { "•", "∙" },
    },
    latex = {
      enabled = false,
    },
  },
  ft = { "markdown", "rmd", "vimwiki" },
  config = function(_, opts)
    require("render-markdown").setup(opts)
    Snacks.toggle({
      name = "Render Markdown",
      get = function()
        return require("render-markdown.state").enabled
      end,
      set = function(enabled)
        local m = require("render-markdown")
        if enabled then
          m.enable()
          Snacks.indent.disable()
        else
          m.disable()
          Snacks.indent.enable()
        end
      end,
    }):map("<leader>um")
  end,
}
