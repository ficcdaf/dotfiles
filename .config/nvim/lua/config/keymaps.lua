-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local wk = require("which-key")

-- unbind ctrl S since it's tmux prefix
-- vim.keymap.del({ "i", "n" }, "<C-t>")
vim.keymap.set({ "i", "n" }, "<C-t>", "<Nop>")

local dirmap = {
  up = "w0",
  down = "w$",
}

local function move_cursor_to(direction) end

-- TODO: finish this
-- local function scroll(direction)
--   -- current window for now; could extend later
--   local win_id = 0
--   -- in form {line, column}
--   local current_cursor = vim.api.nvim_win_get_cursor(win_id)
--
--   -- this is the height of the window in lines
--   local win_height = vim.api.nvim_win_get_height(win_id)
--
--   local new_top = vim.fn.line(dirmap[direction])
--
-- end

-- Bind arrows to hjkl to my colemak-dh motions work as expected
map({ "n", "x" }, "<Up>", "k", { desc = "Up", remap = true })
map({ "n", "x" }, "<Down>", "j", { desc = "Down", remap = true })
map({ "n", "x" }, "<Left>", "h", { desc = "Left", remap = true })
map({ "n", "x" }, "<Right>", "l", { desc = "Right", remap = true })

map({ "n", "t", "i" }, "<C-Left>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Switch Window Left", remap = true })
map({ "n", "t", "i" }, "<C-Right>", "<cmd> TmuxNavigateRight<CR>", { desc = "Switch Window Right", remap = true })
map({ "n", "t", "i" }, "<C-Up>", "<cmd> TmuxNavigateUp<CR>", { remap = true })
map({ "n", "t", "i" }, "<C-Down>", "<cmd> TmuxNavigateDown<CR>", { desc = "Switch Window Down", remap = true })

-- map("n", "^M", function()
--   print("testing?")
--   Snacks.terminal(nil, { cwd = LazyVim.root() })
-- end, { remap = false, desc = "Terminal (Root Dir)" })
-- map("t", "^M", "<cmd>close<cr>", { remap = false, desc = "Hide Terminal" })
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
-- map({ "n" }, "dT", "dvT", { remap = false })
-- map({ "n", "x" }, "<leader>p", '"_p', { remap = false })
-- map({ "n", "x" }, "<leader>P", '"_P', { remap = false })
-- map({ "n", "x" }, "<leader>d", '"_d', { remap = false })
-- map({ "n", "x" }, "<leader>dd", '"_dd', { remap = false })
-- map({ "n", "x" }, "<leader>D", '"_D', { remap = false })

-- yank history
map({ "n", "x" }, "<leader>fp", function()
  if LazyVim.pick.picker.name == "telescope" then
    require("telescope").extensions.yank_history.yank_history({})
  else
    vim.cmd([[YankyRingHistory]])
  end
end, { desc = "Open Yank History", remap = false })

-- <PageDown><PageUp>

-- Remap spelling suggestions
-- map({ "n" }, "z-", "z=", { desc = "Spelling Suggestions", remap = true })

-- Oil.nvim open parent directory
-- map("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })

-- TODO: add leader + y for save current buf, leader + Y to write all
map({ "n", "x" }, "<leader>y", "<CMD>w<CR>", { desc = "Save" })
map({ "n", "x" }, "<leader>Y", "<CMD>wa<CR>", { desc = "Save All" })

-- Zen Mode
map("n", "<leader>uz", "<CMD>ZenMode<CR>", { desc = "Toggle Zen Mode" })

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
map("n", "<leader>on", function()
  require("command-key").command("ObsidianNew")
end, { desc = "Obsidian New Note" })
map("n", "<leader>ob", "<CMD>ObsidianBacklinks<CR>", { desc = "Obsidian Backlinks" })
-- map("n", "<leader>ot", function()
--   require("command-key").command("ObsidianTags")
-- end, { desc = "Obsidian Tags" })

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
