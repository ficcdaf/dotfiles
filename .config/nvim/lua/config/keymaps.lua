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
-- map({ "n" }, "<C-Cr>", function()
--   vim.notify("test")
-- end)

map({ "n", "x" }, "\\", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- preserve indent on insert
map({ "n" }, "i", "i<C-f>")
map({ "n" }, "<leader><Tab>n", "<CMD>tabnew<Cr>", { desc = "New Tab" })
map({ "n" }, "<leader><Tab>i", "<CMD>tabnext<Cr>", { desc = "Next Tab" })
map({ "n" }, "<leader><Tab>m", "<CMD>tabprevious<Cr>", { desc = "Previous Tab" })
map({ "n" }, "<leader><Tab>D", "<CMD>tabonly<Cr>", { desc = "Close Other Tabs" })
vim.keymap.del("n", "<leader><Tab>f")
vim.keymap.del("n", "<leader><Tab>l")
vim.keymap.del("n", "<leader><Tab>[")
vim.keymap.del("n", "<leader><Tab>]")
vim.keymap.del("n", "<leader><Tab>o")
vim.keymap.del("n", "<leader><Tab><Tab>")

map({ "n" }, "<M-c>", function()
  -- the `a` is necessary to return the cursor to the same
  -- position it was before
  vim.cmd("normal! zz")
end, { remap = false, noremap = true, desc = "Center Screen" })
map({ "i" }, "<M-c>", function()
  -- the `a` is necessary to return the cursor to the same
  -- position it was before
  vim.api.nvim_input("<Esc>zza")
end, { remap = false, noremap = true, desc = "Center Screen (Insert mode)" })

map("n", "<C-z>", "<CMD>stop<CR>", { desc = "Suspend" })

map({ "n", "i", "x", "o" }, "<C-c>", "<Esc>", { noremap = true, desc = "Escape" })

-- Better Scroll

map({ "n" }, "<C-e>", "<C-y>", { noremap = true, desc = "Scroll Up" })
map({ "n" }, "<C-n>", "<C-e>", { noremap = true, desc = "Scroll Down" })

-- Snacks.toggle.zen():map("<leader>uz")
map({ "n" }, "cl", "vgu", { noremap = true, desc = "Lowercase current char" })
map({ "n" }, "cu", "vgU", { noremap = true, desc = "Uppercase current char" })
-- Bind arrows to hjkl to my colemak-dh motions work as expected
map({ "n", "x" }, "<Up>", "k", { desc = "Up", remap = true })
map({ "n", "x" }, "<Down>", "j", { desc = "Down", remap = true })
map({ "n", "x" }, "<Left>", "h", { desc = "Left", remap = true })
map({ "n", "x" }, "<Right>", "l", { desc = "Right", remap = true })

-- map({ "n", "t", "i" }, "<C-Left>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Switch Window Left", remap = true })
-- map({ "n", "t", "i" }, "<C-Right>", "<cmd> TmuxNavigateRight<CR>", { desc = "Switch Window Right", remap = true })
-- map({ "n", "t", "i" }, "<C-Up>", "<cmd> TmuxNavigateUp<CR>", { remap = true })
-- map({ "n", "t", "i" }, "<C-Down>", "<cmd> TmuxNavigateDown<CR>", { desc = "Switch Window Down", remap = true })
map({ "n", "t", "i" }, "<C-Left>", "<C-w>h", { desc = "Switch Window Left", remap = true })
map({ "n", "t", "i" }, "<C-Right>", "<C-w>l", { desc = "Switch Window Right", remap = true })
map({ "n", "t", "i" }, "<C-Up>", "<C-w>k", { remap = true })
map({ "n", "t", "i" }, "<C-Down>", "<C-w>j", { desc = "Switch Window Down", remap = true })
map({ "n" }, "<C-w>d", "<C-w>q", { desc = "Close window", remap = true })

map({ "x" }, "<M-Left>", "<M-h>", { remap = true })
map({ "x" }, "<M-Right>", "<M-l>", { remap = true })
map({ "n", "x", "v" }, "<M-Up>", "<M-k>", { remap = true })
map({ "n", "x", "v" }, "<M-Down>", "<M-j>", { remap = true })
-- map({ "n" }, "<S-Left>", "[b", { desc = "Previous Buffer", remap = true })
map({ "n" }, "<S-Left>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Previous Buffer", remap = true })
-- map({ "n" }, "<S-Right>", "]b", { desc = "Next Buffer", remap = true })
map({ "n" }, "<S-Right>", "<CMD>BufferLineCycleNext<CR>", { desc = "Next Buffer", remap = true })
-- map({ "n" }, "<S-Down>", "5j", { remap = true })
-- map({ "n" }, "<S-Up>", "5k", { remap = true })
map({ "i" }, "<M-e>", "<Esc>", { desc = "Escape insert mode", remap = true })

