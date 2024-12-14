-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

local map = vim.keymap.set

-- required to remap special sequence
-- when inside tmux :)
-- require("tmux-remap").setup({
--   special = "←",
--   remap = "<C-Cr>",
--   autoset = true,
-- })

local special_key = "←"
vim.keymap.set({ "n", "i" }, special_key, "<C-CR>", { remap = true })

vim.keymap.set({ "i", "n" }, "<C-t>", "<Nop>")

map({ "n" }, "cu", "vgu", { desc = "Lowercase current char" })
map({ "n" }, "cU", "vgU", { desc = "Uppercase current char" })
-- Bind arrows to hjkl to my colemak-dh motions work as expected
map({ "n", "x" }, "<Up>", "k", { desc = "Up", remap = true })
map({ "n", "x" }, "<Down>", "j", { desc = "Down", remap = true })
map({ "n", "x" }, "<Left>", "h", { desc = "Left", remap = true })
map({ "n", "x" }, "<Right>", "l", { desc = "Right", remap = true })

map({ "n", "t", "i" }, "<C-Left>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Switch Window Left", remap = true })
map({ "n", "t", "i" }, "<C-Right>", "<cmd> TmuxNavigateRight<CR>", { desc = "Switch Window Right", remap = true })
map({ "n", "t", "i" }, "<C-Up>", "<cmd> TmuxNavigateUp<CR>", { remap = true })
map({ "n", "t", "i" }, "<C-Down>", "<cmd> TmuxNavigateDown<CR>", { desc = "Switch Window Down", remap = true })

map({ "x" }, "<M-Left>", "<M-h>", { remap = true })
map({ "x" }, "<M-Right>", "<M-l>", { remap = true })
map({ "n", "x", "v" }, "<M-Up>", "<M-k>", { remap = true })
map({ "n", "x", "v" }, "<M-Down>", "<M-j>", { remap = true })
map({ "n" }, "<S-Left>", "[b", { desc = "Previous Buffer", remap = true })
map({ "n" }, "<S-Right>", "]b", { desc = "Next Buffer", remap = true })
map({ "n" }, "<S-Down>", "5j", { remap = true })
map({ "n" }, "<S-Up>", "5k", { remap = true })
map({ "i" }, "<M-e>", "<Esc>", { desc = "Escape insert mode", remap = true })

-- better navigation
map({ "n" }, "<C-u>", "<C-u>zz", { remap = false })
map({ "n" }, "<C-d>", "<C-d>zz", { remap = false })
map({ "n" }, "n", "nzz", { remap = false })
map({ "n" }, "N", "Nzz", { remap = false })
map({ "n" }, "<PageDown>", "<Down>zz", { remap = false })
map({ "n" }, "<PageUp>", "<Up>zz", { remap = false })
map({ "n", "x" }, "<M-i>", "$", { remap = false })
map({ "n", "x" }, "<M-m>", "0", { remap = false })

-- easily access null register
map({ "n", "x" }, "<leader>n", '"_', { remap = false, silent = true, desc = "Null Register" })

-- remove the default lazyvim, and also swap H and L (for move cursor) to make more sense on colemak
vim.keymap.del({ "n" }, "<S-h>")
vim.keymap.del({ "n" }, "<S-l>")
map({ "n" }, "<S-h>", "L", { remap = false })
map({ "n" }, "<S-l>", "H", { remap = false })
-- better delete and put

-- Duplicate and comment line
map({ "n" }, "<leader>yc", '"zyygcc"zp', { remap = true, silent = true, desc = "Duplicate and comment line" })

