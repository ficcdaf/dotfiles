return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>mp",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
  config = function()
    vim.cmd([[do FileType]])
    local mdscrolltoggle = Snacks.toggle.new({
      name = "Markdown Preview Scroll",
      -- map = vim.keymap.set,
      which_key = true,
      get = function()
        return vim.g.mkdp_preview_options.disable_sync_scroll == 0
      end,
      notify = true,
      set = function(state)
        if state then
          vim.cmd("let g:mkdp_preview_options['disable_sync_scroll'] = 0")
        else
          vim.cmd("let g:mkdp_preview_options['disable_sync_scroll'] = 1")
        end
      end,
    })
    -- Snacks.toggle.map(mdscrolltoggle, "<leader>mP", { desc = "Toggle Markdown Preview Scroll" })
  end,
}
