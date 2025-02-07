local M = {}

M.map = {
  m = "h",
  n = "j",
  e = "k",
  i = "l",
  h = "i",
  j = "n",
  k = "m",
  l = "e",
}

M.modes = {
  "n",
  "x",
  "v",
  "o",
}

local mods = {
  "<C-",
  "<M-",
  "<S-",
  "<C-M-",
  "<C-S-",
  "<M-S-",
  "<C-M-S-",
}

local get_permutations = function(key)
  local s = string
  local out = {}
  table.insert(out, key)
  table.insert(out, s.upper(key))
  for _, mod in ipairs(mods) do
    table.insert(out, mod .. key .. ">")
  end
  return out
end

local opts = { noremap = true }

local function set(lhs, rhs)
  vim.keymap.set(M.modes, lhs, rhs, opts)
end

M.init = function()
  for lhs, rhs in pairs(M.map) do
    local perms = get_lhs_permutations(lhs)
  end
end