-- local function is_lsp_attached()
--   local clients = vim.lsp.get_clients({ bufnr = 0 })
--   print(#clients .. " clients found")
--   return #clients > 0
-- end
--
-- local lsptoggle = Snacks.toggle.new({
--   name = "Lsp",
--   -- map = vim.keymap.set,
--   which_key = true,
--   get = function()
--     return not is_lsp_attached()
--   end,
--   notify = true,
--   set = function(state)
--     if state then
--       -- vim.cmd("LspStart")
--       print("we start lsp...")
--     else
--       -- vim.cmd("LspStop")
--       print("We stop lsp...")
--     end
--   end,
-- })
-- Snacks.toggle.map(lsptoggle, "<leader>cL", { desc = "Toggle LSP" })

-- better quit
map("n", "<C-q>", "<cmd>qa<cr>", { desc = "Quit All" })
map({ "n", "x" }, "<C-i>", "<C-a>", { desc = "Increment" })
map({ "n", "x" }, "<C-a>", "<C-x>", { desc = "Decrement" })
map("n", "<C-x>", function()
  Snacks.bufdelete()
end, { remap = false, desc = "Delete Buffer" })

-- yank history
map({ "n", "x" }, "<leader>fp", function()
  if LazyVim.pick.picker.name == "telescope" then
    require("telescope").extensions.yank_history.yank_history({})
  else
    vim.cmd([[YankyRingHistory]])
  end
end, { desc = "Open Yank History", remap = false })
-- TODO: add leader + y for save current buf, leader + Y to write all
-- map({ "n", "x" }, "<leader>y", ":w<CR>", { desc = "Save" })
map({ "n", "x" }, "<leader>Y", ":wa<CR>", { desc = "Save All" })

-- Zen Mode
-- map("n", "<leader>uz", "<CMD>ZenMode<CR>", { desc = "Toggle Zen Mode" })

-- Source Current File
map("n", "<leader><leader>x", "<CMD>source %<CR>", { desc = "Source current file" })

-- Obsidian
-- <leader>o is the prefix for all Obsidian bindings

wk.add({
  { "<leader>o", group = "Obsidian" },
  { "<leader>od", group = "Daily Note" },
  { "<leader>ol", group = "Follow Link" },
})

map("n", "<leader>oo", "<CMD>ObsidianQuickSwitch<CR>", { desc = "Obsidian Quick Switch" })
map("n", "<leader>o/", "<CMD>ObsidianSearch<CR>", { desc = "Obsidian Grep" })
-- This one will open the command line and let the user type the arg
map("n", "<leader>on", "<CMD>ObsidianNew<CR>", { desc = "Obsidian New Note" })
-- map("n", "<leader>on", function()
--   require("command-key").command("ObsidianNew")
-- end, { desc = "Obsidian New Note" })
map("n", "<leader>ob", "<CMD>ObsidianBacklinks<CR>", { desc = "Obsidian Backlinks" })
map("n", "<leader>ot", "<CMD>ObsidianTags<CR>", { desc = "Obsidian Tags" })
map("n", "<leader>olv", "<CMD>ObsidianFollowLink vsplit<CR>", { desc = "Obsidian Follow Link Vsplit" })
map("n", "<leader>olh", "<CMD>ObsidianFollowLink hsplit<CR>", { desc = "Obsidian Follow Link Hsplit" })
map("n", "<leader>odt", "<CMD>ObsidianToday<CR>", { desc = "Obsidian Open Today's Daily" })
map("n", "<leader>ods", "<CMD>ObsidianDailies<CR>", { desc = "Obsidian Search Dailies" })
map("n", "<leader>ols", "<CMD>ObsidianLinks<CR>", { desc = "Obsidian Search Links" })
map("x", "<leader>oll", function()
  require("command-key").command("ObsidianLink")
end, { desc = "Obsidian Link Visual To Existing Note" })
map("x", "<leader>oln", function()
  require("command-key").command("ObsidianLinkNew")
end, { desc = "Obsidian Link Visual To New Note" })
map("x", "<leader>ole", function()
  require("command-key").command("ObsidianExtractNote")
end, { desc = "Obsidian Copy Selection To New Note & Link" })

map("n", "<leader>or", function()
  require("command-key").command("ObsidianRename")
end, { desc = "Obsidian Rename" })
map("n", "<leader>oc", "<CMD>ObsidianTOC<CR>", { desc = "Obsidian Table Of Contents" })
-- TODO: Add binds for templates
-- cmdh.fix_hjkl()
-- cmdh.fix_all()
