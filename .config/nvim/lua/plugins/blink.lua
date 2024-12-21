local follow_main = false
if follow_main then
  vim.g.lazyvim_blink_main = true
end

return {
  { "giuxtaposition/blink-cmp-copilot", enabled = false },
  {
    "saghen/blink.cmp",
    -- opts_extend = {"sources"},
    opts = {
      sources = {
        default = { "lsp", "snippets", "markdown", "lazydev", "buffer" },
        providers = {
          markdown = { name = "RenderMarkdown", module = "render-markdown.integ.blink" },
        },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        list = {
          selection = "manual",
        },
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        menu = { border = "single" },
        -- menu = {
        --   draw = {
        --     treesitter = true,
        --   },
        -- },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          treesitter_highlighting = true,
          window = {
            border = "single",
            -- winhighlight = require("ashen.plugins.blink").winhighlight,
            -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
        ghost_text = {
          enabled = true,
        },
      },
      signature = {
        enabled = false,
      },
      keymap = {
        -- Available commands:
        --   show, hide, cancel, accept, select_and_accept, select_prev, select_next, show_documentation, hide_documentation,
        --   scroll_documentation_up, scroll_documentation_down, snippet_forward, snippet_backward, fallback
        preset = "none",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-CR>"] = { "select_and_accept", "fallback" },
        ["<C-e>"] = { "hide", "show" },
        ["<C-y>"] = { "hide", "show" },
        -- ["<C-l>"] = { "select_prev", "fallback" },
        -- ["<C-h>"] = { "select_next", "fallback" },
        -- ["<C-L>"] = { "scroll_documentation_up" },
        -- ["<C-H>"] = { "scroll_documentation_down" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },
    },
  },
}
