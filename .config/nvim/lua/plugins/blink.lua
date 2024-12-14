local follow_main = false
if follow_main then
  vim.g.lazyvim_blink_main = true
end

return {
  { "giuxtaposition/blink-cmp-copilot", enabled = false },
  {
    "saghen/blink.cmp",
    opts = {
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
            enabled = false,
          },
        },
        menu = {
          draw = {
            treesitter = true,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          treesitter_highlighting = true,
          window = {
            -- winhighlight = require("ashen.plugins.blink").winhighlight,
            -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
        ghost_text = {
          enabled = true,
        },
      },

      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-CR>"] = { "select_and_accept", "fallback" },
        -- ["<C-l>"] = { "select_prev", "fallback" },
        -- ["<C-h>"] = { "select_next", "fallback" },
        -- ["<C-L>"] = { "scroll_documentation_up" },
        -- ["<C-H>"] = { "scroll_documentation_down" },
        -- ["<Up>"] = {},
        -- ["<Down>"] = {},
      },
    },
  },
}
