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
      desc = "Scroll Down (insert mode)",
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
      desc = "Scroll Up (Insert mode)",
      mode = { "i" },
    },
    {
      "<C-e>",
      function()
        require("noice").cmd("dismiss")
      end,
      silent = true,
      expr = true,
      desc = "Dismiss Popups (insert mode)",
      mode = { "i" },
    },
    {
      "<C-y>",
      function()
        require("noice.lsp").signature()
      end,
      silent = true,
      expr = true,
      desc = "Show LSP signature help (insert mode)",
      mode = { "i" },
    },
    {
      "<C-y>",
      function()
        require("noice").cmd("dismiss")
      end,
      silent = true,
      expr = true,
      desc = "Dismiss Popups (normal mode)",
      mode = { "n" },
    },
  },
}
