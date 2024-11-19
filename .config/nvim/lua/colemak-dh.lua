local M = {}

local map = vim.keymap.set
local wk = require("which-key")

local wk_presets = {
  text_objects = {
    mode = { "o", "x" },
    { "l", group = "inside" },
    { 'l"', desc = 'inner " string' },
    { "l'", desc = "inner ' string" },
    { "l(", desc = "inner [(])" },
    { "l)", desc = "inner [(])" },
    { "l<", desc = "inner <>" },
    { "l>", desc = "inner <>" },
    { "lB", desc = "inner [{]}" },
    { "lW", desc = "inner WORD" },
    { "l[", desc = "inner []" },
    { "l]", desc = "inner []" },
    { "l`", desc = "inner ` string" },
    { "lb", desc = "inner [(])" },
    { "lp", desc = "inner paragraph" },
    { "ls", desc = "inner sentence" },
    { "lt", desc = "inner tag block" },
    { "lw", desc = "inner word" },
    { "l{", desc = "inner [{]}" },
    { "l}", desc = "inner [{]}" },
  },
  motions = {
    mode = { "o", "x", "n" },
    { "$", desc = "End of line" },
    { "%", desc = "Matching (){}[]" },
    { "0", desc = "Start of line" },
    { "F", desc = "Move to prev char" },
    { "G", desc = "Last line" },
    { "T", desc = "Move before prev char" },
    { "^", desc = "Start of line (non ws)" },
    { "b", desc = "Prev word" },
    { "k", desc = "Next end of word" },
    { "f", desc = "Move to next char" },
    { "gh", desc = "Prev end of word" },
    { "gg", desc = "First line" },
    { "m", desc = "Left" },
    { "n", desc = "Down" },
    { "e", desc = "Up" },
    { "i", desc = "Right" },
    { "t", desc = "Move before next char" },
    { "w", desc = "Next word" },
    { "{", desc = "Prev empty line" },
    { "}", desc = "Next empty line" },
    { ";", desc = "Next ftFT" },
    { ",", desc = "Prev ftFT" },
    { "/", desc = "Search forward" },
    { "?", desc = "Search backward" },
    { "B", desc = "Prev WORD" },
    { "H", desc = "Next end of WORD" },
    { "W", desc = "Next WORD" },
  },
  windows = {
    mode = { "n", "x" },
    { "<c-w>", group = "window" },
    { "<c-w>+", desc = "Increase height" },
    { "<c-w>-", desc = "Decrease height" },
    { "<c-w><", desc = "Decrease width" },
    { "<c-w>=", desc = "Equally high and wide" },
    { "<c-w>>", desc = "Increase width" },
    { "<c-w>T", desc = "Break out into a new tab" },
    { "<c-w>_", desc = "Max out the height" },
    { "<c-w>m", desc = "Go to the left window" },
    { "<c-w>n", desc = "Go to the down window" },
    { "<c-w>e", desc = "Go to the up window" },
    { "<c-w>i", desc = "Go to the right window" },
    { "<c-w>o", desc = "Close all other windows" },
    { "<c-w>q", desc = "Quit a window" },
    { "<c-w>s", desc = "Split window" },
    { "<c-w>v", desc = "Split window vertically" },
    { "<c-w>w", desc = "Switch windows" },
    { "<c-w>x", desc = "Swap current with next" },
    { "<c-w>|", desc = "Max out the width" },
  },
}

M.fix_window_nav = function()
  map({ "n", "x" }, "<C-m>", "<C-w>h", { desc = "Switch to left window", remap = false })
  map({ "n", "x" }, "<C-n>", "<C-w>j", { desc = "Switch to down window", remap = false })
  map({ "n", "x" }, "<C-e>", "<C-w>k", { desc = "Switch to up window", remap = false })
  map({ "n", "x" }, "<C-i>", "<C-w>l", { desc = "Switch to right window", remap = false })
end

M.fix_whichkey_presets = function()
  -- print(vim.inspect(wk_presets))
  for _, tbl in pairs(wk_presets) do
    wk.add(tbl)
  end
end

M.fix_hjkl = function()
  map({ "n" }, "M", "<cmd>bprevious<cr>", { desc = "Previous Buffer", remap = false })
  map({ "n", "x", "o" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down", remap = false })
  map({ "n", "x", "o" }, "m", "h", { desc = "Left", remap = false })
  map({ "n", "x", "o" }, "n", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down", remap = false })
  map({ "n", "x", "o" }, "N", "J", { desc = "Down", remap = false })
  map({ "n", "x", "o" }, "e", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up", remap = false })
  map({ "n", "x", "o" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up", remap = false })
  map({ "n", "x", "o" }, "E", "K", { desc = "Up", remap = false })
  map({ "n", "x", "o" }, "i", "l", { desc = "Right", remap = false })
  map({ "n", "x", "o" }, "gh", "ge", { remap = false })
  map({ "n" }, "I", "<cmd>bprevious<cr>", { desc = "Next Buffer", remap = false })

  map({ "n", "x", "o" }, "l", "i", { desc = "Insert", remap = false })
  map({ "n", "x", "o" }, "L", "I", { desc = "Insert Start Of Line", remap = false })
  map({ "n", "x", "o" }, "k", "m", { desc = "Marker", remap = false })
  map({ "n", "x", "o" }, "K", "M", { desc = "Marker", remap = false })
  map({ "n", "x", "o" }, "h", "e", { desc = "End of word", remap = false })
  map({ "n", "x", "o" }, "H", "E", { desc = "End of WORD", remap = false })

  map("n", "j", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
  map("x", "j", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
  map("o", "j", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
  map("n", "J", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
  map("x", "J", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
  map("o", "J", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
  -- map({ "n", "x", "o" }, "j", "n", { desc = "Repeat search", remap = false })
  -- map({ "n", "x", "o" }, "J", "N", { desc = "Repeat search backwards", remap = false })
end

M.fix_all = function()
  M.fix_whichkey_presets()
  M.fix_hjkl()
  M.fix_window_nav()
end

return M
