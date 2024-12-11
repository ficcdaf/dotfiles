-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.scrolloff = 0

opt.spell = true
-- opt.spelllang = vim.tbl_extend("force", opt.spelllang, { "en", "academic" })
opt.spelllang = { "en", "en-academic" }
-- opt.spelloptions = "camel"
