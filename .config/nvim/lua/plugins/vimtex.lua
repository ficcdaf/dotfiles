return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.vimtex_viewer_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_quickfix_open_on_warning = 0
      -- vim.g.vimtex_compiler_silent = 1
      -- vim.g.vimtex_compiler_method = "tectonic"
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtex" },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        -- requires install via AUR
        -- TODO: add to mason registry?
        tex = { "tex-fmt" },
      },
    },
  },
}
