vim.opt_local.breakindent = true
vim.opt_local.scrolloff = 4
vim.cmd("setlocal formatoptions-=r")
-- vim.opt_local.number = false
-- vim.opt_local.relativenumber = false
-- vim.opt_local.textwidth = 80
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  buffer = 0,
  command = "silent! write",
})

local function modmap(type, dir)
  local mode = vim.api.nvim_get_mode()
  local level = {
    notsame = {
      map = { "org_mappings.", "_visible_heading" },
      words = {
        next = "next",
        previous = "previous",
      },
    },
    same = {
      map = { "org_mappings.", "_heading_same_level" },
      words = {
        next = "forward",
        previous = "backward",
      },
    },
  }
  local map = level[type].map
  local word = level[type].words[dir]
  require("orgmode").action(map[1] .. word .. map[2])
  if mode.mode == "n" then
    vim.cmd("normal! zz")
  end
end
local override = true
if override then
  vim.keymap.set({ "n", "x" }, "}", function()
    modmap("notsame", "next")
  end, {
    silent = true,
    buffer = true,
  })
  vim.keymap.set({ "n", "x" }, "{", function()
    modmap("notsame", "previous")
  end, {
    silent = true,
    buffer = true,
  })
  vim.keymap.set({ "n", "x" }, "[[", function()
    modmap("same", "previous")
  end, {
    silent = true,
    buffer = true,
  })
  vim.keymap.set({ "n", "x" }, "]]", function()
    modmap("same", "next")
  end, {
    silent = true,
    buffer = true,
  })
end
-- vim.api.nvim_create_autocmd({ "CursorMoved" }, {
--   buffer = 0,
--   callback = function()
--     vim.cmd("normal! zz")
--   end,
-- })
vim.keymap.set("n", "<localleader>f", function()
  vim.cmd("%s/\\s\\+$//e")
end, { desc = "Trim trailing whitespace" })
-- vim.keymap.set("n", "{", "{zz", { remap = true })
-- vim.keymap.set("n", "}", "}zz", { remap = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("%s/\\s\\+$//e")
--   end,
-- })
vim.keymap.set("i", "<S-CR>", function()
  require("orgmode").action("org_mappings.meta_return")
end, {
  silent = true,
  buffer = true,
})
