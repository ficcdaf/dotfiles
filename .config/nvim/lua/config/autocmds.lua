-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     local cl = require("colorbuddy")
--     cl.Group.new("@variable", cl.colors.primary)
--     cl.Group.new("@string", cl.colors.secondary)
--     cl.Group.new("@keyword", cl.colors.complement)
--     cl.Group.new("@keyword.operator", cl.colors.complement)
--     cl.Group.new("@constant.builtin", cl.colors.complement)
--   end,
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "tex",
--   callback = function()
--     vim.cmd([[
--             syntax match texMathSymbol "\\oplus" conceal cchar=⊕
--         ]])
--   end,
-- })
-- This autocommand fixes syntax highlighting for inline math in markdown files
-- Together with vimtex, it will apply very sexy good stuff here!
-- vim.api.nvim_create_autocmd("FileType", {
--   patterm = "tex",
--   callback = function()
--     vim.api.nvim_create_autocmd("BufWrite", {
--       buffer = 0,
--       callback = function()
--         vim.api.nvim_command("VimtexCompile")
--       end,
--     })
--   end,
-- })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.cmd([[
    syn region mathBlock start=/\$\$/ end=/\$\$/ contains=@tex
    " inline math
    syn match mathInline '\$[^$].\{-}\$' contains=@tex
    " actually highlight the region we defined as "math"
    syn include @tex syntax/tex.vim
    hi def link mathBlock Statement
    hi def link mathInline Statement
  ]])
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    -- We want markdown files to autosave
    vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
      buffer = 0,
      command = "silent! write",
    })
    vim.keymap.set("i", "<Cr>", function()
      local md_utils = require("md-utils")
      local isList = md_utils.isCursorInList()
      if isList then
        vim.api.nvim_command("MDListItemBelow")
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true)
      end
    end, { desc = "Continue List", silent = true, remap = true })
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
    -- local secondary = "#379393"
    -- local primary = "#933737"
    -- local colorbuddy = require("colorbuddy")
    -- local colors = colorbuddy.colors
    -- vim.api.nvim_set_hl(0, "ObsidianRefText", { fg = colors.secondary:to_vim(), bold = true, underline = true })
    -- vim.api.nvim_set_hl(0, "ObsidianRef", { fg = colors.secondary:to_vim(), bold = true, underline = true })
    -- vim.api.nvim_set_hl(0, "ObsidianBullet", { fg = colors.complement:to_vim(), bold = true, underline = false })
    -- vim.api.nvim_set_hl(0, "ObsidianDone", { fg = colors.complement:to_vim(), bold = true, underline = false })
    -- vim.api.nvim_set_hl(0, "ObsidianTodo", { fg = colors.complement:to_vim(), bold = true, underline = false })
    -- vim.api.nvim_set_hl(0, "obsidiantag", { fg = colors.complement:to_vim(), bold = false, italic = true })
    -- vim.api.nvim_set_hl(0, "ObsidianTag", { fg = colors.complement:to_vim(), bold = false, italic = true })
    -- vim.api.nvim_buf_set_keymap(0, "n", "<leader>mc", "gzaiW`", { desc = "Markdown: add Code Surround", silent = true })
    -- vim.api.nvim_buf_set_keymap(0, "n", "<M-n>", "<cmd>normal! <M-n>zz<CR>", { remap = false })
    -- vim.api.nvim_buf_set_keymap(0, "n", "<M-e>", "<cmd>normal! <M-e>zz<CR>", { remap = false })
    -- vim.api.nvim_buf_set_keymap(
    --   0,
    --   "n",
    --   "<leader>mr",
    --   "gzd`",
    --   { desc = "Markdown: delete Code Surround", silent = true }
    -- )
    --   vim.api.nvim_buf_set_keymap(
    --     0,
    --     "i",
    --     "<M-i>",
    --     "__<Left>",
    --     { desc = "Markdown: Italics", noremap = true, silent = true }
    --   )
    --   vim.api.nvim_buf_set_keymap(0, "i", "<M-d>", "- [ ] ", { desc = "Markdown: Task", noremap = true, silent = true })
    --   vim.api.nvim_buf_set_keymap(
    --     0,
    --     "i",
    --     "<M-a>",
    --     "<Esc>I# ",
    --     { desc = "Markdown: Heading", noremap = true, silent = true }
    --   )
    --   vim.api.nvim_buf_set_keymap(
    --     0,
    --     "i",
    --     "<M-r>",
    --     "<Esc>I## ",
    --     { desc = "Markdown: Heading", noremap = true, silent = true }
    --   )
    --   vim.api.nvim_buf_set_keymap(
    --     0,
    --     "i",
    --     "<M-s>",
    --     "<Esc>I### ",
    --     { desc = "Markdown: Heading", noremap = true, silent = true }
    --   )
    --   vim.api.nvim_buf_set_keymap(
    --     0,
    --     "i",
    --     "<M-t>",
    --     "<Esc>I#### ",
    --     { desc = "Markdown: Heading", noremap = true, silent = true }
    --   )
    --   vim.api.nvim_buf_set_keymap(
    --     0,
    --     "i",
    --     "<M-g>",
    --     "<Esc>I##### ",
    --     { desc = "Markdown: Heading", noremap = true, silent = true }
    --   )
    --   vim.api.nvim_buf_set_keymap(
    --     0,
    --     "i",
    --     "<M-b>",
    --     "****<Left><Left>",
    --     { desc = "Markdown: Bold", noremap = true, silent = true }
    --   )
    --   vim.api.nvim_buf_set_keymap(
    --     0,
    --     "i",
    --     "<M-e>",
    --     "<Esc>I- ",
    --     { desc = "Markdown: Bullet Point", noremap = true, silent = true }
    --   )
    --   local wk = require("which-key")
    --   wk.add({
    --     { "<M-i>", mode = "i", desc = "Markdown Italics" },
    --     { "<M-b>", mode = "i", desc = "Markdown Bold" },
    --   })
  end,
})
