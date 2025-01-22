-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.scrolloff = 2
-- vim.api.nvim_set_hl(0, "OrgBulletsDash", { fg = "#FFFFFF" })

vim.g.maplocalleader = ","
vim.g.lazyvim_python_lsp = "basedpyright"
-- vim.g.lazyvim_rust_diagnostics = "bacon-ls"
vim.g.ai_cmp = false
vim.g.snacks_animate = false
opt.spell = true
opt.wrap = true
-- opt.spelllang = { "en", "en-academic" }
opt.spelllang = { "en" }
-- opt.spelloptions = "camel"
opt.clipboard = "unnamedplus"