-- better navigation
map({ "n" }, "<C-u>", "<C-u>zz", { remap = false })
map({ "n" }, "<C-d>", "<C-d>zz", { remap = false })
map({ "n" }, "n", "nzz", { remap = false })
map({ "n" }, "N", "Nzz", { remap = false })
map({ "n" }, "{", "{zz", { remap = false })
map({ "n" }, "}", "}zz", { remap = false })
map({ "n" }, "<PageDown>", "<Down>zz", { remap = false })
map({ "n" }, "<PageUp>", "<Up>zz", { remap = false })
map({ "n", "x" }, "<M-i>", "$", { remap = false })
map({ "n", "x" }, "<M-m>", "0", { remap = false })

-- easily access null register
-- map({ "n", "x" }, "<leader>n", '"_', { remap = false, silent = true, desc = "Null Register" })
map({ "n", "x", "v", "o" }, "<BS>", '"_', { remap = false, silent = true, desc = "Null Register" })

-- remove the default lazyvim, and also swap H and L (for move cursor) to make more sense on colemak
vim.keymap.del({ "n" }, "<S-h>")
vim.keymap.del({ "n" }, "<S-l>")
map({ "n" }, "<S-h>", "L", { remap = false })
map({ "n" }, "<S-l>", "H", { remap = false })
-- better delete and put

-- Duplicate and comment line
map({ "n" }, "<leader>yc", '"zyygcc"zp', { remap = true, silent = true, desc = "Duplicate and comment line" })

-- better quit
map("n", "<C-q>", "<cmd>qa<cr>", { desc = "Quit All" })
map({ "n", "x" }, "<C-i>", "<C-a>", { desc = "Increment" })
map({ "n", "x" }, "<C-a>", "<C-x>", { desc = "Decrement" })
map("n", "<C-x>", function()
  Snacks.bufdelete()
end, { remap = false, desc = "Delete Buffer" })
map("n", "<C-S-X>", "<CMD>bd<CR>", { desc = "Delete buffer and window" })
map("n", "<C-S-W>", "<C-w>c", { desc = "Close window" })
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
-- map("n", "<leader><leader>x", "<CMD>source %<CR>", { desc = "Source current file" })

-- Obsidian
-- <leader>o is the prefix for all Obsidian bindings

wk.add({
  { "<leader>O", group = "Obsidian" },
  { "<leader>Od", group = "Daily Note" },
  { "<leader>Ol", group = "Follow Link" },
})

map("n", "<leader>Oo", "<CMD>ObsidianQuickSwitch<CR>", { desc = "Obsidian Quick Switch" })
map("n", "<leader>O/", "<CMD>ObsidianSearch<CR>", { desc = "Obsidian Grep" })
-- This one will open the command line and let the user type the arg
map("n", "<leader>On", "<CMD>ObsidianNew<CR>", { desc = "Obsidian New Note" })
-- map("n", "<leader>On", function()
--   require("command-key").command("ObsidianNew")
-- end, { desc = "Obsidian New Note" })
map("n", "<leader>Ob", "<CMD>ObsidianBacklinks<CR>", { desc = "Obsidian Backlinks" })
map("n", "<leader>Ot", "<CMD>ObsidianTags<CR>", { desc = "Obsidian Tags" })
map("n", "<leader>Olv", "<CMD>ObsidianFollowLink vsplit<CR>", { desc = "Obsidian Follow Link Vsplit" })
map("n", "<leader>Olh", "<CMD>ObsidianFollowLink hsplit<CR>", { desc = "Obsidian Follow Link Hsplit" })
map("n", "<leader>Odt", "<CMD>ObsidianToday<CR>", { desc = "Obsidian Open Today's Daily" })
map("n", "<leader>Ods", "<CMD>ObsidianDailies<CR>", { desc = "Obsidian Search Dailies" })
map("n", "<leader>Ols", "<CMD>ObsidianLinks<CR>", { desc = "Obsidian Search Links" })
map("x", "<leader>Oll", function()
  require("command-key").command("ObsidianLink")
end, { desc = "Obsidian Link Visual To Existing Note" })
map("x", "<leader>Oln", function()
  require("command-key").command("ObsidianLinkNew")
end, { desc = "Obsidian Link Visual To New Note" })
map("x", "<leader>Ole", function()
  require("command-key").command("ObsidianExtractNote")
end, { desc = "Obsidian Copy Selection To New Note & Link" })

map("n", "<leader>Or", function()
  require("command-key").command("ObsidianRename")
end, { desc = "Obsidian Rename" })
map("n", "<leader>Oc", "<CMD>ObsidianTOC<CR>", { desc = "Obsidian Table Of Contents" })
-- TODO: Add binds for templates
-- cmdh.fix_hjkl()
-- cmdh.fix_all()
