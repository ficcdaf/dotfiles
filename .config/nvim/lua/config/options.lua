-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.scrolloff = 0

opt.spell = true
table.insert(opt.spelllang, -1, "academic")
-- opt.spelloptions = "camel"
