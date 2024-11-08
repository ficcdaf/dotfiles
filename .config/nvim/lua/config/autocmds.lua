-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.cmd("let &t_ut=''")
vim.opt_local.breakindent = true
vim.opt_local.wrap = true
local md_tex = function()
  -- vim.cmd("syn region markdownMathInline matchgroup=texMathZone start=/$/ end=/$/ contains=@texMath")
  -- vim.cmd("syn match markdownMathInline '$[^$].{-}$' contains=@texMath")
  -- vim.cmd("syn region markdownMathBlock matchgroup=texMathZone start=/$$/ end=/$$/ contains=@texMath")
  -- vim.cmd("syn include @texMath syntax/tex.vim")
  -- Include the tex syntax for use within markdown
  vim.cmd("syntax include @tex syntax/tex.vim")

  -- Define the inline math region and allow it to contain tex syntax
  vim.cmd("syntax region texMathZone start=/\\$/ end=/\\$/ contained contains=@tex")

  -- Define the display math region and allow it to contain tex syntax
  vim.cmd("syntax region texMathDisplay start=/\\$\\$/ end=/\\$\\$/ contained contains=@tex")

  -- Optionally, conceal the `$` symbols for cleaner display
  vim.opt.conceallevel = 2
  vim.cmd("syntax region texMathZone start=/\\$/ skip=/\\\\\\$/ end=/\\$/ concealends contained")
  vim.cmd("syntax region texMathDisplay start=/\\$\\$/ end=/\\$\\$/ concealends contained")
end
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.cmd([[
    syn region math start=/\$\$/ end=/\$\$/
    " inline math
    syn match math '\$[^$].\{-}\$'

    " actually highlight the region we defined as "math"
    hi link math Statement
  ]])
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.breakindent = true
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    -- local secondary = "#379393"
    -- local primary = "#933737"
    local colorbuddy = require("colorbuddy")
    local colors = colorbuddy.colors
    vim.api.nvim_set_hl(0, "ObsidianRefText", { fg = colors.secondary:to_vim(), bold = true, underline = true })
    vim.api.nvim_set_hl(0, "ObsidianRef", { fg = colors.secondary:to_vim(), bold = true, underline = true })
    vim.api.nvim_set_hl(0, "ObsidianBullet", { fg = colors.complement:to_vim(), bold = true, underline = false })
    vim.api.nvim_set_hl(0, "ObsidianDone", { fg = colors.complement:to_vim(), bold = true, underline = false })
    vim.api.nvim_set_hl(0, "ObsidianTodo", { fg = colors.complement:to_vim(), bold = true, underline = false })
    vim.api.nvim_set_hl(0, "obsidiantag", { fg = colors.complement:to_vim(), bold = false, italic = true })
    vim.api.nvim_set_hl(0, "ObsidianTag", { fg = colors.complement:to_vim(), bold = false, italic = true })
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
