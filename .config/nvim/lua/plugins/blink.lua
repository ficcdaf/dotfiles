local follow_main = false
if follow_main then
  vim.g.lazyvim_blink_main = true
end

return {
  -- { "giuxtaposition/blink-cmp-copilot", enabled = false },
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
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
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
        ghost_text = {
          enabled = vim.g.ai_cmp,
        },
      },

      keymap = {
        preset = "default",
        -- ["<Tab>"] = {
        --   LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
        --   "fallback",
        -- },
        ["<C-Cr>"] = { "select_and_accept", "fallback" },
        ["<C-l>"] = { "select_prev" },
        ["<C-h>"] = { "select_next" },
        ["<C-L>"] = { "scroll_documentation_up" },
        ["<C-H>"] = { "scroll_documentation_down" },
        ["<Up>"] = { "fallback" },
        ["<Down>"] = { "fallback" },
      },
    },
  },
}
