return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  opts = {
    anti_conceal = {
      enabled = true,
    },
    code = {
      -- sign = false,
      -- width = "block",
      -- right_pad = 1,
    },
    heading = {
      -- width = "block",
      -- left_pad = 2,
      -- right_pad = 4,
      -- sign = false,
      -- icons = {},
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
        else
          m.disable()
        end
      end,
    }):map("<leader>um")
  end,
}
