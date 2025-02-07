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
  -- "n",
  -- "x",
  -- "v",
  -- "o",
  "n",
  "v",
  "x",
  "s",
  "o",
}

local mods = {
  "<C-",
  "<M-",
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

local function set(lhs, rhs)
  vim.keymap.set(M.modes, lhs, rhs, { noremap = true })
end

M.init = function()
  local out = {}
  for lhs, rhs in pairs(M.map) do
    local lhs_perms = get_permutations(lhs)
    local rhs_perms = get_permutations(rhs)
    for i, l in ipairs(lhs_perms) do
      local r = rhs_perms[i]
      out[l] = r
      set(l, r)
    end
  end
  return out
end

return M
