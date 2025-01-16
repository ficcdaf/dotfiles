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
        -- default = { "lsp", "snippets", "path", "markdown", "lazydev", "buffer" },
        default = { "lsp", "snippets", "path", "lazydev", "buffer" },
        providers = {
          -- markdown = { name = "RenderMarkdown", module = "render-markdown.integ.blink" },
          orgmode = {
            name = "Orgmode",
            module = "orgmode.org.autocompletion.blink",
          },
        },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        -- menu = { border = "single" },
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
        -- ["<C-e>"] = { "hide", "show", "fallback" },
        -- ["<C-n>"] = { "snippet_forward", "show", "fallback" },
        preset = "none",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<C-Cr>"] = { "select_and_accept", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-n>"] = { "snippet_forward", "show" },
        ["<C-y>"] = { "show_documentation", "hide_documentation", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-p>"] = { "snippet_backward", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },
    },
  },
}
