return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    presets = {
      lsp_doc_border = true,
    },
  },
  keys = {
    {
      "<c-d>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-d>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Forward",
      mode = { "i" },
    },
    {
      "<c-u>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-u>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Backward",
      mode = { "i" },
    },
    {
      "<C-y>",
      function()
        require("noice").cmd("dismiss")
      end,
      silent = true,
      expr = true,
      desc = "Dismiss Noice",
      mode = { "i" },
    },
  },
}
