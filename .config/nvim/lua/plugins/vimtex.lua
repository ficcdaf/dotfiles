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
      -- format_on_save = function(bufnr)
      --   local ignore_filetypes = {"tex"}
      --   if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      --     return
      --   end
      --   -- Disable with a global or buffer-local variable
      --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      --     return
      --   end
      --   -- Disable autoformat for files in a certain path
      --   local bufname = vim.api.nvim_buf_get_name(bufnr)
      --   if bufname:match("/node_modules/") then
      --     return
      --   end
      --   -- ...additional logic...
      --   return { timeout_ms = 500, lsp_format = "fallback" }
      -- end,
      formatters_by_ft = {
        -- requires install via AUR
        -- TODO: add to mason registry?
        tex = { "tex-fmt" },
      },
    },
  },
}
